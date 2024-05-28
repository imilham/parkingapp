import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:parking_app/presentation/screens/booked_data.dart';
import 'package:parking_app/presentation/screens/booking_page/booking_page.dart';
// import 'package:smart_car_parking/pages/booking_page/booking_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
    // valueS1;
    // valueS2;
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
            const SizedBox(height: 25),
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
                      const Text("Slot 01"),
                      // Text('Time: $time'),
                      if (isBooked1 == true)
                        Image.asset("assets/images/car.png"),
                      if (isBooked1 != true)
                        ElevatedButton(
                          onPressed: () {
                            //print(isBooked1);

                            // Handle button press, e.g., navigate to BookingPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingPageUI(
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
                      //Text("Slot 02"),
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
                                builder: (context) => BookingPageUI(
                                  slotId: '02',
                                  slotName: 'Slot 02',
                                ),
                              ),
                            );
                          },
                          child: const Text('BOOK'),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => BookedDataScreen())),
                  child: const Text('Current Bookings')),
            )
          ],
        ),
      ),
    );
  }

  void readSensorData(String sensorName) {
    //print("Abc - 1");

    String path = 'SENSOR/$sensorName/SENSORVAL';

    DatabaseReference starCountRef = FirebaseDatabase.instance.ref(path);
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;

      setState(() {
        if (sensorName == 'SENSOR1') {
          // Assuming SENSOR1 value is boolean
          valueS1 = data as bool? ??
              false; // Use default value if sensorValue is null
        } else if (sensorName == 'SENSOR2') {
          // Assuming SENSOR2 value is boolean
          valueS2 = data as bool? ??
              false; // Use default value if sensorValue is null
        }
        //print('$sensorName: $data');
      });
    });
  }
}
