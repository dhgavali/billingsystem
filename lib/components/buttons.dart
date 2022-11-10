import 'package:dbmsapp/constants.dart';
import 'package:flutter/material.dart';

class BtnPrimary extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Color bgColor;
  final Color txtColor;
  final Function() onpress;

  const BtnPrimary(
      {super.key,
      this.width = 300,
      this.height = 50,
      this.bgColor = Consts.kprimary,
      this.txtColor = Consts.kwhite,
      required this.title,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: onpress,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: txtColor,
            ),
          ),
        ));
  }
}

class BtnElevated extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color txtColor;
  final Function() onpress;

  const BtnElevated(
      {super.key,
      this.bgColor = Consts.kprimary,
      this.txtColor = Consts.kwhite,
      required this.title,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(bgColor),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
        ),
        onPressed: onpress,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: txtColor,
            ),
          ),
        ));
  }
}

class BtnText extends StatelessWidget {
  final String title;
  final Function() onpress;

  const BtnText({super.key, required this.title, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextButton(
        onPressed: onpress,
        child: Text(title),
      ),
    );
  }
}
