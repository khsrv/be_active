import 'package:be_active/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';

class TimeCardWidget extends StatelessWidget {
  const TimeCardWidget({super.key, required this.image, required this.onTap});

  final String image;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.fitHeight),
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: kBlackColor.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
