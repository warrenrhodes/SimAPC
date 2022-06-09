import 'package:easy_learning/chapitre/chap_list.dart';
import 'package:flutter/material.dart';

import '../chapitre/chap_1/lessons/lesson_1/lesson1_view.dart';
import '../chapitre/chap_1/prerequis_chap_1.dart/prerequis.dart';
import '../connexion_view.dart';
import '../main.dart';
import 'app_colors.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget child;
  ScaffoldWidget({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false),
              icon: const Icon(Icons.logout))
        ],
        backgroundColor: AppColors.kBlackColor,
        title: const Text("SimAPC"),
      ),
      body: child,
      drawer: Drawer(
        backgroundColor: AppColors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              //header of drawer
              decoration: BoxDecoration(
                color: AppColors.kOrange600,
              ),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'SimApc',
                      style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      'Class de 6 ème',
                      style: TextStyle(
                        color: AppColors.kBlackColor,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: (() => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => ChapitreList()),
                  (route) => false)),
              leading: const Icon(
                Icons.home,
                color: AppColors.kBlackColor,
              ),
              title: const Text(
                'Home',
                style: TextStyle(color: AppColors.kBlackColor),
              ),
            ),
            ListTile(
              onTap: (() => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Chapitre1PrerequisView()),
                  (route) => false)),
              leading: const Icon(
                Icons.label_important,
                color: AppColors.kBlackColor,
              ),
              title: const Text(
                'Test Prerequis',
                style: TextStyle(color: AppColors.kBlackColor),
              ),
            ),
            ListTile(
              onTap: (() => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Lesson1View()),
                  (route) => false)),
              leading: Icon(
                Icons.label_important,
                color: AppColors.kBlackColor,
              ),
              title: Text(
                "Unite D'enseignement 1",
                style: TextStyle(color: AppColors.kBlackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
