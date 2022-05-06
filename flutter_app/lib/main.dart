import "dart:io";
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:flutter_app/common/colors.dart';
import "package:flutter_app/features/animals/models/animals_model.dart";
import "package:firebase_core/firebase_core.dart";
import 'package:flutter_app/features/speaks/models/notification_service.dart';
import 'package:flutter_app/features/speaks/models/speak_model.dart';
import 'package:flutter_app/features/front_page/front_page.dart';
import "package:flutter_app/routes.dart";
import "package:provider/provider.dart";
import "common/ioc.dart";
import "features/home/models/home_model.dart";
import 'features/home/ui/home.dart';
import "firebase_options.dart";
import "package:flutter_app/features/home/models/home_model.dart";

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();

  setupIoC();

  await NotificationService().init();

  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AnimalsModel>(
          create: (context) => AnimalsModel(),
        ),
        ChangeNotifierProvider<HomeModel>(
          create: (context) => HomeModel(),
        ),
        ChangeNotifierProvider<SpeakModel>(
          create: (context) => SpeakModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Zoo App",
        initialRoute: "/front-page",
        onGenerateRoute: Routes.generateRoute,
        theme: ThemeData(
          fontFamily: "Inter",
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
