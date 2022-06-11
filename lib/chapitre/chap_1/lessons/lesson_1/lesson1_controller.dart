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
  Lesson1Controller(
    this._choiseValueOfExoLine1,
    this._choiseValueOfExoLine2,
    this._choiseValueOfExoLine3,
    this._choiseValueOfExoLine4,
    List<Computer> computerElements,
    List<Computer> portElements,
  ) {
    _computerElements = List.from(computerElements);
    _portElements = List.from(portElements);
  }

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

  ///////////////////////
  String imageDrap = '';
  List<Computer> _computerElements = [];
  List<Computer> get computerElements => _computerElements;
  ValueNotifier<ContainerNotifier> elemt1 = ValueNotifier(ContainerNotifier());
  ValueNotifier<ContainerNotifier> elemt2 = ValueNotifier(ContainerNotifier());
  ValueNotifier<ContainerNotifier> elemt3 = ValueNotifier(ContainerNotifier());
  ValueNotifier<ContainerNotifier> elemt4 = ValueNotifier(ContainerNotifier());
  bool imageError1 = false;
  bool imageError2 = false;
  bool imageError3 = false;
  bool imageError4 = false;
  bool textError4 = false;
  bool textError3 = false;
  bool textError2 = false;
  bool textError1 = false;
  bool canCheck = false;
  void updateImage(String image) {
    imageDrap = image;
    notifyListeners();
  }

  void removeElementToComputerList(String image) {
    _computerElements.removeWhere((element) => element.imageUrl == image);
    notifyListeners();
  }

  void checkUserAnswer(Map<String, String> computerReponse) {
    canCheck = true;
    if (computerReponse.containsKey(elemt1.value.image)) {
      if (computerReponse[elemt1.value.image] ==
          elemt1.value.textEditingController.value.text.trim()) {
        textError1 = false;
        imageError1 = false;
      } else {
        textError1 = true;
        imageError1 = false;
      }
    } else {
      imageError1 = true;
      textError1 = true;
    }
    if (computerReponse.containsKey(elemt2.value.image)) {
      if (computerReponse[elemt2.value.image] ==
          elemt2.value.textEditingController.value.text.trim()) {
        textError2 = false;
        imageError2 = false;
      } else {
        textError2 = true;
        imageError2 = false;
      }
    } else {
      imageError2 = true;
      textError2 = true;
    }
    if (computerReponse.containsKey(elemt3.value.image)) {
      if (computerReponse[elemt3.value.image] ==
          elemt3.value.textEditingController.value.text.trim()) {
        textError3 = false;
        imageError3 = false;
      } else {
        textError3 = true;
        imageError3 = false;
      }
    } else {
      imageError3 = true;
      textError3 = true;
    }
    if (computerReponse.containsKey(elemt4.value.image)) {
      if (computerReponse[elemt4.value.image] ==
          elemt4.value.textEditingController.value.text.trim()) {
        textError4 = false;
        imageError4 = false;
      } else {
        textError4 = true;
        imageError4 = false;
      }
    } else {
      imageError4 = true;
      textError4 = true;
    }

    notifyListeners();
  }

  void restStartProbleme(List<Computer> initialComputer) {
    elemt1 = ValueNotifier(ContainerNotifier());
    elemt2 = ValueNotifier(ContainerNotifier());
    elemt3 = ValueNotifier(ContainerNotifier());
    elemt4 = ValueNotifier(ContainerNotifier());
    imageError1 = false;
    imageError2 = false;
    imageError3 = false;
    imageError4 = false;
    textError4 = false;
    textError3 = false;
    textError2 = false;
    textError1 = false;
    canCheck = false;
    print(initialComputer.length);
    _computerElements = List.from(initialComputer);
    _computerElements.shuffle();
    notifyListeners();
  }

