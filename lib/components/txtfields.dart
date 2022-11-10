import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Tinput extends StatelessWidget {
  final double width;
  final double height;
  final String hint;
  final String label;
  final Color textcolor;
  final Color bgcolor;
  final bool isobsecure;
  final TextEditingController controller;
  final EdgeInsetsGeometry padding;
  final TextInputType keytype;

  const Tinput({
    super.key,
    required this.controller,
    required this.hint,
    required this.label,
    this.width = 300,
    this.height = 75,
    this.textcolor = Colors.black,
    this.bgcolor = Colors.white,
    this.padding = EdgeInsets.zero,
    this.isobsecure = false,
    this.keytype = TextInputType.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width,
      color: bgcolor,
      height: height,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint,
          label: Text(label),
        ),
        obscureText: isobsecure,
        keyboardType: keytype,
      ),
    );
  }
}
