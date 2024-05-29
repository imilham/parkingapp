import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showBookingConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return dialog content
        return AlertDialog(
          title: Text('Booking Confirmed'),
          content: Text('Thank you for booking with us!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _showBookingConfirmationDialog,
          child: Text('Book Now'),
        ),
      ),
    );
  }
}
