//declare packages
// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, empty_catches, prefer_typing_uninitialized_variables

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Jobs extends StatefulWidget {
  Jobs() : super();
  @override
  JobsState createState() => JobsState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class JobsState extends State<Jobs> {
  final _debouncer = Debouncer();

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

  List<Subject> ulist = [];
  List<Subject> userLists = [];

  String url = 'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd';

  Future<List<Subject>> getAllulistList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Subject> list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<Subject> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Subject>((json) => Subject.fromJson(json)).toList();
  }
  
  @override
  void initState() {
    super.initState();
    getAllulistList().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
      });
    });
     super.initState();
    fetchPosts();
  }

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
      backgroundColor: Color.fromARGB(255, 11, 12, 14),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              style: TextStyle(color: Colors.grey),
              textInputAction: TextInputAction.search,
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                hoverColor: Colors.grey,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: InkWell(
                  child: Icon(
                    Icons.search, 
                    color: Colors.grey,
                  ),
                ),
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search ',
                hintStyle: TextStyle(color: Colors.grey)
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    userLists = ulist
                        .where(
                          (u) => (u.text.toLowerCase().contains(
                                string.toLowerCase(),
                              )),
                        )
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.all(5),
              itemCount: userLists.length,
              itemBuilder: (BuildContext context, int i) {
                final post = _postsJson[i];
                return Card(
                  color: Color.fromARGB(255, 20, 22, 26),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: Color.fromARGB(255, 11, 12, 14),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(userLists[i].author, width: 50,)
                          ),
                        ),
                        Text(
                            userLists[i].text,
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("${post["current_price"]} \$ ", 
                            style: TextStyle(
                            color: Colors.grey[500]
                          ),
                        ),
                      ),],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Subject {
  String text;
  var author;
   Subject({
    required this.text,
    required this.author,
  });

  factory Subject.fromJson(Map<dynamic, dynamic> json) {
    return Subject(
      text: json['name'],
      author: json['image'],
    );
  }
}