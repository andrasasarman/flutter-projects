import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String? hintText;
  final Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextInputType? keyboardType;
  const TextInput(
      {this.hintText,
      this.onChanged,
      this.onSubmitted,
      this.keyboardType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      style: const TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: Color(0xff354259),
      ),
      textAlign: TextAlign.center,
      cursorColor: const Color(0xff354259),
      cursorHeight: 20,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Color(0xffC2DED1),
        ),
      ),
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
