import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Book Store",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff34495E)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: const Color(0xff2C3E50),
        hintColor: const Color.fromARGB(255, 112, 220, 4),
        secondaryHeaderColor: const Color(0xffC6EDBE),
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
