import 'package:flutter/material.dart';
import 'package:parking_app/presentation/screens/home-screen/home_screen.dart';
import 'package:parking_app/presentation/screens/starter_two.dart';
import 'package:parking_app/presentation/widgets/button.dart';

class StartBooking extends StatelessWidget {
  const StartBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit
            .expand, // Ensures the background image covers the whole screen
        children: [
          Image.asset(
            'assets/booking/map.png',
            fit: BoxFit.cover, // This ensures the image covers the entire stack
          ),
          Column(
            children: [
              const SizedBox(height: 350),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white, // Set the background color
                  borderRadius:
                      BorderRadius.circular(50), // Set the border radius
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        const Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              'Book your car',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            SizedBox(width: 30),
                            Text(
                              'Parking',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.25,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white, // Set the background color
                            borderRadius: BorderRadius.circular(
                                50), // Set the border radius

                            border: Border.all(
                              color: Colors.grey, // Set the border color
                              width: 1.0, // Set the border width
                            ),
                          ),
                          child: const Column(
                            children: [
                              SizedBox(height: 30),
                              Row(
                                children: [
                                  SizedBox(width: 30),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Zone',
                                          style: TextStyle(color: Colors.grey)),
                                      Text(
                                        'A - 013',
                                        style: TextStyle(fontSize: 28),
                                      ),
                                      SizedBox(height: 50),
                                      Text('Time Slot',
                                          style: TextStyle(color: Colors.grey)),
                                      SizedBox(width: 30),
                                      Text('10:02 PM'),
                                      SizedBox(width: 30),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        CustomButton(
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            },
                            title: 'Start Booking',
                            width: MediaQuery.of(context).size.width / 1.25,
                            height: 60,
                            bgColor: const Color(0xFFFED94D),
                            fontClr: Colors.black),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const StarterScreenTwo()));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 40,
                    ), // Set the back button color
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
