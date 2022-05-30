import 'package:easy_learning/data/data.dart';
import 'package:flutter/cupertino.dart';

class Lesson1Controller extends ChangeNotifier {
  final List<String> _choiseValueOfExoLine1;
  final List<String> _choiseValueOfExoLine2;
  final List<String> _choiseValueOfExoLine3;
  final Map<String, bool> _choiseValueOfExoLine4;
  String choiseValue = '';
  bool checkValueLine1 = false;
  String choiseValueLine2 = '';
  bool checkValueLine2 = false;
  String choiseValueLine3 = '';
  bool checkValueLine3 = false;
  bool checkValueLine4 = false;
  List<String> get choiseValueOfExoLine1 => _choiseValueOfExoLine1;
  List<String> get choiseValueOfExoLine2 => _choiseValueOfExoLine2;
  List<String> get choiseValueOfExoLine3 => _choiseValueOfExoLine3;
  Map<String, bool> get choiseValueOfExoLine4 => _choiseValueOfExoLine4;

  bool sourisCableAccept = false;
  bool sourisCableIsDrop = false;
  bool clavierCableAccept = false;
  bool clavierCableIsDrop = false;
  bool alimentationCableAccept = false;
  bool alimentationCableIsDrop = false;
  bool vgaCableAccept = false;
  bool vgaCableIsDrop = false;
  bool computerCableAccepte = false;
  bool computerCableIsDrop = false;
  bool usb1CableAccepte = false;
  bool usb1CableIsDrop = false;
  bool usb2CableAccepte = false;
  bool usb2CableIsDrop = false;
  bool ucCableIsDrop = false;
  bool ucCableAccept = false;
  bool ucIsOn = false;
  bool computerIsOn = false;

  /// variable of exo group 2.
  /// Usings for exervice 1.
  bool checkExo1 = false;
  double moyenneExo1 = 0;
  List<String> keepCorrectValueExo1 = [];

  bool checkExo2 = false;
  double moyenneExo2 = 0;
  List<String> keepCorrectValueExo2 = [];

  /// Constructor.
  Lesson1Controller(this._choiseValueOfExoLine1, this._choiseValueOfExoLine2,
      this._choiseValueOfExoLine3, this._choiseValueOfExoLine4);

  void updateChoiseValueLine1(String? value) {
    choiseValue = value ?? choiseValue;
    checkValueLine1 = false;
    notifyListeners();
  }

  void checkValueChoiseByUserLine1() {
    checkValueLine1 = true;
    notifyListeners();
  }

  void restartAllValueLine1() {
    checkValueLine1 = false;
    choiseValue = '';
    _choiseValueOfExoLine1.shuffle();
    notifyListeners();
  }

  ///<------------ Entry point of line 2---------->
  void updateChoiseValueLine2(String? value) {
    choiseValueLine2 = value ?? choiseValue;
    checkValueLine2 = false;
    notifyListeners();
  }

  void checkValueChoiseByUserLine2() {
    checkValueLine2 = true;
    notifyListeners();
  }

  void restartAllValueLine2() {
    checkValueLine2 = false;
    choiseValueLine2 = '';
    _choiseValueOfExoLine2.shuffle();
    notifyListeners();
  }

  ///<------------ Entry point of line 3---------->
  void updateChoiseValueLine3(String? value) {
    choiseValueLine3 = value ?? choiseValue;
    checkValueLine3 = false;
    notifyListeners();
  }

  void checkValueChoiseByUserLine3() {
    checkValueLine3 = true;
    notifyListeners();
  }

  void restartAllValueLine3() {
    checkValueLine3 = false;
    choiseValueLine3 = '';
    _choiseValueOfExoLine3.shuffle();
    notifyListeners();
  }

  ///<------------ Entry point of line 4---------->
  void updateChoiseValueLine4(String values, bool? isCheck) {
    if (isCheck != null) {
      _choiseValueOfExoLine4[values] = isCheck;
    }
    notifyListeners();
  }

  void checkValueChoiseByUserLine4() {
    checkValueLine4 = true;
    notifyListeners();
  }

  void restartAllValueLine4() {
    checkValueLine4 = false;
    _choiseValueOfExoLine4.keys
        .forEach(((e) => _choiseValueOfExoLine4[e] = false));
    notifyListeners();
  }

  /// souris
  void updateDropOfSourisCable() {
    sourisCableIsDrop = true;
    notifyListeners();
  }

  void updateAcceptOfSourisCable() {
    sourisCableAccept = true;
    notifyListeners();
  }

  void onSourisDropCancel() {
    sourisCableIsDrop = false;
    notifyListeners();
  }

  /// clavier
  void updateDropOfClavierCable() {
    clavierCableIsDrop = true;
    notifyListeners();
  }

  void updateAcceptOfClavierCable() {
    clavierCableAccept = true;
    notifyListeners();
  }

  void onClavierDropCancel() {
    clavierCableIsDrop = false;
    notifyListeners();
  }

  /// vga
  void updateDropOfVgaCable() {
    vgaCableIsDrop = true;
    notifyListeners();
  }

  void updateAcceptOfVgaCable() {
    vgaCableAccept = true;
    notifyListeners();
  }

  void onVgaDropCancel() {
    vgaCableIsDrop = false;
    notifyListeners();
  }

  /// Usb1
  void updateDropOfUsbCable() {
    usb1CableIsDrop = true;
    notifyListeners();
  }

