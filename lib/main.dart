import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moco_event_app/behaviours/scroll.behaviour.dart';
import 'package:moco_event_app/views/home.view.dart';

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/font/OFL.txt');
    yield LicenseEntryWithLineBreaks(['font'], license);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eventplanung',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(
          secondary: Color.fromRGBO(255, 191, 80, 1),
          tertiary: Colors.indigoAccent,
          primary: Color.fromRGBO(180, 139, 72, 1.0)
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        textTheme: GoogleFonts.readexProTextTheme(const TextTheme(
          titleLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500
          )
        ).apply(
          bodyColor: Colors.white70
        )),

      ),
      home: const MOCOHome(),
      scrollBehavior: MOCOScrollBehaviour(),
    );
  }
}


