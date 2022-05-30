import 'package:flutter/material.dart';

/// The small rounded button.
ButtonStyle roundedSmallButton(Color colors, double width, double height) =>
    ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(width, height)),
        elevation: MaterialStateProperty.all(5.0),
        backgroundColor: MaterialStateProperty.all(colors),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 5, horizontal: 10)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ));
