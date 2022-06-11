import 'package:chewie/chewie.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_learning/utils/bouton.dart';
import 'package:easy_learning/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../../../utils/app_colors.dart';
import 'data.dart';
import 'lesson1_controller.dart';

class Lesson1View extends StatefulWidget {
  @override
  State<Lesson1View> createState() => _Lesson1ViewState();
}

class _Lesson1ViewState extends State<Lesson1View> {
  ChewieController chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.asset('assets/learning.mp4'),
      autoInitialize: true,
      allowFullScreen: false,
      looping: false);

  @override
  void dispose() {
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Lesson1Controller>(
        create: (context) => Lesson1Controller(exo1Ligne1, exo1Ligne2,
            exo1Ligne3, exo1Line4, computerElements, port),
        child: Builder(builder: (context) {
          final controller = Provider.of<Lesson1Controller>(context);
          return ScaffoldWidget(
            child: DefaultTabController(
              length: 5,
              child: Scaffold(
                backgroundColor: AppColors.kWhiteColor,
                appBar: AppBar(
                  title: const Text("Unite D'apprentissage 1"),
                  centerTitle: true,
                  backgroundColor: AppColors.kOrange600,
                  bottom: const TabBar(tabs: [
                    Text('Problematique'),
                    Text('Cours'),
                    Text('Test 1'),
                    Text('Test 2'),
                    Text('Test 3'),
                  ]),
                ),
                body: TabBarView(
                  children: [
                    _probleme(controller, context),
                    _lesson1(controller, context),
                    _test1(controller, context),
                    _exoGroup1(controller),
                    _exoGroup2(controller, context),
                  ],
                ),
              ),
            ),
          );
        }));
  }

  SingleChildScrollView _exoGroup2(
      Lesson1Controller controller, BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              '\nEn l’absence de votre enseignant d’informatique, le surveillant général sollicite travailler sur l’un des ordinateurs de la salle informatique. Malheureusement il se rend compte que tous les périphériques des ordinateurs sont déconnectés. Pour cela il sollicite votre aide. Alors aidez-le en répondant aux questions suivantes : ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  wordSpacing: 3,
                  color: AppColors.kBlackColor),
            ),
          ),
          const Text(
            "\n1. Où doit-on connecter le clavier, la souris, l’écran et le l'alimenation?\n ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColors.kBlackColor),
          ),
          Builder(builder: (context) {
            return Column(
              children: [
                Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: computerPortElement
                      .map((e) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                e.imageUrl,
                                alignment: Alignment.center,
                                width: 80,
                                height: 80,
                              ),
                              DragTarget(
                                builder:
                                    (context, candidateData, rejectedData) {
                                  return ValueListenableBuilder<bool>(
                                      valueListenable: e.valueIsDrope,
                                      builder: (context, value, child) {
                                        return DottedBorder(
                                          borderType: BorderType.RRect,
                                          color: AppColors.kBlackColor,
                                          strokeWidth: 2,
                                          dashPattern: const [8],
                                          child: ClipRRect(
                                            child: SizedBox(
                                              width: 100,
                                              child:
                                                  Consumer<Lesson1Controller>(
                                                      builder: (context,
                                                          controller, child) {
                                                return _elevationButton(
                                                    e.valueIsDrope.value,
                                                    e.falseValue,
                                                    e.title,
                                                    controller.checkExo1);
                                              }),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                onAccept: (data) {
                                  e.valueIsDrope.value = !e.valueIsDrope.value;
                                  e.falseValue = data as String;
                                  controller.removeDropElememtExo1(
                                      data, choiseValueOfComputerPort);
                                },
                                onWillAccept: (data) {
                                  if (e.falseValue.isEmpty) {
                                    return true;
                                  }
                                  return false;
                                },
                              )
                            ],
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 25,
                ),
                Consumer<Lesson1Controller>(
                    builder: (context, snapshot, child) {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: choiseValueOfComputerPort
                        .map(
                          (e) => Draggable(
                            data: e,
                            feedback: Material(
                              child: ElevatedButton(
                                style: roundedSmallButton(Colors.grey, 15, 40),
                                onPressed: () {},
                                child: Text(e,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            ),
                            child: ElevatedButton(
                              style: roundedSmallButton(Colors.grey, 80, 40),
                              onPressed: () {},
                              child: Text(e,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            childWhenDragging: const SizedBox.shrink(),
                          ),
                        )
                        .toList(),
                  );
                }),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<Lesson1Controller>(
                        builder: (context, snapshot, child) {
                      return RichText(
                        text: TextSpan(
                            text: '${controller.moyenneExo1}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: AppColors.green),
                            children: const [
                              TextSpan(
                                  text: ' /10',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: AppColors.blue)),
                            ]),
                      );
                    }),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: roundedSmallButton(Colors.blueAccent, 170, 45),
                      onPressed: () {
                        if (controller.keepCorrectValueExo1.length !=
                            computerPortElement.length) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Completez l'exercice !!!",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ));
                        } else {
                          controller.checkValueExo1(true, computerPortElement);
                          if (controller.childPassExam()) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text:
                                            "Bravo vous avez validez tous les exercices",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.kBlackColor),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('Valider',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.restStartExo1(
                              choiseValueOfComputerPort, computerPortElement);
                        },
                        tooltip: 'restart',
                        iconSize: 40,
                        color: Colors.green,
                        icon: const Icon(
                          Icons.restart_alt,
                        ))
                  ],
                ),
              ],
            );
          }),
          const Text(
            "\n2. Identifier les cables correspond au different peripherique(clavier, souris, moniteur, alimentation).\n ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColors.kBlackColor),
          ),
          Builder(builder: (context) {
            return Column(
              children: [
                Wrap(
                  spacing: 20,
                  runSpacing: 10,
                  children: computerCableElement
                      .map((e) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                e.imageUrl,
                                alignment: Alignment.center,
                                width: 80,
                                height: 80,
                              ),
                              DragTarget(
                                builder:
                                    (context, candidateData, rejectedData) {
                                  return ValueListenableBuilder<bool>(
                                      valueListenable: e.valueIsDrope,
                                      builder: (context, value, child) {
                                        return DottedBorder(
                                          borderType: BorderType.RRect,
                                          color: AppColors.kBlackColor,
                                          strokeWidth: 2,
                                          dashPattern: const [8],
                                          child: ClipRRect(
                                            child: SizedBox(
                                              width: 100,
                                              child:
                                                  Consumer<Lesson1Controller>(
                                                      builder: (context,
                                                          controller, child) {
                                                return _elevationButton(
                                                    e.valueIsDrope.value,
                                                    e.falseValue,
                                                    e.title,
                                                    controller.checkExo2);
                                              }),
                                            ),
                                          ),
                                        );
                                      });
                                },
                                onAccept: (data) {
                                  e.valueIsDrope.value = !e.valueIsDrope.value;
                                  e.falseValue = data as String;
                                  controller.removeDropElememtExo2(
                                      data, choiseValueOfComputerCable);
                                },
                                onWillAccept: (data) {
                                  if (e.falseValue.isEmpty) {
                                    return true;
                                  }
                                  return false;
                                },
                              )
                            ],
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 25,
                ),
                Consumer<Lesson1Controller>(
                    builder: (context, snapshot, child) {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: choiseValueOfComputerCable
                        .map(
                          (e) => Draggable(
                            data: e,
                            feedback: Material(
                              child: ElevatedButton(
                                style: roundedSmallButton(Colors.grey, 15, 40),
                                onPressed: () {},
                                child: Text(e,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black)),
                              ),
                            ),
                            child: ElevatedButton(
                              style: roundedSmallButton(Colors.grey, 80, 40),
                              onPressed: () {},
                              child: Text(e,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                            ),
                            childWhenDragging: const SizedBox.shrink(),
                          ),
                        )
                        .toList(),
                  );
                }),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<Lesson1Controller>(
                        builder: (context, snapshot, child) {
                      return RichText(
                        text: TextSpan(
                            text: '${controller.moyenneExo2}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: AppColors.green),
                            children: const [
                              TextSpan(
                                  text: ' /10',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: AppColors.blue)),
                            ]),
                      );
                    }),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      style: roundedSmallButton(Colors.blueAccent, 170, 45),
                      onPressed: () {
                        if (controller.keepCorrectValueExo2.length !=
                            computerCableElement.length) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Completez l'exercice !!!",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ));
                        } else {
                          controller.checkValueExo2(true, computerCableElement);
                          if (controller.childPassExam()) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text:
                                            "Bravo vous avez validez tous les exercices",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.kBlackColor),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                      child: const Text('Valider',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.restStartExo2(
                              choiseValueOfComputerCable, computerCableElement);
                        },
                        tooltip: 'restart',
                        iconSize: 40,
                        color: Colors.green,
                        icon: const Icon(
                          Icons.restart_alt,
                        ))
                  ],
                ),
              ],
            );
          }),
        ]),
      ),
    );
  }

  SingleChildScrollView _exoGroup1(Lesson1Controller controller) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "\n1. A quel endroit de l’unité centrale connecte-t-on les périphériques ? ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      wordSpacing: 3,
                      color: AppColors.kBlackColor)),
              _exo1(
                  choiseValueList: controller.choiseValueOfExoLine1,
                  valueResult: "A l’arrière de l’unité centrale",
                  userValueChoise: controller.choiseValue,
                  updateChoiseValue: controller.updateChoiseValueLine1,
                  checkValueChoiseByUser:
                      controller.checkValueChoiseByUserLine1,
                  restartAllValue: controller.restartAllValueLine1,
                  valueIsChoise: controller.checkValueLine1),
              const Text(
                  "\n2. De quoi est constitué l’arrière de l’unité centrale ?",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      wordSpacing: 3,
                      color: AppColors.kBlackColor)),
              _exo1(
                  choiseValueList: controller.choiseValueOfExoLine2,
                  valueResult:
                      "De prises ou ports aux couleurs et formes différentes",
                  userValueChoise: controller.choiseValueLine2,
                  updateChoiseValue: controller.updateChoiseValueLine2,
                  checkValueChoiseByUser:
                      controller.checkValueChoiseByUserLine2,
                  restartAllValue: controller.restartAllValueLine2,
                  valueIsChoise: controller.checkValueLine2),
              const Text(
                  "\n3. Comment identifier ou reconnaitre le port de chaque périphérique ?",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      wordSpacing: 3,
                      color: AppColors.kBlackColor)),
              _exo1(
                  choiseValueList: controller.choiseValueOfExoLine3,
                  valueResult: "Couleur et forme",
                  userValueChoise: controller.choiseValueLine3,
                  updateChoiseValue: controller.updateChoiseValueLine3,
                  checkValueChoiseByUser:
                      controller.checkValueChoiseByUserLine3,
                  restartAllValue: controller.restartAllValueLine3,
                  valueIsChoise: controller.checkValueLine3,
                  exemple:
                      'Clavier port rond de couleur violette, souris port rond de couleur verte, écran port rectangulaire de couleur bleue…'),
              const Text("\n4. Nommez les différents ports ",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      wordSpacing: 3,
                      color: AppColors.kBlackColor)),
              _nameTheDifferentPort(
                choiseValueList: controller.choiseValueOfExoLine4,
                valueResult: [
                  "Port ps2",
                  "Port Série",
                  "Port Parallèle",
                  "Port USB",
                  "Port VGA",
                  "Port SCI",
                ],
                updateChoiseValue: controller.updateChoiseValueLine4,
                checkValueChoiseByUser: controller.checkValueChoiseByUserLine4,
                restartAllValue: controller.restartAllValueLine4,
                valueIsChoise: controller.checkValueLine4,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  SingleChildScrollView _test1(
      Lesson1Controller controller, BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "\n1. Rassembler les éléments d’un ordinateur",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: AppColors.kBlackColor),
          ),
          Stack(
            children: [
              Image.asset(
                'assets/tts.png',
              ),
              Positioned(
                  top: 132,
                  left: 107,
                  child: DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        height: 25,
                        width: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _color(controller.sourisCableIsDrop,
                                  controller.sourisCableAccept),
                              width: 4),
                        ),
                      );
                    },
                    onAccept: (data) {
                      controller.updateAcceptOfSourisCable();
                    },
                    onWillAccept: (data) {
                      if (data == 'souris') {
                        debugPrint('true');
                        return true;
                      }
                      return false;
                    },
                  )),
              controller.sourisCableAccept
                  ? Positioned(
                      top: 85,
                      left: 110,
                      child: Image.asset(
                        'assets/souris_cable.png',
                        width: 25,
                        height: 80,
                      ),
                    )
                  : const SizedBox(),
              Positioned(
                  bottom: 40,
                  right: 155,
                  child: DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        height: 20,
                        width: 25,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _color(controller.usb1CableIsDrop,
                                  controller.usb1CableAccepte),
                              width: 4),
                        ),
                      );
                    },
                    onAccept: (data) {
                      controller.updateAcceptOfUsbCable();
                    },
                    onWillAccept: (data) {
                      if (data == 'usb') {
                        debugPrint('true');
                        return true;
                      }
                      return false;
                    },
                  )),
              controller.usb1CableAccepte
                  ? Positioned(
                      bottom: 45,
                      right: 155,
                      child: Image.asset(
                        'assets/usb_key2.png',
                        width: 25,
                        height: 50,
                      ),
                    )
                  : const SizedBox(),
              Positioned(
                  bottom: 18,
                  right: 135,
                  child: DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        height: 20,
                        width: 25,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _color(controller.usb2CableIsDrop,
                                  controller.usb2CableAccepte),
                              width: 4),
                        ),
                      );
                    },
                    onAccept: (data) {
                      controller.updateAcceptOfUsb2Cable();
                    },
                    onWillAccept: (data) {
                      if (data == 'usb2') {
                        debugPrint('usb2');
                        return true;
                      }
                      return false;
                    },
                  )),
              controller.usb2CableAccepte
                  ? Positioned(
                      bottom: -15,
                      right: 125,
                      child: Image.asset(
                        'assets/usb_key.png',
                        width: 40,
                        height: 50,
                      ),
                    )
                  : const SizedBox(),
              Positioned(
                  top: 159,
                  left: 107,
                  child: DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        height: 35,
                        width: 45,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _color(controller.clavierCableIsDrop,
                                  controller.clavierCableAccept),
                              width: 4),
                        ),
                      );
                    },
                    onAccept: (data) {
                      controller.updateAcceptOfClavierCable();
                    },
                    onWillAccept: (data) {
                      if (data == 'clavier') {
                        debugPrint('true');
                        return true;
                      }
                      return false;
                    },
                  )),
              controller.clavierCableAccept
                  ? Positioned(
                      bottom: -15,
                      left: 63,
                      child: Image.asset(
                        'assets/qq.png',
                        width: 80,
                        height: 80,
                      ),
                    )
                  : const SizedBox(),
              Positioned(
                  bottom: 20,
                  left: 20,
                  child: DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        height: 60,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _color(controller.alimentationCableIsDrop,
                                  controller.alimentationCableAccept),
                              width: 4),
                        ),
                      );
                    },
                    onAccept: (data) {
                      controller.updateAcceptOfAlimentationCable();
                    },
                    onWillAccept: (data) {
                      if (data == 'alimentation') {
                        debugPrint('true');
                        return true;
                      }
                      return false;
                    },
                  )),
              controller.alimentationCableAccept
                  ? Positioned(
                      top: 70,
                      left: 5,
                      child: Image.asset(
                        'assets/alimentation.png',
                        width: 80,
                        height: 80,
                      ),
                    )
                  : const SizedBox(),
              Positioned(
                  bottom: 18,
                  left: 180,
                  child: DragTarget(
                    builder: (context, candidateData, rejectedData) {
                      return Container(
                        height: 25,
                        width: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _color(controller.vgaCableIsDrop,
                                  controller.vgaCableAccept),
                              width: 4),
                        ),
                      );
                    },
                    onAccept: (data) {
                      controller.updateAcceptOfVgaCable();
                    },
                    onWillAccept: (data) {
                      if (data == 'vga') {
                        debugPrint('true');
                        return true;
                      }
                      return false;
                    },
                  )),
              controller.vgaCableAccept
                  ? Positioned(
                      bottom: 14,
                      left: 160,
                      child: Image.asset(
                        'assets/vga_cable.png',
                        width: 60,
                        height: 80,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          Wrap(
            children: [
              !controller.clavierCableAccept
                  ? Draggable(
                      data: 'clavier',
                      onDragStarted: controller.updateDropOfClavierCable,
                      onDraggableCanceled: (t, e) {
                        controller.onClavierDropCancel();
                      },
                      feedback: Image.asset(
                        'assets/qq.png',
                        width: 80,
                        height: 80,
                      ),
                      child: Image.asset(
                        'assets/qq.png',
                        width: 80,
                        height: 80,
                      ),
                      childWhenDragging: const SizedBox(),
                    )
                  : const SizedBox(),
              !controller.sourisCableAccept
                  ? GestureDetector(
                      child: Draggable(
                          data: 'souris',
                          onDragStarted: controller.updateDropOfSourisCable,
                          onDraggableCanceled: (t, e) {
                            controller.onSourisDropCancel();
                          },
                          feedback: Image.asset(
                            'assets/souris_cable.png',
                            width: 50,
                            height: 50,
                          ),
                          childWhenDragging: const SizedBox(),
                          child: Image.asset(
                            'assets/souris_cable.png',
                            width: 40,
                            height: 80,
                          )),
                    )
                  : const SizedBox(),
              !controller.usb1CableAccepte
                  ? Draggable(
                      data: 'usb',
                      onDragStarted: controller.updateDropOfUsbCable,
                      onDraggableCanceled: (t, e) {
                        controller.onUsbDropCancel();
                      },
                      feedback: Image.asset(
                        'assets/usb_key2.png',
                        width: 25,
                        height: 45,
                      ),
                      child: Image.asset(
                        'assets/usb_key2.png',
                        width: 25,
                        height: 45,
                      ),
                      childWhenDragging: const SizedBox(),
                    )
                  : const SizedBox(),
              !controller.usb2CableAccepte
                  ? Draggable(
                      data: 'usb2',
                      onDragStarted: controller.updateDropOfUsb2Cable,
                      onDraggableCanceled: (t, e) {
                        controller.onUsb2DropCancel();
                      },
                      feedback: Image.asset(
                        'assets/usb_key.png',
                        width: 25,
                        height: 45,
                      ),
                      child: Image.asset(
                        'assets/usb_key.png',
                        width: 25,
                        height: 45,
                      ),
                      childWhenDragging: const SizedBox(),
                    )
                  : const SizedBox(),
              !controller.vgaCableAccept
                  ? Draggable(
                      data: 'vga',
                      onDragStarted: controller.updateDropOfVgaCable,
                      onDraggableCanceled: (t, e) {
                        controller.onVgaDropCancel();
                      },
                      feedback: Image.asset(
                        'assets/vga_cable.png',
                        width: 50,
                        height: 50,
                      ),
                      childWhenDragging: const SizedBox(),
                      child: Image.asset(
                        'assets/vga_cable.png',
                        width: 40,
                        height: 80,
                      ))
                  : const SizedBox(),
              !controller.alimentationCableAccept
                  ? Draggable(
                      data: 'alimentation',
                      onDragStarted: controller.updateDropOfAlimentationsCable,
                      onDraggableCanceled: (t, e) {
                        controller.onAlimentationDropCancel();
                      },
                      feedback: Image.asset(
                        'assets/alimentation.png',
                        width: 50,
                        height: 50,
                      ),
                      childWhenDragging: const SizedBox(),
                      child: Image.asset(
                        'assets/alimentation.png',
                        width: 40,
                        height: 80,
                      ))
                  : const SizedBox(),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: controller.restartCableValue,
                  tooltip: 'restart',
                  iconSize: 40,
                  color: Colors.green,
                  icon: const Icon(
                    Icons.restart_alt,
                    semanticLabel: 'restart',
                  )),
              const Text('Restart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.kBlackColor))
            ],
          ),
          const Text(
              "2. Une fois tous les éléments assemblés, brancher le moniteur sur une prise, et l'unite centrale sur une autre",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.kBlackColor)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              !controller.computerCableAccepte
                  ? Draggable(
                      data: 'prise_femmelle',
                      onDragStarted: controller.updateDropOfComputerCable,
                      onDraggableCanceled: (t, e) {
                        controller.onComputerDropCancel();
                      },
                      feedback: Image.asset(
                        'assets/prise_femmelle.png',
                        width: 80,
                        height: 80,
                      ),
                      childWhenDragging: const SizedBox(),
                      child: Image.asset(
                        'assets/prise_femmelle.png',
                        width: 80,
                        height: 80,
                      ),
                    )
                  : const SizedBox(),
              !controller.ucCableAccept
                  ? Draggable(
                      data: 'prise_femmelle',
                      onDragStarted: controller.updateDropOfUcCable,
                      onDraggableCanceled: (t, e) {
                        controller.onUcDropCancel();
                      },
                      feedback: Image.asset(
                        'assets/prise_femmelle.png',
                        width: 80,
                        height: 80,
                      ),
                      childWhenDragging: const SizedBox(),
                      child: Image.asset(
                        'assets/prise_femmelle.png',
                        width: 80,
                        height: 80,
                      ),
                    )
                  : const SizedBox(),
              Stack(
                children: [
                  Image.asset(
                    'assets/prise.png',
                    width: 120,
                    height: 80,
                  ),
                  Positioned(
                      top: 25,
                      left: 12,
                      child: DragTarget(
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            height: 35,
                            width: 45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: _color(controller.computerCableIsDrop,
                                      controller.computerCableAccepte),
                                  width: 4),
                            ),
                          );
                        },
                        onAccept: (data) {
                          controller.updateAcceptOfComputerCable();
                        },
                        onWillAccept: (data) {
                          if (data == 'prise_femmelle') {
                            debugPrint('true');
                            return true;
                          }
                          return false;
                        },
                      )),
                  controller.computerCableAccepte
                      ? Positioned(
                          bottom: 5,
                          left: -25,
                          child: Image.asset(
                            'assets/prise_femmelle.png',
                            width: 60,
                            height: 60,
                          ),
                        )
                      : const SizedBox(),
                  Positioned(
                      top: 25,
                      left: 65,
                      child: DragTarget(
                        builder: (context, candidateData, rejectedData) {
                          return Container(
                            height: 35,
                            width: 45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: _color(controller.ucCableIsDrop,
                                      controller.ucCableAccept),
                                  width: 4),
                            ),
                          );
                        },
                        onAccept: (data) {
                          controller.updateAcceptOfUcCable();
                        },
                        onWillAccept: (data) {
                          if (data == 'prise_femmelle') {
                            debugPrint('true');
                            return true;
                          }
                          return false;
                        },
                      )),
                  controller.ucCableAccept
                      ? Positioned(
                          bottom: -5,
                          left: 23,
                          child: Image.asset(
                            'assets/prise_femmelle.png',
                            width: 80,
                            height: 80,
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: controller.restartPriseValue,
                  tooltip: 'restart',
                  iconSize: 40,
                  color: Colors.green,
                  icon: const Icon(
                    Icons.restart_alt,
                    semanticLabel: 'restart',
                  )),
              const Text('Restart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: AppColors.kBlackColor))
            ],
          ),
          const Text(
              "3. Appuyer sur les boutons Démarrer (écran et unité centrale)",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: AppColors.kBlackColor)),
          Row(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/monitor.png',
                    width: 120,
                    height: 120,
                  ),
                  controller.computerIsOn
                      ? Positioned(
                          top: -8,
                          right: 8,
                          child: Image.asset(
                            'assets/windows_start.gif',
                            width: 106,
                            height: 120,
                          ),
                        )
                      : const SizedBox(),
                  Positioned(
                    bottom: 25,
                    right: 2,
                    child: InkWell(
                        onTap: () {
                          if (!controller.setWindowns()) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text:
                                            "Verifiez que tous les cables sont branches",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.kBlackColor),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else if (!controller.ucIsOn ||
                              !controller.computerCableAccepte) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                  "Verifiez que l'unite central et moniteur sont allumez !!!",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ));
                          } else {
                            controller.updateComputerButton();
                          }
                        },
                        child: Icon(
                          Icons.settings_power_sharp,
                          color: controller.computerIsOn
                              ? AppColors.kGreenColor
                              : AppColors.kWhiteColor,
                        )),
                  )
                ],
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/computer.png',
                    width: 120,
                    height: 120,
                  ),
                  Positioned(
                    top: 47,
                    left: 50,
                    child: InkWell(
                        onTap: () {
                          if (!controller.setWindowns()) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text:
                                            "Verifiez que tous les cables sont branches",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: AppColors.kBlackColor),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            controller.updateUcButton();
                          }
                        },
                        child: Icon(
                          Icons.settings_power_sharp,
                          color: controller.ucIsOn
                              ? AppColors.kGreenColor
                              : AppColors.kWhiteColor,
                        )),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }

  SingleChildScrollView _probleme(
      Lesson1Controller controller, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SITUATION PROBLEME",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.blue),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 3),
              child: Text(
                '\n L’ordinateur Desktop de votre mère est tombé en panne, elle l’a remis à un agent de maintenance pour le réparer. Cet ordinateur  lui a été ramené après dépannage en pièces détachées. Ne s’y connaissant pas du tout dans ce domaine, elle fait appel à vous.\n ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    wordSpacing: 3,
                    color: AppColors.kBlackColor),
              ),
            ),
            const Text(
              "Par groupe de deux ou de trois répondez aux questions suivantes: ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  wordSpacing: 3,
                  color: AppColors.kBlackColor),
            ),
            RichText(
              text: const TextSpan(
                  text: 'Test 1:  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.kBlackColor),
                  children: [
                    TextSpan(
                        text:
                            'Identifier les composants de bases qui ont été remis à votre mère:',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: AppColors.kBlackColor)),
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            _simulation1(controller),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: const TextSpan(
                  text: 'Test 2:  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.kBlackColor),
                  children: [
                    TextSpan(
                        text:
                            'Identifier sur quel port connecter chaque périphérique à l’unité centrale  ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: AppColors.kBlackColor)),
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            _simulation2(controller),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _lesson1(
      Lesson1Controller controller, BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Chewie(
            controller: chewieController,
          ),
        ),
      ),
    );
  }

  Widget _exo1({
    required List<String> choiseValueList,
    required String valueResult,
    required String userValueChoise,
    required Function(String? value) updateChoiseValue,
    required void Function() checkValueChoiseByUser,
    required void Function() restartAllValue,
    required bool valueIsChoise,
    String? exemple,
  }) {
    return Card(
        color: AppColors.kDarkBlueDarkRGBO,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Column(
              children: [
                Column(
                    children: choiseValueList
                        .map((e) => Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 10,
                                        child: _iconOfValue(
                                            value: e,
                                            valueIsChoise: valueIsChoise,
                                            valueResult: valueResult,
                                            userValueChoise: userValueChoise)),
                                    Radio(
                                        value: e,
                                        groupValue: userValueChoise,
                                        onChanged: updateChoiseValue),
                                    Expanded(
                                        child: Text(
                                      e,
                                      style: const TextStyle(
                                        color: AppColors.kBlackColor,
                                      ),
                                    ))
                                  ],
                                ),
                                exemple != null &&
                                        valueIsChoise &&
                                        valueResult == userValueChoise &&
                                        e == userValueChoise
                                    ? RichText(
                                        text: TextSpan(
                                            text: 'Exemple:  ',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: AppColors.blue),
                                            children: [
                                              TextSpan(
                                                  text: exemple,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15,
                                                      wordSpacing: 5,
                                                      color: AppColors
                                                          .kBlackColor)),
                                            ]),
                                      )
                                    : const SizedBox(),
                              ],
                            ))
                        .toList()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: roundedSmallButton(Colors.blueAccent, 170, 45),
                      onPressed: checkValueChoiseByUser,
                      child: const Text('Valider',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    IconButton(
                        onPressed: restartAllValue,
                        tooltip: 'restart',
                        iconSize: 40,
                        color: Colors.green,
                        icon: const Icon(
                          Icons.restart_alt,
                        ))
                  ],
                )
              ],
            )));
  }

  Widget _elevationButton(
      bool valueIsDrope, String falseValue, String title, bool check) {
    if (!check) {
      if (valueIsDrope) {
        return FittedBox(
          child: ElevatedButton(
              style: roundedSmallButton(Colors.grey, 140, 40),
              onPressed: () {},
              child: Text(falseValue,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
        );
      }
      return Center(
        child: RichText(
          text: const TextSpan(
            text: 'Drop here',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: AppColors.kBlackColor),
          ),
        ),
      );
    } else {
      if (falseValue == title) {
        return Column(
          children: [
            FittedBox(
              child: ElevatedButton(
                  style: roundedSmallButton(Colors.green, 140, 40),
                  onPressed: () {},
                  child: Text(falseValue,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))),
            ),
            const Icon(
              Icons.check,
              color: AppColors.green,
            ),
          ],
        );
      }
      return Column(children: [
        FittedBox(
          child: ElevatedButton(
              style: roundedSmallButton(Colors.red, 140, 40),
              onPressed: () {},
              child: Text(falseValue,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black))),
        ),
        const Icon(
          Icons.close,
          color: AppColors.red,
        ),
      ]);
    }
  }

  _iconOfValue(
      {required bool valueIsChoise,
      required String valueResult,
      userValueChoise,
      value}) {
    if (valueIsChoise && value == userValueChoise) {
      if (valueResult == userValueChoise) {
        return const Icon(
          Icons.check,
          color: AppColors.green,
        );
      }
      return const Icon(
        Icons.close,
        color: AppColors.red,
      );
    }
    return const SizedBox();
  }

  _nameTheDifferentPort(
      {required Map<String, bool> choiseValueList,
      required List<String> valueResult,
      required Function(String value, bool? isCheck) updateChoiseValue,
      required Function() checkValueChoiseByUser,
      required Function() restartAllValue,
      required bool valueIsChoise}) {
    return Card(
      color: AppColors.kDarkBlueDarkRGBO,
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            Wrap(
              children: choiseValueList.keys
                  .map(
                    (e) => Row(
                      children: [
                        SizedBox(
                          width: 10,
                          child: _iconOfValueForCheck(
                              value: e,
                              valueIsChoise: valueIsChoise,
                              valueResult: valueResult,
                              choiseValueList: choiseValueList),
                        ),
                        Checkbox(
                          value: choiseValueList[e],
                          onChanged: (bool? value) {
                            updateChoiseValue(e, value);
                          },
                        ),
                        Text(
                          e,
                          style: const TextStyle(
                            color: AppColors.kBlackColor,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: roundedSmallButton(Colors.blueAccent, 170, 45),
                  onPressed: checkValueChoiseByUser,
                  child: const Text('Valider',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                IconButton(
                    onPressed: restartAllValue,
                    tooltip: 'restart',
                    iconSize: 40,
                    color: Colors.green,
                    icon: const Icon(
                      Icons.restart_alt,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  _iconOfValueForCheck(
      {required bool valueIsChoise,
      required List<String> valueResult,
      required Map<String, bool> choiseValueList,
      value}) {
    if (valueIsChoise && choiseValueList[value] == true) {
      if (valueResult.contains(value)) {
        return const Icon(
          Icons.check,
          color: AppColors.green,
        );
      }
      return const Icon(
        Icons.close,
        color: AppColors.red,
      );
    }
    return const SizedBox();
  }

  _color(bool sourisCableIsDrop, bool sourisCableAccept) {
    if (sourisCableIsDrop) {
      if (sourisCableAccept) {
        return AppColors.kGreenRGBO;
      }
      return AppColors.red;
    }
    return AppColors.blue;
  }

  _simulation1(Lesson1Controller controller) {
    return Column(children: [
      Wrap(spacing: 10, runSpacing: 10, children: [
        ValueListenableBuilder<ContainerNotifier>(
            valueListenable: controller.elemt1,
            builder: (context, value, child) {
              return DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return SizedBox(
                    child: Column(
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: controller.canCheck
                              ? !controller.imageError1
                                  ? Colors.green.shade600
                                  : AppColors.red
                              : AppColors.kBlackColor,
                          strokeWidth: 4,
                          dashPattern: const [8],
                          child: ClipRRect(
                            child: SizedBox(
                                width: 120,
                                height: 100,
                                child: controller.elemt1.value.image.isNotEmpty
                                    ? Image.asset(controller.elemt1.value.image)
                                    : const SizedBox()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: controller.canCheck
                                ? !controller.imageError1
                                    ? !controller.textError1
                                        ? Colors.green.shade600
                                        : AppColors.red
                                    : AppColors.red
                                : AppColors.kBlackColor,
                            width: 2,
                          )),
                          width: 120,
                          height: 40,
                          child: TextField(
                            controller:
                                controller.elemt1.value.textEditingController,
                            decoration: const InputDecoration(
                              hintText: 'Entrer le titre',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onAccept: (data) {
                  controller.elemt1.value.image = controller.imageDrap;
                  controller.updateImage('');
                },
                onWillAccept: (data) {
                  if (controller.elemt1.value.image.isEmpty) {
                    return true;
                  }
                  return false;
                },
              );
            }),
        ValueListenableBuilder<ContainerNotifier>(
            valueListenable: controller.portElemt2,
            builder: (context, value, child) {
              return DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return SizedBox(
                    child: Column(
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: controller.canCheck
                              ? !controller.imageError2
                                  ? Colors.green.shade600
                                  : AppColors.red
                              : AppColors.kBlackColor,
                          strokeWidth: 4,
                          dashPattern: const [8],
                          child: ClipRRect(
                            child: SizedBox(
                                width: 120,
                                height: 100,
                                child: controller.elemt2.value.image.isNotEmpty
                                    ? Image.asset(controller.elemt2.value.image)
                                    : const SizedBox()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: controller.canCheck
                                ? !controller.imageError2
                                    ? !controller.textError2
                                        ? Colors.green.shade600
                                        : AppColors.red
                                    : AppColors.red
                                : AppColors.kBlackColor,
                            width: 2,
                          )),
                          width: 120,
                          height: 40,
                          child: TextField(
                            controller:
                                controller.elemt2.value.textEditingController,
                            decoration: const InputDecoration(
                              hintText: 'Entrer le titre',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onAccept: (data) {
                  controller.elemt2.value.image = controller.imageDrap;
                  controller.updateImage('');
                },
                onWillAccept: (data) {
                  if (controller.elemt2.value.image.isEmpty) {
                    return true;
                  }
                  return false;
                },
              );
            }),
        ValueListenableBuilder<ContainerNotifier>(
            valueListenable: controller.elemt3,
            builder: (context, value, child) {
              return DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return SizedBox(
                    child: Column(
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: controller.canCheck
                              ? !controller.imageError3
                                  ? Colors.green.shade600
                                  : AppColors.red
                              : AppColors.kBlackColor,
                          strokeWidth: 4,
                          dashPattern: const [8],
                          child: ClipRRect(
                            child: SizedBox(
                                width: 120,
                                height: 100,
                                child: controller.elemt3.value.image.isNotEmpty
                                    ? Image.asset(controller.elemt3.value.image)
                                    : const SizedBox()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: controller.canCheck
                                ? !controller.imageError3
                                    ? !controller.textError3
                                        ? Colors.green.shade600
                                        : AppColors.red
                                    : AppColors.red
                                : AppColors.kBlackColor,
                            width: 2,
                          )),
                          width: 120,
                          height: 40,
                          child: TextField(
                            controller:
                                controller.elemt3.value.textEditingController,
                            decoration: const InputDecoration(
                              hintText: 'Entrer le titre',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onAccept: (data) {
                  controller.elemt3.value.image = controller.imageDrap;
                  controller.updateImage('');
                },
                onWillAccept: (data) {
                  if (controller.elemt3.value.image.isEmpty) {
                    return true;
                  }
                  return false;
                },
              );
            }),
        ValueListenableBuilder<ContainerNotifier>(
            valueListenable: controller.elemt4,
            builder: (context, value, child) {
              return DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return SizedBox(
                    child: Column(
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: controller.canCheck
                              ? !controller.imageError4
                                  ? Colors.green.shade600
                                  : AppColors.red
                              : AppColors.kBlackColor,
                          strokeWidth: 4,
                          dashPattern: const [8],
                          child: ClipRRect(
                            child: SizedBox(
                                width: 120,
                                height: 100,
                                child: controller.elemt4.value.image.isNotEmpty
                                    ? Image.asset(controller.elemt4.value.image)
                                    : const SizedBox()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: controller.canCheck
                                ? !controller.imageError4
                                    ? !controller.textError4
                                        ? Colors.green.shade600
                                        : AppColors.red
                                    : AppColors.red
                                : AppColors.kBlackColor,
                            width: 2,
                          )),
                          width: 120,
                          height: 40,
                          child: TextField(
                            controller:
                                controller.elemt4.value.textEditingController,
                            decoration: const InputDecoration(
                              hintText: 'Entrer le titre',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onAccept: (data) {
                  controller.elemt4.value.image = controller.imageDrap;
                  controller.updateImage('');
                },
                onWillAccept: (data) {
                  if (controller.elemt4.value.image.isEmpty) {
                    return true;
                  }
                  return false;
                },
              );
            }),
      ]),
      const SizedBox(
        height: 10,
      ),
      Wrap(
          runSpacing: 10,
          spacing: 10,
          children: controller.computerElements
              .map(
                (e) => Draggable(
                    data: e.imageUrl,
                    feedback: Material(
                      child: Container(
                        color: AppColors.gray,
                        child: Image.asset(
                          e.imageUrl,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    child: Container(
                      color: AppColors.gray,
                      child: Image.asset(
                        e.imageUrl,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    onDragStarted: () {
                      controller.updateImage(e.imageUrl);
                    },
                    onDragCompleted: () =>
                        controller.removeElementToComputerList(e.imageUrl)),
              )
              .toList()),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: roundedSmallButton(Colors.blueAccent, 170, 45),
            onPressed: () {
              controller.checkUserAnswer(computerReponse);
            },
            child: const Text('Valider',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          IconButton(
              onPressed: () {
                controller.restStartProbleme(computerElements);
              },
              tooltip: 'restart',
              iconSize: 40,
              color: Colors.green,
              icon: const Icon(
                Icons.restart_alt,
              )),
        ],
      )
    ]);
  }

  _simulation2(Lesson1Controller controller) {
    return Column(children: [
      Wrap(spacing: 10, runSpacing: 10, children: [
        ValueListenableBuilder<ContainerNotifier>(
            valueListenable: controller.portElemt1,
            builder: (context, value, child) {
              return DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return SizedBox(
                    child: Column(
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: controller.portCanCheck
                              ? !controller.portImageError1
                                  ? Colors.green.shade600
                                  : AppColors.red
                              : AppColors.kBlackColor,
                          strokeWidth: 4,
                          dashPattern: const [8],
                          child: ClipRRect(
                            child: SizedBox(
                                width: 120,
                                height: 100,
                                child:
                                    controller.portElemt1.value.image.isNotEmpty
                                        ? Image.asset(
                                            controller.portElemt1.value.image)
                                        : const SizedBox()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: controller.portCanCheck
                                ? !controller.portImageError1
                                    ? !controller.portTextError1
                                        ? Colors.green.shade600
                                        : AppColors.red
                                    : AppColors.red
                                : AppColors.kBlackColor,
                            width: 2,
                          )),
                          width: 120,
                          height: 40,
                          child: TextField(
                            controller: controller
                                .portElemt1.value.textEditingController,
                            decoration: const InputDecoration(
                              hintText: 'Entrer le titre',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onAccept: (data) {
                  controller.portElemt1.value.image = controller.portImageDrap;
                  controller.updateImage('');
                },
                onWillAccept: (data) {
                  if (controller.portElemt1.value.image.isEmpty) {
                    return true;
                  }
                  return false;
                },
              );
            }),
        ValueListenableBuilder<ContainerNotifier>(
            valueListenable: controller.portElemt2,
            builder: (context, value, child) {
              return DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return SizedBox(
                    child: Column(
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: controller.portCanCheck
                              ? !controller.portImageError2
                                  ? Colors.green.shade600
                                  : AppColors.red
                              : AppColors.kBlackColor,
                          strokeWidth: 4,
                          dashPattern: const [8],
                          child: ClipRRect(
                            child: SizedBox(
                                width: 120,
                                height: 100,
                                child:
                                    controller.portElemt2.value.image.isNotEmpty
                                        ? Image.asset(
                                            controller.portElemt2.value.image)
                                        : const SizedBox()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: controller.portCanCheck
                                ? !controller.portImageError2
                                    ? !controller.portTextError2
                                        ? Colors.green.shade600
                                        : AppColors.red
                                    : AppColors.red
                                : AppColors.kBlackColor,
                            width: 2,
                          )),
                          width: 120,
                          height: 40,
                          child: TextField(
                            controller: controller
                                .portElemt2.value.textEditingController,
                            decoration: const InputDecoration(
                              hintText: 'Entrer le titre',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onAccept: (data) {
                  controller.portElemt2.value.image = controller.portImageDrap;
                  controller.updateImage('');
                },
                onWillAccept: (data) {
                  if (controller.portElemt2.value.image.isEmpty) {
                    return true;
                  }
                  return false;
                },
              );
            }),
        ValueListenableBuilder<ContainerNotifier>(
            valueListenable: controller.portElemt3,
            builder: (context, value, child) {
              return DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return SizedBox(
                    child: Column(
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: controller.portCanCheck
                              ? !controller.portImageError3
                                  ? Colors.green.shade600
                                  : AppColors.red
                              : AppColors.kBlackColor,
                          strokeWidth: 4,
                          dashPattern: const [8],
                          child: ClipRRect(
                            child: SizedBox(
                                width: 120,
                                height: 100,
                                child:
                                    controller.portElemt3.value.image.isNotEmpty
                                        ? Image.asset(
                                            controller.portElemt3.value.image)
                                        : const SizedBox()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: controller.portCanCheck
                                ? !controller.portImageError3
                                    ? !controller.portTextError3
                                        ? Colors.green.shade600
                                        : AppColors.red
                                    : AppColors.red
                                : AppColors.kBlackColor,
                            width: 2,
                          )),
                          width: 120,
                          height: 40,
                          child: TextField(
                            controller: controller
                                .portElemt3.value.textEditingController,
                            decoration: const InputDecoration(
                              hintText: 'Entrer le titre',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onAccept: (data) {
                  controller.portElemt3.value.image = controller.portImageDrap;
                  controller.updateImage('');
                },
                onWillAccept: (data) {
                  if (controller.portElemt3.value.image.isEmpty) {
                    return true;
                  }
                  return false;
                },
              );
            }),
        ValueListenableBuilder<ContainerNotifier>(
            valueListenable: controller.portElemt4,
            builder: (context, value, child) {
              return DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return SizedBox(
                    child: Column(
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: controller.portCanCheck
                              ? !controller.portImageError4
                                  ? Colors.green.shade600
                                  : AppColors.red
                              : AppColors.kBlackColor,
                          strokeWidth: 4,
                          dashPattern: const [8],
                          child: ClipRRect(
                            child: SizedBox(
                                width: 120,
                                height: 100,
                                child:
                                    controller.portElemt4.value.image.isNotEmpty
                                        ? Image.asset(
                                            controller.portElemt4.value.image)
                                        : const SizedBox()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: controller.portCanCheck
                                ? !controller.portImageError4
                                    ? !controller.portTextError4
                                        ? Colors.green.shade600
                                        : AppColors.red
                                    : AppColors.red
                                : AppColors.kBlackColor,
                            width: 2,
                          )),
                          width: 120,
                          height: 40,
                          child: TextField(
                            controller: controller
                                .portElemt4.value.textEditingController,
                            decoration: const InputDecoration(
                              hintText: 'Entrer le titre',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onAccept: (data) {
                  controller.portElemt4.value.image = controller.portImageDrap;
                  controller.updateImage('');
                },
                onWillAccept: (data) {
                  if (controller.portElemt4.value.image.isEmpty) {
                    return true;
                  }
                  return false;
                },
              );
            }),
        ValueListenableBuilder<ContainerNotifier>(
            valueListenable: controller.portElemt5,
            builder: (context, value, child) {
              return DragTarget(
                builder: (context, candidateData, rejectedData) {
                  return SizedBox(
                    child: Column(
                      children: [
                        DottedBorder(
                          borderType: BorderType.RRect,
                          color: controller.portCanCheck
                              ? !controller.portImageError5
                                  ? Colors.green.shade600
                                  : AppColors.red
                              : AppColors.kBlackColor,
                          strokeWidth: 4,
                          dashPattern: const [8],
                          child: ClipRRect(
                            child: SizedBox(
                                width: 120,
                                height: 100,
                                child:
                                    controller.portElemt5.value.image.isNotEmpty
                                        ? Image.asset(
                                            controller.portElemt5.value.image)
                                        : const SizedBox()),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: controller.portCanCheck
                                ? !controller.portImageError5
                                    ? !controller.portTextError5
                                        ? Colors.green.shade600
                                        : AppColors.red
                                    : AppColors.red
                                : AppColors.kBlackColor,
                            width: 2,
                          )),
                          width: 120,
                          height: 40,
                          child: TextField(
                            controller: controller
                                .portElemt5.value.textEditingController,
                            decoration: const InputDecoration(
                              hintText: 'Entrer le titre',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                onAccept: (data) {
                  controller.portElemt5.value.image = controller.portImageDrap;
                  controller.updateImage('');
                },
                onWillAccept: (data) {
                  if (controller.portElemt5.value.image.isEmpty) {
                    return true;
                  }
                  return false;
                },
              );
            }),
      ]),
      const SizedBox(
        height: 10,
      ),
      Wrap(
          runSpacing: 10,
          spacing: 10,
          children: controller.portElements
              .map(
                (e) => Draggable(
                    data: e.imageUrl,
                    feedback: Material(
                      child: Container(
                        color: AppColors.gray,
                        child: Image.asset(
                          e.imageUrl,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    ),
                    child: Container(
                      color: AppColors.gray,
                      child: Image.asset(
                        e.imageUrl,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    childWhenDragging: const SizedBox.shrink(),
                    onDragStarted: () {
                      controller.portUpdateImage(e.imageUrl);
                    },
                    onDragCompleted: () =>
                        controller.removeElementToPortList(e.imageUrl)),
              )
              .toList()),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: roundedSmallButton(Colors.blueAccent, 170, 45),
            onPressed: () {
              controller.checkPortUserAnswer(portReponse);
            },
            child: const Text('Valider',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          IconButton(
              onPressed: () {
                controller.restStartPortProbleme(port);
              },
              tooltip: 'restart',
              iconSize: 40,
              color: Colors.green,
              icon: const Icon(
                Icons.restart_alt,
              )),
        ],
      )
    ]);
  }
}
