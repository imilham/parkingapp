import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';
import 'package:parking_app/presentation/screens/booked_data.dart';
import '../../constants/colors.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_database/firebase_database.dart';

TextEditingController userName = TextEditingController();
TextEditingController vehicleNum = TextEditingController();

class BookingPageUI extends StatefulWidget {
  final String slotName;
  final String slotId;

  BookingPageUI({
    super.key,
    required this.slotId,
    required this.slotName,
  });

  @override
  State<BookingPageUI> createState() => _BookingPageUIState();
}

class _BookingPageUIState extends State<BookingPageUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: const Text(
          "BOOK SLOT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      'assets/animation/running_car.json',
                      width: 300,
                      height: 200,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text(
                  "Book Now 😊",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: blueColor,
                ),
                const SizedBox(height: 10),
                const Text("Enter your name"),
                const SizedBox(height: 10),
                TextFormField(
                  controller: userName,
                  decoration: const InputDecoration(
                    fillColor: lightBg,
                    filled: true,
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.person,
                      color: blueColor,
                    ),
                    hintText: "Mohamed Ilham",
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Enter Vehicle Number"),
                const SizedBox(height: 10),
                TextFormField(
                  controller: vehicleNum,
                  decoration: const InputDecoration(
                    fillColor: lightBg,
                    filled: true,
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.car_rental,
                      color: blueColor,
                    ),
                    hintText: "BBS 8280",
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  // width: 100,
                  width: MediaQuery.of(context).size.width * .90,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Booking slot : ${widget.slotName}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Implement payment functionality
                        //print("Booking function clicked");
                        DateTime now = DateTime.now();

                        int hour = now.hour;
                        int minute = now.minute;
                        if (widget.slotName == "Slot 02") {
                          writeData("SENSOR2", hour, minute, userName.text,
                              vehicleNum.text);
                        } else if (widget.slotName == "Slot 01") {
                          writeData("SENSOR1", hour, minute, userName.text,
                              vehicleNum.text);
                        }

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => BookedDataScreen())));

                        //print(vehicleNum.text);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 20),
                        decoration: BoxDecoration(
                          color: blueColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "BOOK NOW",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void writeData(
      String sensorName, int hour, int minute, String uName, String vehiNum) {
    // print("Abc - 1");

    String pathHour = 'SENSOR/$sensorName/HOUR';
    String pathMinute = 'SENSOR/$sensorName/Minute';
    String sensorValue = 'SENSOR/$sensorName/SENSORVAL';
    String uNamef = 'SENSOR/$sensorName/userName';
    String vehiNumf = 'SENSOR/$sensorName/vehicleNumber';

    // Reference to the hour path in Firebase Realtime Database
    DatabaseReference hourRef = FirebaseDatabase.instance.ref(pathHour);

    // Reference to the minute path in Firebase Realtime Database
    DatabaseReference minuteRef = FirebaseDatabase.instance.ref(pathMinute);
    DatabaseReference uNRef = FirebaseDatabase.instance.ref(uNamef);
    DatabaseReference vNRef = FirebaseDatabase.instance.ref(vehiNumf);

    // Write hour value to Firebase Realtime Database
    hourRef.set(hour).then((_) {
      //print('Hour ($hour) saved successfully!');
    }).catchError((error) {
      //print('Failed to save hour: $error');
    });

    // Write minute value to Firebase Realtime Database
    minuteRef.set(minute).then((_) {
      //print('Minute ($minute) saved successfully!');
    }).catchError((error) {
      //print('Failed to save minute: $error');
    });

    DatabaseReference sensorValueRef =
        FirebaseDatabase.instance.ref(sensorValue);
    sensorValueRef.set(true).then((_) {
      //print('TURE saved successfully!');
    }).catchError((error) {
      //print('Failed to save hour: TRUE');
    });

    uNRef.set(uName).then((_) {
      //print(' un saved successfully!');
    }).catchError((error) {
      //print(' un to save hour: TRUE');
    });

    vNRef.set(vehiNum).then((_) {
      //print(' vn saved successfully!');
    }).catchError((error) {
      //print('vn  to save hour: TRUE');
    });
  }
}
