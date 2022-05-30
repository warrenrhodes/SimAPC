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
      backgroundColor: AppColors.kDarkHomeRGBO,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false),
              icon: const Icon(Icons.logout))
        ],
        backgroundColor: AppColors.kDarkBlueDarkRGBO,
        title: const Text("SimAPC"),
      ),
      body: child,
      drawer: Drawer(
        backgroundColor: AppColors.kDarkHomeRGBO,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              //header of drawer
              decoration: BoxDecoration(
                color: AppColors.kDarkBlueDarkRGBO,
              ),
              child: Text(
                'SimApc',
                style: TextStyle(
                  color: AppColors.kWhiteColor,
                  fontSize: 24,
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
                color: AppColors.kWhite70,
              ),
              title: const Text(
                'Home',
                style: TextStyle(color: AppColors.kWhite70),
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
                color: AppColors.kWhite70,
              ),
              title: const Text(
                'Prenium',
                style: TextStyle(color: AppColors.kWhite70),
              ),
            ),
            ListTile(
              onTap: (() => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Lesson1View()),
                  (route) => false)),
              leading: Icon(
                Icons.label_important,
                color: AppColors.kWhite70,
              ),
              title: Text(
                "Unite D'enseignement 1",
                style: TextStyle(color: AppColors.kWhite70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
