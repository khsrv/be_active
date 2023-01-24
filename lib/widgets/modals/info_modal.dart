import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/widgets/button/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showFounderModal({
  required BuildContext context,
}) {
  showCupertinoModalBottomSheet(
    elevation: 1,
    useRootNavigator: true,
    backgroundColor: kWhiteColor,
    topRadius: const Radius.circular(16),
    expand: false,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SizedBox(
          height: MediaQuery.of(context).size.width+57+64,
          child: Scaffold(
            backgroundColor: kWhiteColor,
            body: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Center(
                        child: Container(
                          width: 34,
                          height: 5,
                          decoration: BoxDecoration(
                              color: kBlackColor,
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/about_app.jpg",
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width,
                            fit: BoxFit.fitWidth,
                          )
                        ],
                      ),
                    ],
                  ),
                  GradientButton(
                    title: 'Закрыть окно',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
