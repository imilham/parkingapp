import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:lottie/lottie.dart';

// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/bloc/splash/splash_bloc.dart';
import 'package:parking_app/bloc/splash/splash_event.dart';
import 'package:parking_app/bloc/splash/splash_state.dart';
// import 'package:parking_app/data/data.dart';
import 'package:parking_app/presentation/screens/stater_one.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SplashBloc>(context).add(SetSplash());
    return Scaffold(
      body: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashLoadedState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const StarterScreenOne()));
          }
        },
        builder: (context, state) {
          if (state is SplashLoadingState) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Expanded(
                    flex: 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              'assets/animation/running_car.json',
                              width: 300,
                              height: 300,
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "CAR PARKING",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                "This is a Car parking app for Smart car parking station, Here you can find Available slot and book your parking slot from any where with you phone",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  // Expanded(
                  //     child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Image.asset(
                  //       collegeLogo,
                  //       width: 200,
                  //     )
                  //   ],
                  // )),
                ]),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
