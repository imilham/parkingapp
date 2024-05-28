import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:parking_app/data/models/parking_slot.dart';
import 'package:parking_app/presentation/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:another_dashed_container/another_dashed_container.dart';
import 'package:parking_app/presentation/screens/booking_page/booking_page.dart';
// import 'package:smart_car_parking/pages/booking_page/booking_page.dart';
import '../../constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool valueS1;
  late bool valueS2;

  String slotName = 'A1';

  // get isBooked => null;
  // late TimeOfDay time;

  @override
  void initState() {
    super.initState();
    // Initialize sensor values
    valueS1 = false;
    valueS2 = false;

    readSensorData('SENSOR1');
    readSensorData('SENSOR2');

    // Read initial sensor values
  }

  @override
  Widget build(BuildContext context) {
    var isBooked1 = valueS1;
    var isBooked2 = valueS2;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Parking Application"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 25),
            Row(
              children: [
                Container(
                  width: 180,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Slot 01"),
                      // Text('Time: $time'),
                      if (isBooked1 == true)
                        Image.asset("assets/images/car.png"),
                      if (isBooked1 != true)
                        ElevatedButton(
                          onPressed: () {
                            print(isBooked1);

                            // Handle button press, e.g., navigate to BookingPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookingPageUI(
                                  slotId: '01',
                                  slotName: 'Slot 01',
                                ),
                              ),
                            );
                          },
                          child: const Text('BOOK'),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  width: 180,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Slot 02"),
                      // Text('Time: $time'),
                      if (isBooked2 == true)
                        Image.asset("assets/images/car.png"),
                      if (isBooked2 != true)
                        ElevatedButton(
                          onPressed: () {
                            // Handle button press, e.g., navigate to BookingPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BookingPageUI(
                                  slotId: '02',
                                  slotName: 'Slot 02',
                                ),
                              ),
                            );
                          },
                          child: Text('BOOK'),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void readSensorData(String sensorName) {
    DatabaseReference databaseReference =
        // ignore: deprecated_member_use
        FirebaseDatabase.instance.reference().child(sensorName);

    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      Object? sensorValue = dataSnapshot.value;
      setState(() {
        if (sensorName == 'SENSOR1') {
          valueS1 = sensorValue as bool; // Assuming SENSOR1 value is boolean
        } else if (sensorName == 'SENSOR2') {
          valueS2 = sensorValue as bool; // Assuming SENSOR2 value is boolean
        }
        print('$sensorName: $sensorValue');
      });
    });
  }
}
