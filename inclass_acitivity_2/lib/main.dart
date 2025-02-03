import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

// Define Light and Dark themes
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blueGrey,
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 18, color: Colors.black),
  ),
  scaffoldBackgroundColor: Colors.grey[200],
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.blueGrey,
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 18, color: Colors.white),
  ),
  scaffoldBackgroundColor: Colors.black,
);

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  // Change theme method
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,   // Apply light theme
      darkTheme: darkTheme, // Apply dark theme
      themeMode: _themeMode, // Toggle between light and dark
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme Demo'),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            color: Theme.of(context).scaffoldBackgroundColor, // Background color based on theme
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mobile App Development Testing',
                  style: Theme.of(context).textTheme.displayLarge, // Text style from theme
                ),
                Switch(
                  value: _themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    setState(() {
                      _themeMode = value ? ThemeMode.dark : ThemeMode.light;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
