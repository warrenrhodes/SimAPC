import 'package:easy_learning/data/data.dart';
import 'package:flutter/cupertino.dart';

class PrerequisExo1Controller extends ChangeNotifier {
  /// Usings for exervice 1.
  final List<Computer> _computerListExo1;
  final List<String> _correctValueExo1;
  bool checkExo1;
  double moyenneExo1 = 0;
  List<Computer> get computerListExo1 => _computerListExo1;
  List<String> get correctValueExo1 => _correctValueExo1;
  List<String> keepCorrectValueExo1 = [];

  /// Usings for exervice 2.
  final List<Computer> _computerPortListExo2;
  final List<String> _choiseValueExo2;
  bool checkExo2;
  double moyenneExo2 = 0;
  List<Computer> get computerPortListExo2 => _computerPortListExo2;
  List<String> get choiseValue => _choiseValueExo2;
  List<String> keepCorrectValueExo2 = [];

  /// Usings for exervice 3.
  final List<Computer> _computerPortListExo3;
  final List<String> _choiseValueExo3;
  bool checkExo3;
  double moyenneExo3 = 0;
  List<Computer> get computerPortListExo3 => _computerPortListExo3;
  List<String> get choiseValueExo3 => _choiseValueExo3;
  List<String> keepCorrectValueExo3 = [];
  PrerequisExo1Controller(
      this._computerListExo1,
      this._correctValueExo1,
      this.checkExo1,
      this._computerPortListExo2,
      this._choiseValueExo2,
      this.checkExo2,
      this._computerPortListExo3,
      this._choiseValueExo3,
      this.checkExo3);

  bool exo1 = true;
  bool exo2 = false;
  bool exo3 = false;

  void checkValueExo1(bool value) {
    checkExo1 = value;
    int i = 0;
    _computerListExo1.map((e) {
      if (e.title == e.falseValue) {
        i = i + 1;
        moyenneExo1 = (i * 10) / _computerListExo1.length;
      }
    }).toList();
    moyenneExo1 = double.parse(moyenneExo1.toStringAsFixed(2));

    notifyListeners();
  }

  void removeDropElememtExo1(String element) {
    keepCorrectValueExo1.add(element);
    _correctValueExo1.remove(element);
    notifyListeners();
  }

  void restStartExo1() {
    checkExo1 = false;
    moyenneExo1 = 0.0;
    computerListExo1.map((e) {
      e.falseValue = '';
      e.valueIsDrope.value = false;
    }).toList();
    _correctValueExo1.addAll(keepCorrectValueExo1);
    keepCorrectValueExo1.clear();
    notifyListeners();
  }

  void checkValueExo2(bool value) {
    checkExo2 = value;
    int i = 0;
    _computerPortListExo2.map((e) {
      if (e.title == e.falseValue) {
        i = i + 1;
        moyenneExo2 = (i * 10) / _computerPortListExo2.length;
      }
    }).toList();
    moyenneExo2 = double.parse(moyenneExo2.toStringAsFixed(2));

    notifyListeners();
  }

  void removeDropElememtExo2(String element) {
    keepCorrectValueExo2.add(element);
    _choiseValueExo2.remove(element);
    notifyListeners();
  }

  void restStartExo2() {
    checkExo2 = false;
    moyenneExo2 = 0.0;
    computerPortListExo2.map((e) {
      e.falseValue = '';
      e.valueIsDrope.value = false;
    }).toList();
    _choiseValueExo2.addAll(keepCorrectValueExo2);
    keepCorrectValueExo2.clear();
    notifyListeners();
  }

  void checkValueExo3(bool value) {
    checkExo3 = value;
    int i = 0;
    _computerPortListExo3.map((e) {
      if (e.title == e.falseValue) {
        i = i + 1;
        moyenneExo3 = (i * 10) / _computerPortListExo3.length;
      }
    }).toList();
    moyenneExo3 = double.parse(moyenneExo3.toStringAsFixed(2));

    notifyListeners();
  }

  void removeDropElememtExo3(String element) {
    keepCorrectValueExo3.add(element);
    notifyListeners();
  }

  void restStartExo3() {
    moyenneExo3 = 0.0;
    computerPortListExo3.map((e) {
      e.falseValue = '';
      e.valueIsDrope.value = false;
    }).toList();
    keepCorrectValueExo3.clear();
    notifyListeners();
  }

  void updateExercice() {
    if (exo1 && !exo2 && !exo3) {
      exo1 = false;
      exo2 = true;
      exo3 = false;
      notifyListeners();
    } else if (!exo1 && exo2 && !exo3) {
      exo1 = false;
      exo2 = false;
      exo3 = true;
      print(exo3);
      notifyListeners();
    } else if (!exo1 && !exo2 && exo3) {
      exo1 = true;
      exo2 = false;
      exo3 = false;
      notifyListeners();
    }
  }
}
