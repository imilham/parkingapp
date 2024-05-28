import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';
import '../../constants/colors.dart';

class BookingPageUI extends StatelessWidget {
  final String slotName;
  final String slotId;

  const BookingPageUI({
    Key? key,
    required this.slotId,
    required this.slotName,
  }) : super(key: key);

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
                  decoration: const InputDecoration(
                    fillColor: lightBg,
                    filled: true,
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.person,
                      color: blueColor,
                    ),
                    hintText: "ZYX Kumar",
                  ),
                ),
                const SizedBox(height: 10),
                const Text("Enter Vehicle Number"),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    fillColor: lightBg,
                    filled: true,
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.car_rental,
                      color: blueColor,
                    ),
                    hintText: "WB 04 ED 0987",
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  // width: 100,
                  width: MediaQuery.of(context).size.width * .75,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Booking slot : $slotName",
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
                        print("Booking function clicked");
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
}