////////////////////////
/////////////////////////
//////////////////////
  String portImageDrap = '';
  List<Computer> _portElements = [];
  List<Computer> get portElements => _portElements;
  ValueNotifier<ContainerNotifier> portElemt1 =
      ValueNotifier(ContainerNotifier());
  ValueNotifier<ContainerNotifier> portElemt2 =
      ValueNotifier(ContainerNotifier());
  ValueNotifier<ContainerNotifier> portElemt3 =
      ValueNotifier(ContainerNotifier());
  ValueNotifier<ContainerNotifier> portElemt4 =
      ValueNotifier(ContainerNotifier());
  ValueNotifier<ContainerNotifier> portElemt5 =
      ValueNotifier(ContainerNotifier());
  bool portImageError1 = false;
  bool portImageError2 = false;
  bool portImageError3 = false;
  bool portImageError4 = false;
  bool portImageError5 = false;
  bool portTextError4 = false;
  bool portTextError3 = false;
  bool portTextError2 = false;
  bool portTextError1 = false;
  bool portTextError5 = false;
  bool portCanCheck = false;
  void portUpdateImage(String image) {
    portImageDrap = image;
    notifyListeners();
  }

  void removeElementToPortList(String image) {
    _portElements.removeWhere((element) => element.imageUrl == image);
    notifyListeners();
  }

  void checkPortUserAnswer(Map<String, String> portReponse) {
    portCanCheck = true;
    if (portReponse.containsKey(portElemt1.value.image)) {
      if (portReponse[portElemt1.value.image] ==
          portElemt1.value.textEditingController.value.text.trim()) {
        portTextError1 = false;
        portImageError1 = false;
      } else {
        portTextError1 = true;
        portImageError1 = false;
      }
    } else {
      portTextError1 = true;
      portImageError1 = true;
    }
    if (portReponse.containsKey(portElemt2.value.image)) {
      if (portReponse[portElemt2.value.image] ==
          portElemt2.value.textEditingController.value.text.trim()) {
        portTextError2 = false;
        portImageError2 = false;
      } else {
        portTextError2 = true;
        portImageError2 = false;
      }
    } else {
      portTextError2 = true;
      portImageError2 = true;
    }
    if (portReponse.containsKey(portElemt3.value.image)) {
      if (portReponse[portElemt3.value.image] ==
          portElemt3.value.textEditingController.value.text.trim()) {
        portTextError3 = false;
        portImageError3 = false;
      } else {
        portTextError3 = true;
        portImageError3 = false;
      }
    } else {
      portTextError3 = true;
      portImageError3 = true;
    }
    if (portReponse.containsKey(portElemt4.value.image)) {
      if (portReponse[portElemt4.value.image] ==
          portElemt4.value.textEditingController.value.text.trim()) {
        portTextError4 = false;
        portImageError4 = false;
      } else {
        portTextError4 = true;
        portImageError4 = false;
      }
    } else {
      portTextError4 = true;
      portImageError4 = true;
    }
    if (portReponse.containsKey(portElemt5.value.image)) {
      if (portReponse[portElemt5.value.image] ==
          portElemt5.value.textEditingController.value.text.trim()) {
        portTextError5 = false;
        portImageError5 = false;
      } else {
        portTextError5 = true;
        portImageError5 = false;
      }
    } else {
      portTextError5 = true;
      portImageError5 = true;
    }

    notifyListeners();
  }

  void restStartPortProbleme(List<Computer> initialPort) {
    portElemt1 = ValueNotifier(ContainerNotifier());
    portElemt2 = ValueNotifier(ContainerNotifier());
    portElemt3 = ValueNotifier(ContainerNotifier());
    portElemt4 = ValueNotifier(ContainerNotifier());
    portElemt5 = ValueNotifier(ContainerNotifier());
    portImageError1 = false;
    portImageError2 = false;
    portImageError2 = false;
    portImageError4 = false;
    portImageError5 = false;
    portTextError4 = false;
    portTextError3 = false;
    portTextError2 = false;
    portTextError1 = false;
    portTextError5 = false;
    portCanCheck = false;
    _portElements = List.from(initialPort);
    _portElements.shuffle();
    notifyListeners();
  }
}

class ContainerNotifier {
  String image = '';
  TextEditingController textEditingController = TextEditingController(text: '');
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
