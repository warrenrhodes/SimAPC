import 'package:easy_learning/data/data.dart';
import 'package:flutter/material.dart';

List<String> exo1Ligne1 = [
  "A l’arrière de l’unité centrale",
  "A l’avant de l’unité centrale",
  "Par dessus l’unité centrale",
  "En Dessous de l’unité centrale",
];
List<String> exo1Ligne2 = [
  "Un bouton d'allumage servant d'alllumage",
  "Une plaque compacte avec aucun ports",
  "De prises ou ports aux couleurs et formes différentes",
];
List<String> exo1Ligne3 = [
  "Nombre de peripherique connecte decu",
  "Couleur et forme",
  "Epaisseur et forme",
  "Temps d'execution",
];
Map<String, bool> exo1Line4 = {
  'Port USB': false,
  'Port PS2': false,
  'Port 443': false,
  'Port Série': false,
  'Port Parallèle': false,
  'Port SCI': false,
  'Port PS /3': false,
  'Port 80': false,
  'Port VGA': false,
};

final List<String> choiseValueOfComputerPort = [
  'Port Souris',
  'Port Souris USB',
  'Port Clavier USB',
  'Port Clavier',
  'Port Alimentation',
  'Port Moniteur',
];

final computerPortElement = [
  Computer(
    title: 'Port Souris',
    falseValue: '',
    imageUrl: 'assets/souris_p.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
  ),
  Computer(
    title: 'Port Souris USB',
    falseValue: '',
    imageUrl: 'assets/usb.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
  ),
  Computer(
    title: 'Port Clavier USB',
    falseValue: '',
    imageUrl: 'assets/usb.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
  ),
  Computer(
    title: 'Port Clavier',
    imageUrl: 'assets/clavier_p.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Port Alimentation',
    imageUrl: 'assets/port_a.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Port Moniteur',
    imageUrl: 'assets/vga_p.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
];
final List<String> choiseValueOfComputerCable = [
  'Cable Souris',
  'Cable Clavier',
  'Cable Alimentation',
  'Cable Moniteur',
  'Cable Souris USB',
  'Cable Clavier USB',
];

final computerCableElement = [
  Computer(
    title: 'Cable Souris',
    falseValue: '',
    imageUrl: 'assets/souris_cable.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
  ),
  Computer(
    title: 'Cable Souris USB',
    falseValue: '',
    imageUrl: 'assets/usb_key2.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
  ),
  Computer(
    title: 'Cable Clavier',
    imageUrl: 'assets/clavier_cable.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Cable Clavier USB',
    imageUrl: 'assets/usb_key.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Cable Alimentation',
    imageUrl: 'assets/alimentation.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
  Computer(
    title: 'Cable Moniteur',
    imageUrl: 'assets/vga_cable.png',
    valueIsDrope: ValueNotifier(false),
    isCorrectAnswer: ValueNotifier(false),
    falseValue: '',
  ),
];
