import 'package:be_active/models/clock_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getClockList();
  }
  List<ClockModel> listOfClocks = [];
  List<String> listOfNotes = [];

  Future<void> getClockList() async {
    listOfClocks.addAll(
      [
        ClockModel(12, "09:30", "Университет"),
        ClockModel(12, "02:30", "Cпортзал"),
        ClockModel(12, "10:35", "Читать книгу")
      ],
    );

    notifyListeners();
  }

  Future<void> getListOfNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    listOfNotes = prefs.getStringList("notes") ?? [];
    notifyListeners();
  }

  Future<void> uodateNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("notes", listOfNotes);
  }

  Future<void> addNewNote(String note) async {
    listOfNotes.add(note);
    await uodateNotes();
    notifyListeners();
  }

  Future<void> deleteNotes(int index) async {
    listOfNotes.removeAt(index);
    await uodateNotes();
    notifyListeners();
  }
}
