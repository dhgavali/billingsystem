import 'package:clay_containers/clay_containers.dart';
import 'package:dbmsapp/constants.dart';
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onpress;

  const FeatureCard(
      {super.key,
      required this.text,
      required this.icon,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double wd = (width * 0.45 < 200) ? width * 0.45 : 200;
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: wd,
        height: wd,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClayContainer(
          color: Colors.white,
          borderRadius: 15,
          curveType: CurveType.concave,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: wd * 0.3,
                color: Consts.kprimary,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: Consts.h5(
                  title: text,
                  // fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
