import 'package:dotted_border/dotted_border.dart';
import 'package:easy_learning/chapitre/chap_1/chapitre1_view_model.dart';
import 'package:easy_learning/chapitre/chap_1/lessons/lesson_1/lesson1_view.dart';
import 'package:easy_learning/data/data.dart';
import 'package:easy_learning/utils/app_colors.dart';
import 'package:easy_learning/utils/bouton.dart';
import 'package:easy_learning/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'prerequis_controller.dart';

class Chapitre1PrerequisView extends StatelessWidget {
  const Chapitre1PrerequisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<Computer> computerListExo1 = computerElement.map<Computer>((e) {
      e.falseValue = '';
      e.valueIsDrope.value = false;
      e.isCorrectAnswer.value = false;
      return e;
    }).toList();
    final List<String> correctValuesExo1 = [];
    correctValuesExo1.addAll(choiseValueOfComputer);

    // Using for exo2.
    final List<Computer> computerPortListExo2 = computerPort.map<Computer>((e) {
      e.falseValue = '';
      e.valueIsDrope.value = false;
      e.isCorrectAnswer.value = false;
      return e;
    }).toList();
    final List<String> choiseValuesOfPortExo2 = [];
    choiseValuesOfPortExo2.addAll(choiseValueOfPort);

    // Using for exo3.
    final List<Computer> computerCableListExo3 =
        computerAlimentationCables.map<Computer>((e) {
      e.falseValue = '';
      e.valueIsDrope.value = false;
      e.isCorrectAnswer.value = false;
      return e;
    }).toList();
    final List<String> choiseValuesOfAlimentationCables = [];
    choiseValuesOfAlimentationCables.addAll(choiseValueOfAlimentationCable);

