import 'package:flutter/material.dart';
import 'package:parking_app/presentation/screens/booking_one.dart';
import 'package:parking_app/presentation/widgets/button.dart';
import 'package:parking_app/presentation/screens/starter_two.dart';

class StarterScreenOne extends StatelessWidget {
  const StarterScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Home page'),
          ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/splash_images/layer1.png',
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/splash_images/layer2.png',
                  fit: BoxFit.cover,
                ),
                Image.asset(
                  'assets/splash_images/layer3.png',
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/pageone/Image.png',
                    width: 305, // Adjust the size as needed
                    height: 305, // Adjust the size as needed
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 40,
              ),
              Image.asset('assets/pageone/car.png'),
              const SizedBox(
                width: 20,
              ),
              const Text(
                'Car Parkng',
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
                'You an feel best',
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
                'performance on',
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
                'Your drive 💪',
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
                          builder: (context) => const StarterScreenTwo()));
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
