import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wastemanagement/Screens/validation/login.dart';
import 'package:wastemanagement/Screens/Homes/Home.dart';
import 'package:wastemanagement/Screens/user.dart';
import 'package:wastemanagement/Splash/SplashScreen.dart';
import 'package:wastemanagement/Screens/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'Screens/Account Setting/language_provider.dart';
import 'package:wastemanagement/Screens/Account Setting/language_provider.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: Consumer<LanguageProvider>(
        builder: (context, lang, _) {
          return MaterialApp(
            locale: lang.locale,
            supportedLocales: const [
              Locale('en'),
              Locale('hi'),
            ],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            title: 'Waste Management',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF00A884)),
                useMaterial3: false,
                fontFamily: "Regular"
            ),

            home: ProfileScreen(),
          );
        },
      ),
    );

  }
}

