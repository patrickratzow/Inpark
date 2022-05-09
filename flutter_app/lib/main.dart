import "dart:io";
import "package:flutter/material.dart";
import "package:flutter_app/features/animals/models/animals_model.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter_app/features/speaks/models/notification_service.dart";
import "package:flutter_app/features/speaks/models/speak_model.dart";
import "package:flutter_app/navigation/navigation_screen.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:intl/date_symbol_data_local.dart";
import "package:provider/provider.dart";
import "common/ioc.dart";
import "features/calendar/models/calendar_model.dart";
import "features/park_events/models/event_model.dart";
import "features/home/models/home_model.dart";
import "firebase_options.dart";
import "package:flutter_app/features/home/models/home_model.dart";

import "navigation/navigation_model.dart";

// ...

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  HttpOverrides.global = MyHttpOverrides();

  initializeDateFormatting();
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

class MyApp extends HookWidget {
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
        ChangeNotifierProvider<ParkEventModel>(
          create: (context) => ParkEventModel(),
        ),
        ChangeNotifierProvider<SpeakModel>(
          create: (context) => SpeakModel(),
        ),
        ChangeNotifierProvider<CalendarModel>(
          create: (context) => CalendarModel(DateTime.now()),
        ),
        ChangeNotifierProvider<NavigationModel>(
          create: (context) => NavigationModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Zoo App",
        home: const NavigationScreen(),
        theme: ThemeData(
          fontFamily: "Inter",
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
