import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class postCrypto extends StatefulWidget {
  const postCrypto({Key? key}) : super(key: key);

  @override
  State<postCrypto> createState() => _postCryptoState();
}

class _postCryptoState extends State<postCrypto> {
  
  final url = "https://api.cryptonator.com/api/ticker/btc-usd";
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
            return Text("Title: ${post["title"]}\n Body: ${post["body"]}\n\n");
          }
        ),
      ),
    );
  }
}