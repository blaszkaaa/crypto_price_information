// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class postCrypto extends StatefulWidget {
  const postCrypto({Key? key}) : super(key: key);

  @override
  State<postCrypto> createState() => _postCryptoState();
}

class _postCryptoState extends State<postCrypto> {
  
  final url = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd";
  var _postsJson = [];

  void fetchPosts()async{
    try{
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

      setState(() {
        _postsJson = jsonData;
      });
    } catch (err){}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: _postsJson.length,
          itemBuilder: (context, i) {
            final post = _postsJson[i];
            return Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 25, right: 10),
              child: Container(
                padding: EdgeInsets.all(12),
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black54,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  //zdjęcie
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network("${post["image"]}", width: 50,)
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                        "${post["name"]}",
                        style: TextStyle(fontSize: 20),  
                          ),
                        SizedBox(height: 4,),
                    ],
                  ),
                ),],
              ),
            ),
          );}
        ),
      ),
    );
  }
}