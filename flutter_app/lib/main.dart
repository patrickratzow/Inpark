import "dart:io";
import "package:flutter/material.dart";
import "package:flutter_app/features/animals/models/animals_model.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter_app/features/speaks/models/notification_service.dart";
import "package:flutter_app/features/speaks/models/speak_model.dart";
import "package:flutter_app/navigation/navigation_screen.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const NavigationScreen(),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0xffECFCE5),
          fontFamily: GoogleFonts.poppins().fontFamily,
          primarySwatch: Colors.green,
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            headline2: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            headline4: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            headline5: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            headline6: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            bodyText1: TextStyle(
              fontSize: 14,
            ),
            bodyText2: TextStyle(
              fontSize: 12,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
