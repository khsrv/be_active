import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/models/time_enum.dart';
import 'package:be_active/providers/home_provider.dart';
import 'package:be_active/widgets/button/gradient_button.dart';
import 'package:be_active/widgets/clock/cloack_widget.dart';
import 'package:be_active/widgets/dialogs/add_note_dialog.dart';
import 'package:be_active/widgets/dialogs/dialogs.dart';
import 'package:be_active/widgets/modals/create_new_event_modal.dart';
import 'package:be_active/widgets/note/note_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key, required this.time});
  final TimeEnum time;

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  TextEditingController textEditingControleer = TextEditingController();
  final nameKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: GradientButton(
            onTap: () async {
              showCreateNewEventModal(
                context: context,
                formKey: nameKey,
                textEditingController: textEditingControleer,
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
      body: provider.listOfClocks.isEmpty
          ? const Center(
              child: Text(
                "Пока нет напоминаний :)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: provider.listOfClocks.length,
                itemBuilder: (BuildContext context, int index) {
                  return ClockWidget(
                    clockModel: provider.listOfClocks[index],
                    onTap: () {
                      provider.deleteNotes(index);
                    },
                  );
                },
              ),
            ),
    );
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
