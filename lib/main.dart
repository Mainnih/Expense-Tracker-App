import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'widgets/expenses.dart';


void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //  // DeviceOrientation.portraitUp
  // ]
  // ).then((value) => 
  runApp(const MainApp())
  //)
  ;
  
}

var kColorShchema = ColorScheme.fromSeed(
   //brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorShchema = ColorScheme.fromSeed(
   brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
class MainApp extends StatelessWidget {
  const MainApp({super.key});
/*
  final List<Expense> _registerExpenses = [
    Expense(title: 'Flutter', amount: 99.99, date: DateTime.now(), category: Category.work)
  ,  Expense(title: 'Cake', amount: 3.33, date: DateTime.now(), category: Category.food)];
*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      darkTheme: ThemeData.dark().copyWith(
       
        colorScheme: kDarkColorShchema,
       
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorShchema.secondaryContainer,
          margin: const EdgeInsets.all(5),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: kDarkColorShchema.primaryContainer,
            foregroundColor: kDefaultIconDarkColor,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorShchema,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorShchema.onPrimaryContainer,
          foregroundColor: kColorShchema.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorShchema.primaryContainer,
          margin: const EdgeInsets.all(5),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: kColorShchema.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: kColorShchema.onSecondary,
                  fontSize: 15),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    );
  }
}
