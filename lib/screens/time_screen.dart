import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/models/clock_model.dart';
import 'package:be_active/models/time_enum.dart';
import 'package:be_active/providers/home_provider.dart';
import 'package:be_active/service/notification_service.dart';
import 'package:be_active/widgets/button/gradient_button.dart';
import 'package:be_active/widgets/clock/cloack_widget.dart';
import 'package:be_active/widgets/dialogs/acept_dialog.dart';
import 'package:be_active/widgets/dialogs/add_note_dialog.dart';
import 'package:be_active/widgets/dialogs/dialogs.dart';
import 'package:be_active/widgets/modals/create_new_event_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key, required this.time});
  final TimeEnum time;

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  TextEditingController textEditingControleer = TextEditingController();
  final nameKey = GlobalKey<FormState>();
  Duration? changeDuration;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    var clockList = getListOfClock(provider, widget.time);
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            bottom: 32,
            left: 16,
          ),
          child: GradientButton(
            onTap: () async {
              showCreateNewEventModal(
                context: context,
                formKey: nameKey,
                textEditingController: textEditingControleer,
                onChangeDuration: (Duration duration) {
                  changeDuration = duration;
                },
                onCreateEvent: () {
                  final random = Random();
                  int id = random.nextInt(10000000);
                  ClockModel newClock = ClockModel(
                    id: id,
                    name: textEditingControleer.text,
                    time: changeDuration == null
                        ? '${DateTime.now().hour} : ${DateTime.now().minute}'
                        : '${changeDuration!.inHours} : ${changeDuration!.inMinutes % 60}',
                  );
                  provider.addClockToList(
                    clock: newClock,
                    timeEnum: widget.time,
                  );
                  if (changeDuration != null) {
                    NotificationService().showScheduleNotifications(
                        0,
                        "Новое напоминане",
                        textEditingControleer.text,
                        textEditingControleer.text,
                        changeDuration!);
                  } else {
                    changeDuration = Duration(
                      hours: DateTime.now().hour,
                      minutes: DateTime.now().minute,
                    );
                    NotificationService().showScheduleNotifications(
                      id,
                      "Новое напоминане",
                      textEditingControleer.text,
                      textEditingControleer.text,
                      changeDuration!,
                    );
                  }
                  textEditingControleer.clear();
                },
              );
            },
            title: 'Создать новое напоминание',
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          getText(widget.time),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: clockList.isEmpty
          ? const Center(
              child: Text(
                "Пока нет напоминаний :)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: clockList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClockWidget(
                    clockModel: clockList[index],
                    onTap: () async {
                      await Dialogs.showUnmodal(
                        context,
                        AceptDialog(
                          title: "Вы точно хотите удалить ?",
                          onAcept: () async {
                            NotificationService().cancelNotificationLocal(
                              clockList[index].id!,
                            );
                            provider.removeClockFromList(
                              index: index,
                              timeEnum: widget.time,
                            );
                          },
                          infoText: '',
                        ),
                      );
                    },
                  );
                },
              ),
            ),
    );
  }

  List<ClockModel> getListOfClock(
      HomeProvider homeProvider, TimeEnum timeEnum) {
    List<ClockModel> newList = [];
    switch (timeEnum) {
      case TimeEnum.morning:
        newList = homeProvider.morningClock;
        break;

      case TimeEnum.day:
        newList = homeProvider.dayClock;
        break;
      case TimeEnum.nigt:
        newList = homeProvider.eveningClock;
        break;
    }
    return newList;
  }

  String getText(TimeEnum timeEnum) {
    switch (timeEnum) {
      case TimeEnum.morning:
        return "Morning";

      case TimeEnum.day:
        return "Day";

      case TimeEnum.nigt:
        return "Night";
    }
  }
}
