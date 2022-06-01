import "dart:io";

import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_app/content/demo.dart";
import "package:flutter_app/transformers/conservation_status.dart";
import "package:flutter_app/transformers/pre/hook_transformer.dart";
import "package:flutter_hooks/flutter_hooks.dart";
import "package:google_fonts/google_fonts.dart";
import "package:intl/date_symbol_data_local.dart";
import "package:provider/provider.dart";
import "package:zooinator_content_rendering/transformers/transformer.dart";

import "common/ioc.dart";
import "features/animals/models/animals_model.dart";
import "features/calendar/models/calendar_model.dart";
import "features/home/models/home_model.dart";
import "features/park_events/models/event_model.dart";
import "features/park_map/models/park_map_model.dart";
import "features/speaks/models/notification_service.dart";
import "features/speaks/models/speak_model.dart";
import "firebase_options.dart";
import "navigation/navigation_model.dart";
import "transformers/navbar.dart";
import "transformers/screen_app_bar.dart";

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

  Transformer.preTransformers.add(HookPreTransformer());
  Transformer.transformers.add(ScreenAppBarTransformer());
  Transformer.transformers.add(NavbarTransformer());
  Transformer.transformers.add(ConservationStatusTransformer());

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
  const MyApp({super.key});

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
        ChangeNotifierProvider<ParkMapModel>(
          create: (context) => ParkMapModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ContentDemo(),
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0xffECFCE5),
          primarySwatch: Colors.green,
          textTheme: TextTheme(
            displayLarge: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
            displayMedium: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
            displaySmall: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            headlineLarge: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            headlineMedium: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 18,
            ),
            headlineSmall: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 16,
            ),
            bodyLarge: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
            ),
            bodyMedium: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black,
            ),
            bodySmall: GoogleFonts.poppins(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
