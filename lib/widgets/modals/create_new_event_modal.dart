import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/core/themes/text_styles.dart';
import 'package:be_active/widgets/button/border_button.dart';
import 'package:be_active/widgets/button/gradient_button.dart';
import 'package:be_active/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void showCreateNewEventModal(
    {required BuildContext context,
    required TextEditingController textEditingController,
    required GlobalKey<FormState> formKey}) {
  showCupertinoModalBottomSheet(
    elevation: 1,
    useRootNavigator: true,
    backgroundColor: kWhiteColor.withOpacity(0.8),
    topRadius: const Radius.circular(16),
    expand: false,
    context: context,
    builder: (context) => StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return SizedBox(
          height: 700,
          child: Scaffold(
            backgroundColor: kWhiteColor.withOpacity(0.8),
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
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                "Новое напоминание",
                                style: textStyleSe26We600,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            CustomTextField(
                              title: "",
                              controller: textEditingController,
                              formKey: formKey,
                              formatters: const [],
                              hintText: 'Введите название...',
                              validator: (value) {},
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                              "Выберите время",
                              style: textStyleSe26We600,
                              textAlign: TextAlign.center,
                            ),
                             const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: CupertinoTimerPicker(
                                  initialTimerDuration: Duration(
                                    hours: DateTime.now().hour,
                                    minutes: DateTime.now().minute,
                                  ),
                                  onTimerDurationChanged: (duration) {},
                                  mode: CupertinoTimerPickerMode.hm,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GradientButton(
                          title: 'Создать напоминане',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BorderButton(
                          title: 'Отменить',
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
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
