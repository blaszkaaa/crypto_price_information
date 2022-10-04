// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class searchUser extends StatelessWidget {
  const searchUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 12, 14),
      body: Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const SizedBox(height: 50,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            cursorColor: Colors.grey[500],
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey[500],
              ),
              hintText: "Serch crypto",
              hintStyle: TextStyle(color: Colors.grey[500]),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(80),
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 20, 22, 26),
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color.fromARGB(255, 20, 22, 26),
                )
              ),
            ),
          ),
        ),],
      )
    );
  }
}