import 'package:flutter/material.dart';
import 'package:parking_app/presentation/screens/booking_one.dart';
import 'package:parking_app/presentation/widgets/button.dart';

class StarterScreenTwo extends StatelessWidget {
  const StarterScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Home page'),
          ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/pagetwo/lineone.png'),
              const SizedBox(width: 30),
              Image.asset('assets/pagetwo/Car.png'),
              const SizedBox(width: 30),
              Image.asset('assets/pagetwo/linetwo.png'),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Image.asset('assets/pagetwo/flash.png'),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Charging',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                'Awesome 🧤',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ],
          ),
          const SizedBox(
            height: 0,
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                'experience car',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              )
            ],
          ),
          const SizedBox(
            height: 0,
          ),
          const Row(
            children: [
              SizedBox(
                width: 30,
              ),
              Text(
                'energy change',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              CustomButton(
                title: 'Skip',
                onPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartBooking()));
                },
                width: 130,
                height: 70,
                bgColor: const Color(0xFFEFEFF6),
                fontClr: Colors.black,
              ),
              const SizedBox(
                width: 15,
              ),
              CustomButton(
                title: 'Next',
                onPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartBooking()));
                },
                width: 180,
                height: 70,
                bgColor: const Color(0xFF655AE4),
                fontClr: Colors.black,
              ),
            ],
          )
        ],
      ),
    );
  }
}
