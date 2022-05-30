import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'chapitre/chap_1/chapitre1_view_model.dart';
import 'connexion_view.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [Provider(create: (context) => Chapitre1ViewModel(0))],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Easy learning',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            primaryColor: Colors.blueAccent,
          ),
          home: LoginPage(),
        ),
      );
}
