import 'package:flutter/material.dart';
import 'package:online_chat_app/screens/auth_screen.dart';
import 'package:online_chat_app/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Online Chat',
      theme: ThemeData(
        backgroundColor: Colors.pink,
       primarySwatch: Colors.pink,
        accentColor: Colors.deepPurple,
        buttonTheme: ButtonThemeData(
        buttonColor: Colors.pink,
        textTheme: ButtonTextTheme.primary,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
        ),),
      ),
      home: AuthScreen(),
    );
  }
}
