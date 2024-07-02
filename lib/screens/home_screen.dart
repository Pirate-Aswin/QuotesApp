import 'package:flutter/material.dart';
import 'package:quotesapp/screens/second_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = "Quotes";
  String quote = "";
  String author = "";

  @override
  Widget build(BuildContext context) {
    print("Hello");
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              quote,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "-$author",
                  style: TextStyle(decorationThickness: 10.4, fontSize: (15.0)),
                )),
          ),
          ElevatedButton(
            onPressed: () async {
              var url = Uri.parse('https://type.fit/api/quotes');
              var response = await http.get(url);
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');
              var data = jsonDecode(response.body);
              quote = data[0]["text"];
              author = data[0]["author"];
              setState(() {});
            },
            child: Text("Get Quote"),
          ),
        ],
      ),
    ));
  }
}
