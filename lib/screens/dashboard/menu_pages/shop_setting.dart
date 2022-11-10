import 'package:dbmsapp/components/buttons.dart';
import 'package:dbmsapp/components/txtfields.dart';
import 'package:dbmsapp/constants.dart';
import 'package:dbmsapp/routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ShopSetting extends StatelessWidget {
  const ShopSetting({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop Setting"),
      ),
      body: SafeArea(
          child: Container(
        width: width,
        padding: Consts.stdpadding(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Image(image: image)
          Container(
            width: width,
            height: 200,
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            color: Colors.grey.shade200,
            alignment: Alignment.center,
            child: Text(
              "Shop Photo / Business Card",
            ),
          ),
          // Consts.h5(title: "Shop Name", txtcolor: Colors.grey.)
          Text(
            "Shop name",
          ),
          Tinput(
              controller: new TextEditingController(),
              hint: "Shop Name",
              label: "Shop Name"),
          Tinput(
              controller: new TextEditingController(),
              hint: "Shop Address",
              label: "Shop Address"),
          Tinput(
              controller: new TextEditingController(),
              hint: "Shop Contact",
              label: "Shop Contact"),
          // TextFormField(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BtnPrimary(
                title: "Update",
                onpress: () {},
                width: width * 0.4,
              ),
              BtnPrimary(
                title: "Cancel",
                onpress: () {
                  Rute.pop(context);
                },
                bgColor: Colors.black,
                width: width * 0.4,
              ),
            ],
          )
          // ),
        ]),
      )),
    );
  }
}
