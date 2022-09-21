import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  ///
  /// Button color
  ///
  final Color? colour;

  ///
  /// Button incorporated text
  ///
  final String? title;

  ///
  /// Button onPressed function
  ///
  final void Function() onPressed;

  ///
  /// Main constructor
  ///
  const RoundedButton(
      {Key? key, required this.onPressed, this.colour, this.title})
      : super(key: key);

  ///
  /// RoundedButton builder
  ///
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title!,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
