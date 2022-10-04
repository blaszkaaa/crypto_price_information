// ignore_for_file: prefer_const_constructors, camel_case_types, unused_import
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class homeUser extends StatelessWidget {
  const homeUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Crypto Price"),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset("lib/img/zdj1.png"),
        ),
        backgroundColor: Color.fromARGB(255, 20, 22, 26),
      ),
      body: Column(

      ),
    );
  }
}