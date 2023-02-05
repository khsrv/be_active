import 'dart:convert';

import 'package:be_active/models/clock_model.dart';
import 'package:be_active/models/time_enum.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getClockList();
    getListOfNotes();
  }
  List<ClockModel> morningClock = [];
  List<ClockModel> dayClock = [];
  List<ClockModel> eveningClock = [];
  List<String> listOfNotes = [];

  Future<void> getClockList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var morningCLockString = prefs.getStringList("morning_clock") ?? [];
    var dayCLockString = prefs.getStringList("day_clock") ?? [];
    var eveningCLockString = prefs.getStringList("evening_clock") ?? [];
    morningClock = convertStringListToClockModel(morningCLockString);
    dayClock = convertStringListToClockModel(dayCLockString);
    eveningClock = convertStringListToClockModel(eveningCLockString);
    notifyListeners();
  }

  void removeClockFromList({required int index, required TimeEnum timeEnum}) {
    switch (timeEnum) {
      case TimeEnum.morning:
        morningClock.removeAt(index);
        break;
      case TimeEnum.day:
        dayClock.removeAt(index);
        break;
      case TimeEnum.nigt:
        eveningClock.removeAt(index);
        break;
    }
    updateListOfClocks();
    notifyListeners();
  }

  void addClockToList({required ClockModel clock, required TimeEnum timeEnum}) {
    switch (timeEnum) {
      case TimeEnum.morning:
        morningClock.add(clock);
        break;

      case TimeEnum.day:
        dayClock.add(clock);
        break;
      case TimeEnum.nigt:
        eveningClock.add(clock);
        break;
    }
    updateListOfClocks();
    notifyListeners();
  }

  Future<void> updateListOfClocks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
        "morning_clock", convertClockModelToStrin(morningClock));
    prefs.setStringList("day_clock", convertClockModelToStrin(dayClock));
    prefs.setStringList(
        "evening_clock", convertClockModelToStrin(eveningClock));
  }

  List<ClockModel> convertStringListToClockModel(List<String> listOfString) {
    List<ClockModel> newClockList = [];
    for (var item in listOfString) {
      newClockList.add(ClockModel.fromString(item));
    }
    return newClockList;
  }

  List<String> convertClockModelToStrin(List<ClockModel> listofClockModel) {
    List<String> newClockList = [];
    for (var item in listofClockModel) {
      newClockList.add(modelToString(item));
    }
    return newClockList;
  }

  String modelToString(ClockModel clockModel) {
    String clock = jsonEncode(clockModel);
    return clock;
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
