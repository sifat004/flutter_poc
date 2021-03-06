import 'package:flutter/material.dart';
import 'screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogIn(),
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: Colors.cyan,
        accentColor: Colors.lightBlueAccent,
        // Define the default font family.
        fontFamily: 'Georgia',
        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold,color: Colors.black45),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic,color: Colors.black45),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Georgia',color: Colors.black45),
        ),
      ),
    );
  }
}