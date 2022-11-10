import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Screen {
  BuildContext context;
  Screen(this.context);

  get width => MediaQuery.of(context).size.width;
  get height => MediaQuery.of(context).size.height;
}

class Consts {
  // Color theme
  // floral white - FBFBF2;
  // saphire blue - 006494
  // carolina blue - 1B98E0;
  // persian blue - 04395E
  // 210124
  // 750D37 - maroon or red shade
  //magic mint - 750D37
  //emerald ; 1A936F
  // red sals ; F93943
  // piech FFE1A8
  // vibrant pink ; FFE1A8
  //dark - sienna ; 4A051C
  // dark - purple 2F0A28
  //rosewood - 2F0A28
  // tea green - 2F0A28
  // safety ellow - F1D302
  // flame = EC4E20
// custom theme
  static const Color kprimary = Color(0xff750D37);
  static const Color ksecondary = Color(0xff4b86b4);
  static const Color knormal = Color(0xffadcbe3);
  static const Color klight = Color(0xffEEF5DB);
  static const Color kdark = Color(0xff0B2545);
  static const Color kblack = Color(0xff212121);
  static const Color kwhite = Color(0xfff1f1f1);

  // azure lane
  // static const Color kprimary = Color(0xff2a4d69);
  // static const Color ksecondary = Color(0xff4b86b4);
  // static const Color knormal = Color(0xffadcbe3);
  // static const Color klight = Color(0xffe7eff6);
  // static const Color kdark = Color(0xff212121);

// Misty meadow
  // static const Color kprimary = Color(0xff9de0ad);
//   static const Color ksecondary = Color(0xff45ada8);
//   static const Color knormal = Color(0xff547980);
//   static const Color klight = Color(0xff594f4f);
//   static const Color kdark = Color(0xff212121);

  ///celestial ash

  // static const Color kprimary = Color(0xffeed8d9);
//   static const Color ksecondary = Color(0xffd2cede);
//   static const Color knormal = Color(0xffa1b3ca);
//   static const Color klight = Color(0xff7abca4 );
//   static const Color kdark = Color(0xff212121);

// paddings
  static EdgeInsetsGeometry stdpadding() {
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  }
  // font sizes

  // text styles
// headings
  static Widget h1({
    required String title,
    Color? txtcolor,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: txtcolor ?? Consts.kblack,
      ),
    );
  }

  static Widget h2(
      {required String title, Color? txtcolor, FontWeight? fontWeight}) {
    return AutoSizeText(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: fontWeight ?? FontWeight.w700,
        fontSize: 22,
        color: txtcolor ?? Consts.kblack,
      ),
      maxLines: 2,
    );
  }

  static Widget h3(
      {required String title, Color? txtcolor, FontWeight? fontWeight}) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        color: txtcolor ?? Consts.kblack,
        fontWeight: fontWeight ?? FontWeight.w700,
      ),
    );
  }

  static Widget h4({
    required String title,
    Color? txtcolor,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: txtcolor ?? Consts.kblack,
      ),
    );
  }

  static Widget h5({
    required String title,
    Color? txtcolor,
  }) {
    return Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: txtcolor ?? Consts.kblack,
      ),
    );
  }

  static Widget span(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        color: Consts.kblack,
      ),
    );
  }
}
