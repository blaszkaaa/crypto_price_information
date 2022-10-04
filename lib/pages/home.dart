// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:flutter/material.dart';
class homeUser extends StatelessWidget {
  const homeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Crypto Price"),
        ),
        backgroundColor: Color.fromARGB(255, 20, 22, 26),
      ),
      body: Column(

      ),
    );
  }
}