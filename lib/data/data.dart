import 'package:flutter/foundation.dart';

class Computer {
  final String imageUrl;
  final String title;
  String falseValue;
  final ValueNotifier<bool> valueIsDrope;
  final ValueNotifier<bool> isCorrectAnswer;

  Computer({
    required this.imageUrl,
    required this.title,
    required this.valueIsDrope,
    required this.isCorrectAnswer,
    required this.falseValue,
  });
}

final List<String> choiseValueOfComputer = [
  'Souris',
  'Clavier',
  'Moniteur',
  'Unite centrale',
  'Imprimante',
  'Clé Usb',
  'Haut parleur',
  'Routeur',
  'Modem',
  'Bios'
];

final computerElement = [
  Computer(
    title: 'Souris',
    falseValue: '',
    imageUrl: 'assets/mouse.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
  ),
  Computer(
    title: 'Clavier',
    imageUrl: 'assets/keyboard.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Moniteur',
    imageUrl: 'assets/monitor.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Imprimante',
    imageUrl: 'assets/imprimante.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Clé Usb',
    imageUrl: 'assets/cles_usb.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Haut parleur',
    imageUrl: 'assets/haut_parleur.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Unite centrale',
    imageUrl: 'assets/computer.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
];
final List<String> choiseValueOfPort = [
  'USB',
  'PS2',
  'VGA',
  'Unite centrale',
  'Imprimante',
  'Clé Usb',
  'DVI',
  'Routeur',
];
final computerPort = [
  Computer(
    title: 'USB',
    falseValue: '',
    imageUrl: 'assets/usb.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
  ),
  Computer(
    title: 'PS2',
    imageUrl: 'assets/ps2_port.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'VGA',
    imageUrl: 'assets/vga.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'DVI',
    imageUrl: 'assets/dvi_port.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
];

final List<String> choiseValueOfAlimentationCable = ['Oui', 'Non'];
final computerAlimentationCables = [
  Computer(
    title: 'Non',
    falseValue: '',
    imageUrl: 'assets/rj45.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
  ),
  Computer(
    title: 'Non',
    imageUrl: 'assets/usb_cable.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Oui',
    imageUrl: 'assets/cable1.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Oui',
    imageUrl: 'assets/cable5.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Non',
    imageUrl: 'assets/cles_usb.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Oui',
    imageUrl: 'assets/cable3.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Oui',
    imageUrl: 'assets/cable2.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Non',
    imageUrl: 'assets/cable4.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
];
