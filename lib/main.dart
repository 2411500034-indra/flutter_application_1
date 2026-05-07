import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dashboard_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false, //tulisan mode debug sebelah kanan atas 
      title: 'Daily Activity App',
      
      theme: ThemeData(
        //(Primary Color)
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.grey[100],
        
        // 2. Style text (TextTheme)
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 26, 
            fontWeight: FontWeight.bold, 
            color: const Color.fromARGB(255, 45, 154, 255),
          ),

          titleLarge: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.w600, 
            color: const Color.fromARGB(255, 45, 154, 255),
          ),

          bodyLarge: TextStyle(
            fontSize: 16, 
            color: const Color.fromARGB(255, 45, 154, 255),
          ),
        ),

        appBarTheme: AppBarTheme(
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 45, 154, 255),
          foregroundColor: Colors.white,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 45, 154, 255),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}