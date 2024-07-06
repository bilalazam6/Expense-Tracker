
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

var kColorScheem = ColorScheme.fromSeed(
  seedColor:const  Color.fromARGB(255, 96, 59, 181),
  );

  var kDarkColorsScheem = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor:const Color.fromARGB(255, 5, 99, 125),
    ); 

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((fn) {
    runApp( MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
    useMaterial3: true,
    colorScheme: kDarkColorsScheem,
    cardTheme:const  CardTheme().copyWith(
      color: kDarkColorsScheem.secondaryContainer,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kDarkColorsScheem.primaryContainer,
        foregroundColor: kDarkColorsScheem.onPrimaryContainer,
      ),
    ),
    ), 
    debugShowCheckedModeBanner: false,
    theme: ThemeData().copyWith(useMaterial3: true,
    colorScheme: kColorScheem,
    
    appBarTheme:const AppBarTheme().copyWith(
      backgroundColor: kColorScheem.onPrimaryContainer,
      foregroundColor: kColorScheem.primaryContainer,
        
    ),
    cardTheme:const  CardTheme().copyWith(
      color: kColorScheem.secondaryContainer,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
        ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: kColorScheem.primaryContainer,
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
      titleLarge: TextStyle(
      fontWeight:FontWeight.bold,
      color: kColorScheem.onSecondaryContainer,
      fontSize: 16,
      ),
    ),
  ),
    //themeMode: ThemeMode.system, //defult mode
    home: const Expenses(),
  ),
  );
  // });
   
}

 


