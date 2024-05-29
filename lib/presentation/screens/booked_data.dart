import 'package:flutter/material.dart';
import 'package:parking_app/presentation/widgets/booked_data.dart';
import 'package:firebase_database/firebase_database.dart';

class BookedDataScreen extends StatefulWidget {
  bool carOne = true;
  bool carTwo = true;

  BookedDataScreen({super.key});

  @override
  State<BookedDataScreen> createState() => _BookedDataScreenState();
}

class _BookedDataScreenState extends State<BookedDataScreen> {
  String vehicleNumberOne = 'one';
  String uNameOne = 'one';

  String vehicleNumberTwo = 'a';
  String uNameTwo = 'a';

  int hourOne = 0;
  int minuteOne = 0;

  int hourTwo = 0;
  int minuteTwo = 0;

  @override
  void initState() {
    super.initState();

    readSensorData('SENSOR1');
    readSensorData('SENSOR2');

    // Read initial sensor values
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                BookedWidget(
                  hasCar: widget.carOne,
                  slotName: "Slot A",
                  hour: hourOne,
                  minute: minuteOne,
                  uName: uNameOne,
                  vNumber: vehicleNumberOne,
                ),
                const SizedBox(height: 50),
                BookedWidget(
                  hasCar: widget.carTwo,
                  slotName: "Slot B",
                  hour: hourTwo,
                  minute: minuteTwo,
                  uName: uNameTwo,
                  vNumber: vehicleNumberTwo,
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
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
          widget.carOne = data as bool? ??
              false; // Use default value if sensorValue is null
        } else if (sensorName == 'SENSOR2') {
          // Assuming SENSOR2 value is boolean
          widget.carTwo = data as bool? ??
              false; // Use default value if sensorValue is null
        }
        //print('$sensorName: $data');
      });
    });

    String pathUserName = 'SENSOR/$sensorName/userName';
    DatabaseReference userNameRef = FirebaseDatabase.instance.ref(pathUserName);
    userNameRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      setState(() {
        if (sensorName == 'SENSOR1') {
          // Assuming SENSOR1 value is boolean
          uNameOne = data as String? ??
              "no value"; // Use default value if sensorValue is null
        } else if (sensorName == 'SENSOR2') {
          // Assuming SENSOR2 value is boolean
          uNameTwo = data as String? ??
              'no value'; // Use default value if sensorValue is null
        }
        //print('$sensorName: $data');
      });
    });

    String pathVehiNum = 'SENSOR/$sensorName/vehicleNumber';
    DatabaseReference vehicleNumberRef =
        FirebaseDatabase.instance.ref(pathVehiNum);
    vehicleNumberRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      setState(() {
        if (sensorName == 'SENSOR1') {
          // Assuming SENSOR1 value is boolean
          vehicleNumberOne = data as String? ??
              'no value'; // Use default value if sensorValue is null
        } else if (sensorName == 'SENSOR2') {
          // Assuming SENSOR2 value is boolean
          vehicleNumberTwo = data as String? ??
              'no value'; // Use default value if sensorValue is null
        }
        //print('ddddddd');
      });
    });

    //for the minute
    String pathMin = 'SENSOR/$sensorName/Minute';
    DatabaseReference minRef = FirebaseDatabase.instance.ref(pathMin);
    minRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      setState(() {
        if (sensorName == 'SENSOR1') {
          // Assuming SENSOR1 value is boolean
          minuteOne =
              data as int? ?? 0; // Use default value if sensorValue is null
        } else if (sensorName == 'SENSOR2') {
          // Assuming SENSOR2 value is boolean
          minuteTwo =
              data as int? ?? 1; // Use default value if sensorValue is null
        }
        //print('ddddddd');
      });
    });

    String pathHour = 'SENSOR/$sensorName/HOUR';
    DatabaseReference hourRef = FirebaseDatabase.instance.ref(pathHour);
    hourRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      setState(() {
        if (sensorName == 'SENSOR1') {
          // Assuming SENSOR1 value is boolean
          hourOne =
              data as int? ?? 2; // Use default value if sensorValue is null
        } else if (sensorName == 'SENSOR2') {
          // Assuming SENSOR2 value is boolean
          hourTwo =
              data as int? ?? 0; // Use default value if sensorValue is null
        }
        //print('ddddddd');
      });
    });
  }
}
