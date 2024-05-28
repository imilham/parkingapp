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
    if (hasCar) {
      //const BookedWidget();
      return Container(
        width: 350,
        height: 320,
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
                const Text(
                  'Bill Amount :',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
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
      return const SizedBox(
        height: 10,
      );
    }
  }
}
