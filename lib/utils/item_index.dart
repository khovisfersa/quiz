import 'dart:ffi';

import 'package:flutter/material.dart';

class ItemIndex extends StatelessWidget {
  ItemIndex({super.key, required this.status, required this.data});

  final String data;

  final bool status;

  Color? backgroundColor;
  Color? textColor;

  @override
  Widget build(context) {
    backgroundColor = status
        ? Color.fromARGB(248, 198, 250, 202)
        : Color.fromARGB(248, 236, 163, 140);
    textColor = status
        ? Color.fromARGB(255, 4, 122, 0)
        : Color.fromARGB(255, 173, 30, 5);

    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(width: 1),
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Text(
        data.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
