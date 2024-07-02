import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String quoteText;
  final String authorName;

  const SecondScreen({
    Key? key,
    required this.quoteText,
    required this.authorName,
  }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(backgroundColor: Colors.blueAccent,shadowColor: Colors.black38,),
        body: Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child:
                Text(widget.quoteText,style: TextStyle(fontSize: 20),),
            ),
            Padding(
              padding: const EdgeInsets.only(right:15.0),
              child: Align( alignment: Alignment.bottomRight,
                  child: Text("-${widget.authorName}",style: TextStyle(decorationThickness: 10.4,fontSize: (15.0)),)),
            )
          ]
        ),
      ),
    );
  }
}
