import 'package:be_active/core/themes/colors.dart';
import 'package:be_active/providers/home_provider.dart';
import 'package:be_active/widgets/button/gradient_button.dart';
import 'package:be_active/widgets/dialogs/add_note_dialog.dart';
import 'package:be_active/widgets/dialogs/dialogs.dart';
import 'package:be_active/widgets/note/note_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    });
    super.initState();
  }

  TextEditingController textEditingController = TextEditingController();

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
              await Dialogs.showUnmodal(
                context,
                AddNotesDialog(
                  title: "",
                  onAcept: () async {
                    provider.addNewNote(textEditingController.text);
                  },
                  textEditingController: textEditingController,
                ),
              );
              textEditingController.clear();
            },
            title: 'Создать новую заметку',
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Заметки",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: provider.listOfNotes.isEmpty
          ? const Center(
              child: Text(
                "Пока нет заметок :)",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: provider.listOfNotes.length,
                itemBuilder: (BuildContext context, int index) {
                  return NoteWidget(
                    note: provider.listOfNotes[index],
                    onTap: () {
                      provider.deleteNotes(index);
                    },
                  );
                },
              ),
            ),
    );
  }
}
