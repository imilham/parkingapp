import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget CustomButton({
  required Null Function() onPress,
  required String title,
  required double width,
  required double height,
  required Color bgColor,
  required Color fontClr,
}) {
  return SizedBox(
    width: width,
    height: height, // Set the desired width of the button
    child: ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        // // backgroundColor: Color(clr),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: fontClr,
        ),
      ),
    ),
  );
}
