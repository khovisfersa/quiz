import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(
      {super.key, required this.text, required this.color, required this.size});

  final String text;
  final double size;
  final Color color;

  @override
  Widget build(context) {
    return Text(
      text,
      style: GoogleFonts.lato(color: color, fontSize: size),
      textAlign: TextAlign.center,
    );
  }
}
