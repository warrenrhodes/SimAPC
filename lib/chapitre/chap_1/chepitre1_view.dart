import 'package:easy_learning/chapitre/chap_1/chapitre1_controller.dart';
import 'package:easy_learning/chapitre/chap_1/chapitre1_view_model.dart';
import 'package:easy_learning/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'lessons/lesson_1/lesson1_view.dart';
import 'prerequis_chap_1.dart/prerequis.dart';

class Chapitre1View extends StatelessWidget {
  const Chapitre1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chapitre1Model = Provider.of<Chapitre1ViewModel>(context);
    return ChangeNotifierProvider<Chapitre1Controller>(
      create: (context) => Chapitre1Controller(chapitre1Model),
      child: Builder(builder: (context) {
        final chapitre1Controller = Provider.of<Chapitre1Controller>(context);
        return ExpansionTile(
          initiallyExpanded: true,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding: const EdgeInsets.only(left: 40),
          backgroundColor: AppColors.kWhite70,
          collapsedBackgroundColor: AppColors.kBlack12,
          title: RichText(
            text: const TextSpan(
                text: 'Module 1:  ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.kBlackColor),
                children: [
                  TextSpan(
                      text:
                          ' Mise en œuvre de l’ordinateur et production de documents.',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: AppColors.kBlack54)),
                ]),
          ),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const Chapitre1PrerequisView()));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    color: AppColors.green,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: Text('Test prérequis',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15, color: AppColors.kBlackColor)),
                    )),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                    color: AppColors.kOrange600,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 15.0),
                      child: RichText(
                        text: const TextSpan(
                            text: 'Objectifs :',
                            style: TextStyle(
                                fontSize: 18, color: AppColors.kBlackColor),
                            children: [
                              TextSpan(
                                  text:
                                      " \n 👉 interconnecter les éléments de base d’un ordinateur ; \n 👉 démarrer l'ordinateur.",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.kBlackColor)),
                            ]),
                      ),
                    ))),
            const SizedBox(height: 10),
            Card(
              color: AppColors.kOrange600,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  childrenPadding: const EdgeInsets.only(left: 40),
                  title: RichText(
                    text: const TextSpan(
                        text: "Unite D'apprentissage 1:  ",
                        style: TextStyle(
                            fontSize: 18, color: AppColors.kBlackColor),
                        children: [
                          TextSpan(
                              text:
                                  ' Architecture de base des matériels et des logiciels',
                              style: TextStyle(
                                  fontSize: 15, color: AppColors.kBlackColor)),
                        ]),
                  ),
                  children: [
                    InkWell(
                      onTap: chapitre1Controller.prerequisChapitre1 < 5
                          ? () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      RichText(
                                        text: const TextSpan(
                                          text:
                                              "Valider les tests de prerequis pour passer a cette lesson",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: AppColors.kBlackColor),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      RichText(
                                        text: TextSpan(
                                            text: "Moyenne: ",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: AppColors.kBlackColor),
                                            children: [
                                              TextSpan(
                                                text:
                                                    "${chapitre1Controller.prerequisChapitre1}/10",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: AppColors.blue),
                                              )
                                            ]),
                                      ),
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
                          : () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => Lesson1View()));
                            },
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                              color: chapitre1Controller.prerequisChapitre1 < 5
                                  ? AppColors.gray.withOpacity(0.5)
                                  : AppColors.green,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15.0),
                                child: RichText(
                                  text: const TextSpan(
                                      text: "Unite D'enseignement 1:  ",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.kBlackColor),
                                      children: [
                                        TextSpan(
                                            text: 'Démarrage d’un ordinateur',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: AppColors.kBlackColor)),
                                      ]),
                                ),
                              ))),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        );
      }),
    );
  }
}
