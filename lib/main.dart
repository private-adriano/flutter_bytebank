import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
  // save(Transaction(200, Contact(0, 'Adriano', 1520)))
  //     .then((transaction) => print(transaction));
  // findAll().then((transactions) => print('new transactions $transactions'));
}

class BytebankApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.blueAccent[700]),
      ),
      home: Dashboard(),
    );
  }
}
