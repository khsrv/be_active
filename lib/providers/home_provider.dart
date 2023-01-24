import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  List<String> listOfNotes = [];
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