    final chapitre1Model = Provider.of<Chapitre1ViewModel>(context);
    return ChangeNotifierProvider<PrerequisExo1Controller>(
      create: (context) => PrerequisExo1Controller(
        computerListExo1,
        correctValuesExo1,
        false,
        computerPortListExo2,
        choiseValuesOfPortExo2,
        false,
        computerCableListExo3,
        choiseValuesOfAlimentationCables,
        false,
      ),
      child: Builder(builder: (context) {
        final controller = Provider.of<PrerequisExo1Controller>(context);
        return ScaffoldWidget(
          child: controller.exo1
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(children: [
                    Card(
                        color: AppColors.kDarkBlueDarkRGBO,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15.0),
                            child: _exo1(chapitre1Model, controller))),
                  ]),
                )
              : controller.exo2
                  ? SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(children: [
                        Card(
                            color: AppColors.kDarkBlueDarkRGBO,
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15.0),
                                child: _exo2(chapitre1Model, controller))),
                      ]),
                    )
                  : controller.exo3
                      ? SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(children: [
                            Card(
                                color: AppColors.kDarkBlueDarkRGBO,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 15.0),
                                    child: _exo3(chapitre1Model, controller))),
                          ]),
                        )
                      : SizedBox(),
        );
      }),
    );
  }

  Widget _exo1(
      Chapitre1ViewModel chapitre1model, PrerequisExo1Controller controller) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: const TextSpan(
                  text: 'Test 1:  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.blue),
                  children: [
                    TextSpan(
                        text: ' Identifier les périphériques de base ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: AppColors.kWhite70)),
                  ]),
            ),
          ),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: controller.computerListExo1
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
                          builder: (context, candidateData, rejectedData) {
                            return ValueListenableBuilder<bool>(
                                valueListenable: e.valueIsDrope,
                                builder: (context, value, child) {
                                  return DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: AppColors.kWhite70,
                                    strokeWidth: 2,
                                    dashPattern: const [8],
                                    child: ClipRRect(
                                      child: SizedBox(
                                        width: 100,
                                        child:
                                            Consumer<PrerequisExo1Controller>(
                                                builder: (context, controller,
                                                    child) {
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
                            controller.removeDropElememtExo1(data);
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
          Consumer<PrerequisExo1Controller>(
              builder: (context, snapshot, child) {
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: controller.correctValueExo1
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
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: roundedSmallButton(Colors.blueAccent, 170, 45),
                onPressed: () {
                  if (controller.keepCorrectValueExo1.length !=
                      computerElement.length) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Completez l'exercice !!!",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ));
                  } else {
                    controller.checkValueExo1(true);
                    chapitre1model.updatePrerequisValue(
                        chapitre1model.prerequisChapitre1 +
                            controller.moyenneExo1);

                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "Moyenne obtenue: ",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.kBlackColor),
                              ),
                            ),
                            const SizedBox(height: 20),
                            RichText(
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
                            )
                          ],
                        ),
                        actions: <Widget>[
                          controller.moyenneExo1 >= 5.0
                              ? TextButton(
                                  onPressed: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Lesson1View())),
                                  child: const Text('Lesson 1'),
                                )
                              : TextButton(
                                  onPressed: () {
                                    controller.updateExercice();
                                    Navigator.pop(context);
                                    chapitre1model.updatePrerequisValue(
                                        chapitre1model.prerequisChapitre1 +
                                            controller.moyenneExo1);
                                    controller.restStartExo1();
                                  },
                                  child: const Text('test suivant'),
                                ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Valider',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _exo2(
      Chapitre1ViewModel chapitre1model, PrerequisExo1Controller controller) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: const TextSpan(
                  text: 'Test 2:  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.blue),
                  children: [
                    TextSpan(
                        text:
                            ' Identifier les ports de branchement (port USB, PS2, VGA, DVI) de ces périphériques ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: AppColors.kWhite70)),
                  ]),
            ),
          ),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: controller.computerPortListExo2
                .map((e) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          e.imageUrl,
                          alignment: Alignment.center,
                          width: 100,
                          height: 100,
                        ),
                        DragTarget(
                          builder: (context, candidateData, rejectedData) {
                            return ValueListenableBuilder<bool>(
                                valueListenable: e.valueIsDrope,
                                builder: (context, value, child) {
                                  return DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: AppColors.kWhite70,
                                    strokeWidth: 2,
                                    dashPattern: const [8],
                                    child: ClipRRect(
                                      child: SizedBox(
                                        width: 100,
                                        child:
                                            Consumer<PrerequisExo1Controller>(
                                                builder: (context, controller,
                                                    child) {
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
                            controller.removeDropElememtExo2(data);
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
          Consumer<PrerequisExo1Controller>(
              builder: (context, snapshot, child) {
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: controller.choiseValue
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
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: roundedSmallButton(Colors.blueAccent, 170, 45),
                onPressed: () {
                  if (controller.keepCorrectValueExo2.length !=
                      computerPort.length) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Completez l'exercice !!!",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ));
                  } else {
                    controller.checkValueExo2(true);
                    chapitre1model.updatePrerequisValue(
                        chapitre1model.prerequisChapitre1 +
                            controller.moyenneExo2);
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "Moyenne obtenue: ",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.kBlackColor),
                              ),
                            ),
                            const SizedBox(height: 20),
                            RichText(
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
                            )
                          ],
                        ),
                        actions: <Widget>[
                          controller.moyenneExo2 >= 5.0
                              ? TextButton(
                                  onPressed: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Lesson1View())),
                                  child: const Text('Lesson 1'),
                                )
                              : TextButton(
                                  onPressed: () {
                                    controller.updateExercice();
                                    Navigator.pop(context);
                                    chapitre1model.updatePrerequisValue(
                                        chapitre1model.prerequisChapitre1 +
                                            controller.moyenneExo2);
                                    controller.restStartExo2();
                                  },
                                  child: const Text('test suivant'),
                                ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Valider',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ],
          ),
        ],
      );
    });
  }

  Widget _exo3(
      Chapitre1ViewModel chapitre1model, PrerequisExo1Controller controller) {
    return Builder(builder: (context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: const TextSpan(
                  text: 'Test 3:  ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColors.blue),
                  children: [
                    TextSpan(
                        text: ' Identifier les câbles de branchement',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: AppColors.kWhite70)),
                  ]),
            ),
          ),
          Wrap(
            spacing: 20,
            runSpacing: 10,
            children: controller.computerPortListExo3
                .map((e) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          e.imageUrl,
                          alignment: Alignment.center,
                          width: 100,
                          height: 100,
                        ),
                        DragTarget(
                          builder: (context, candidateData, rejectedData) {
                            return ValueListenableBuilder<bool>(
                                valueListenable: e.valueIsDrope,
                                builder: (context, value, child) {
                                  return DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: AppColors.kWhite70,
                                    strokeWidth: 2,
                                    dashPattern: const [8],
                                    child: ClipRRect(
                                      child: SizedBox(
                                        width: 100,
                                        child:
                                            Consumer<PrerequisExo1Controller>(
                                                builder: (context, controller,
                                                    child) {
                                          return _elevationButton(
                                              e.valueIsDrope.value,
                                              e.falseValue,
                                              e.title,
                                              controller.checkExo3);
                                        }),
                                      ),
                                    ),
                                  );
                                });
                          },
                          onAccept: (data) {
                            e.valueIsDrope.value = !e.valueIsDrope.value;
                            e.falseValue = data as String;
                            controller.removeDropElememtExo3(data);
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
          Consumer<PrerequisExo1Controller>(
              builder: (context, snapshot, child) {
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: controller.choiseValueExo3
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
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                style: roundedSmallButton(Colors.blueAccent, 170, 45),
                onPressed: () {
                  if (controller.keepCorrectValueExo3.length !=
                      computerAlimentationCables.length) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Completez l'exercice !!!",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ));
                  } else {
                    controller.checkValueExo3(true);
                    chapitre1model.updatePrerequisValue(
                        chapitre1model.prerequisChapitre1 +
                            controller.moyenneExo3);
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: "Moyenne obtenue: ",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.kBlackColor),
                              ),
                            ),
                            const SizedBox(height: 20),
                            RichText(
                              text: TextSpan(
                                  text: '${controller.moyenneExo3}',
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
                            )
                          ],
                        ),
                        actions: <Widget>[
                          controller.moyenneExo3 >= 5.0
                              ? TextButton(
                                  onPressed: () => Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const Lesson1View())),
                                  child: const Text('Lesson 1'),
                                )
                              : TextButton(
                                  onPressed: () {
                                    controller.updateExercice();
                                    Navigator.pop(context);
                                    chapitre1model.updatePrerequisValue(
                                        chapitre1model.prerequisChapitre1 +
                                            controller.moyenneExo3);
                                    controller.restStartExo3();
                                  },
                                  child: const Text('test suivant'),
                                ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Valider',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
            ],
          ),
        ],
      );
    });
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
                color: AppColors.kWhite70),
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
}
