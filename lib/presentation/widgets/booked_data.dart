import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BookedWidget extends StatelessWidget {
  final bool hasCar;
  final String slotName;
  final int hour;
  final int minute;
  final String uName;
  final String vNumber;
  const BookedWidget(
      {super.key,
      required this.hasCar,
      required this.slotName,
      required this.hour,
      required this.minute,
      required this.uName,
      required this.vNumber});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    int hourNow = now.hour;
    int minuteNow = now.minute;

    int endtMin = hourNow * 60 + minuteNow;
    int bookedMin = hour * 60 + minute;
    int diffMin = endtMin - bookedMin;
    double billAmount = diffMin * 100.0 / 60;
    billAmount = billAmount < 100 ? 100 : billAmount;
    String sensorName = '';

    if (hasCar) {
      //const BookedWidget();
      return Container(
        width: 350,
        height: 360,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kings Parking : $slotName',
                      style: const TextStyle(
                          fontSize: 29, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'Reserved From : $hour :$minute',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    Text(
                      'Time Now : $hourNow :$minuteNow',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  'User name : $uName',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 2),
                Text(
                  'Vehicle number : $vNumber',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 2),
                Text(
                  'Duration in Minutes : $diffMin',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 2),
                Text(
                  'Bill : Rs.  ${billAmount.toStringAsFixed(0)}/-',
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        if (slotName == "Slot A") {
                          sensorName = "SENSOR1";
                        } else if (slotName == "Slot B") {
                          sensorName = "SENSOR2";
                        }

                        writeData(sensorName, 0, 0, "none", "none");

                        // set up the button
                        Widget okButton = TextButton(
                          child: const Text("Done"),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                        );

                        // set up the AlertDialog
                        AlertDialog alert = AlertDialog(
                          title: const Text("Thank You!"),
                          content: const Text("For using us"),
                          actions: [
                            okButton,
                          ],
                        );

                        // show the dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return alert;
                          },
                        );
                      },
                      child: const Text(
                        "Pay Bill",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.normal),
                      )),
                )
              ],
            ),
          ],
        ),
      );
    } else {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 100),
        ],
      );
    }
  }

  Future<Widget> showProgressAndTextField() async {
    // Simulate 3 seconds of progress
    await Future.delayed(const Duration(seconds: 3));

    // Return the TextField widget
    return const Text(" decoration: InputDecoration(labelText: 'Enter Text'),");
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
    sensorValueRef.set(false).then((_) {
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
