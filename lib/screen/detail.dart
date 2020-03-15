import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  String title;
  String body;
  DetailScreen(this.title,this.body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(title,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),),
              ],
            ),
          ),
          Divider(height: 3.6,),
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(body,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
            ),
          )
        ],
      ),

    );
  }
}
