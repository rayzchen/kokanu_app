import "package:flutter/material.dart";
import "main_scaffold.dart";
import "constants/colors.dart";

class KokanuApp extends StatelessWidget {
  const KokanuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kokanu",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          secondary: accentColor,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //   backgroundColor: primaryColor,
        //   selectedItemColor: accentColor,
        //   unselectedItemColor: Colors.grey.shade400,
        // ),
      ),
      home: MainScaffold(),
    );
  }
}
