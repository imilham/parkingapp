import 'package:flutter/material.dart';
import 'package:another_dashed_container/another_dashed_container.dart';
import 'package:parking_app/presentation/screens/booking_page/booking_page.dart';
// import 'package:smart_car_parking/pages/booking_page/booking_page.dart';
import '../constants/colors.dart';

class ParkingSlot extends StatelessWidget {
  final bool? isParked;
  final bool? isBooked;
  final String? slotName;
  final String slotId;
  final String time;

  const ParkingSlot({
    Key? key,
    this.isParked,
    this.isBooked,
    this.slotName,
    this.slotId = "0.0",
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 120,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(slotName ?? ''),
          // Text('Time: $time'),
          if (isBooked == true) Image.asset("assets/images/car.png"),
          if (isBooked != true)
            ElevatedButton(
              onPressed: () {
                // Handle button press, e.g., navigate to BookingPage
              },
              child: Text('BOOK'),
            ),
        ],
      ),
    );
  }
}