  void updateAcceptOfUsbCable() {
    usb1CableAccepte = true;
    notifyListeners();
  }

  void onUsbDropCancel() {
    usb1CableIsDrop = false;
    notifyListeners();
  }

  /// Usb2
  void updateDropOfUsb2Cable() {
    usb2CableIsDrop = true;
    notifyListeners();
  }

  void updateAcceptOfUsb2Cable() {
    usb2CableAccepte = true;
    notifyListeners();
  }

  void onUsb2DropCancel() {
    usb2CableIsDrop = false;
    notifyListeners();
  }

  /// alimentation
  void updateDropOfAlimentationsCable() {
    alimentationCableIsDrop = true;
    notifyListeners();
  }

  void updateAcceptOfAlimentationCable() {
    alimentationCableAccept = true;
    notifyListeners();
  }

  void onAlimentationDropCancel() {
    alimentationCableIsDrop = false;
    notifyListeners();
  }

  void restartCableValue() {
    sourisCableAccept = false;
    sourisCableIsDrop = false;
    clavierCableAccept = false;
    clavierCableIsDrop = false;
    alimentationCableAccept = false;
    alimentationCableIsDrop = false;
    vgaCableAccept = false;
    vgaCableIsDrop = false;
    usb1CableAccepte = false;
    usb2CableAccepte = false;
    usb1CableIsDrop = false;
    usb2CableIsDrop = false;
    notifyListeners();
  }

  /// Prise
  void updateDropOfComputerCable() {
    computerCableIsDrop = true;
    notifyListeners();
  }

  void updateAcceptOfComputerCable() {
    computerCableAccepte = true;
    notifyListeners();
  }

  void onComputerDropCancel() {
    computerCableIsDrop = false;
    notifyListeners();
  }

  /// alimentaation
  void updateDropOfUcCable() {
    ucCableIsDrop = true;
    notifyListeners();
  }

  void updateAcceptOfUcCable() {
    ucCableAccept = true;
    notifyListeners();
  }

  void onUcDropCancel() {
    ucCableIsDrop = false;
    notifyListeners();
  }

  void restartPriseValue() {
    computerCableAccepte = false;
    computerCableIsDrop = false;
    ucCableIsDrop = false;
    ucCableAccept = false;
    notifyListeners();
  }

  /// Allumage de l'ecran.
  void updateComputerButton() {
    computerIsOn = !computerIsOn;
    notifyListeners();
  }

  void updateUcButton() {
    ucIsOn = true;
    notifyListeners();
  }

  void restartBouttonValue() {
    computerIsOn = false;
    ucIsOn = false;
    notifyListeners();
  }

  bool setWindowns() {
    if ((sourisCableAccept && clavierCableAccept) ||
        (usb1CableAccepte && usb2CableAccepte)) {
      if (alimentationCableAccept &&
          vgaCableAccept &&
          computerCableAccepte &&
          ucCableAccept) {
        return true;
      }
    }
    {}
    return false;
  }

  /// Exo groupe 2.
  /// exo 1
  void checkValueExo1(
    bool value,
    List<Computer> computerList,
  ) {
    checkExo1 = value;
    int i = 0;
    computerList.map((e) {
      if (e.title == e.falseValue) {
        i = i + 1;
        moyenneExo1 = (i * 10) / computerList.length;
      }
    }).toList();
    moyenneExo1 = double.parse(moyenneExo1.toStringAsFixed(2));

    notifyListeners();
  }

  void removeDropElememtExo1(String element, List<String> correctValue) {
    keepCorrectValueExo1.add(element);
    correctValue.remove(element);
    notifyListeners();
  }

  void restStartExo1(List<String> correctValue, List<Computer> computerList) {
    checkExo1 = false;
    moyenneExo1 = 0.0;
    computerList.map((e) {
      e.falseValue = '';
      e.valueIsDrope.value = false;
    }).toList();
    correctValue.addAll(keepCorrectValueExo1);
    keepCorrectValueExo1.clear();
    notifyListeners();
  }

  /// exo 2
  void checkValueExo2(bool value, List<Computer> computerList) {
    checkExo2 = value;
    int i = 0;
    computerList.map((e) {
      if (e.title == e.falseValue) {
        i = i + 1;
        moyenneExo2 = (i * 10) / computerList.length;
      }
    }).toList();
    moyenneExo2 = double.parse(moyenneExo2.toStringAsFixed(2));

    notifyListeners();
  }

  void removeDropElememtExo2(String element, List<String> correctValue) {
    keepCorrectValueExo2.add(element);
    correctValue.remove(element);
    notifyListeners();
  }

  void restStartExo2(List<String> correctValue, List<Computer> computerList) {
    checkExo2 = false;
    moyenneExo2 = 0.0;
    computerList.map((e) {
      e.falseValue = '';
      e.valueIsDrope.value = false;
    }).toList();
    correctValue.addAll(keepCorrectValueExo2);
    keepCorrectValueExo2.clear();
    notifyListeners();
  }

  /// Moyenne general.
  bool childPassExam() {
    if (moyenneExo1 != 0 &&
        moyenneExo2 != 0 &&
        moyenneExo1 == 10.0 &&
        moyenneExo2 == 10.0) {
      return true;
    }
    return false;
  }
}

class Reponse {
  String valideAnswer;
  String userAnswer;
  String name;

  Reponse(
      {required this.userAnswer,
      required this.valideAnswer,
      required this.name});
}
