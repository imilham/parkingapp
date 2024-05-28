import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/bloc/splash/splash_bloc.dart';
import 'package:parking_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:parking_app/presentation/screens/splash-screen/splash_screen.dart'; // Import Firebase Core package

void main() async {
  // Initialize Firebase before running the app
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Parking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SplashScreen(),
      home: BlocProvider(
        create: (context) => SplashBloc(),
        child: const SplashScreen(),
      ),
    );
  }
}

// nnn
