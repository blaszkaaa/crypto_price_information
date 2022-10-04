// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
class searchUser extends StatelessWidget {
  const searchUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
              ),
              hintText: "Serch crypto",
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade600,
                )
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade600,
                )
              ),
            ),
          ),
        ),
      ],
    );
  }
}