import 'package:flutter/material.dart';
import 'package:movie_app/models/singlemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Savecontroller extends ChangeNotifier {
  bool save = false;
  List<String> saveData = [];

  void Save() {
    save = !save;
    notifyListeners();
  }

  Future<void> addSaveData({required Singlemovie singlemovie}) async {
    saveData.add(singlemovie.poster);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', singlemovie.poster);

    notifyListeners();
  }

  Future<void> removeSavedata({
    required String name,
  }) async {
    saveData.clear();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(name);

    notifyListeners();
  }
}
