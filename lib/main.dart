import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: TextButton(
              onPressed: () async {
                try {
                  GoogleSignIn googleSignin = GoogleSignIn(
                    scopes: [
                      'https://www.googleapis.com/auth/calendar',
                    ],
                  );

                  final account = await googleSignin.signIn();
                  print('Account');
                  print(account);

                  final auth = await account!.authentication;
                  print('Auth');
                  log(auth.idToken ?? 'empty');
                } catch (error) {
                  print(error);
                }
              },
              child: const Text("Test Login"))),
    );
  }
}
