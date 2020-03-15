import 'dart:convert';
import 'package:parsing_data/model/blog.dart';
import 'package:parsing_data/services/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
    _getBlogs();
  }
  var blogs = new List<Blog>();

  _getBlogs() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        blogs = list.map((model) => Blog.fromJson(model)).toList();
      });
    });
  }
  void showTapMessage(BuildContext context, String title){
    var alertDialog = AlertDialog(
      title: Text(title),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Ok'),
        )
      ],
    );
    showDialog(context: context, builder: (context){
      return alertDialog;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Json Parsing'),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(4.5),
          itemCount: blogs.length,
          itemBuilder: (BuildContext context, int index){
            return Column(
              children: <Widget>[
                Divider(height: 3.4,),
                ListTile(
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.lightBlueAccent,
                    child: Text(blogs[index].title[0]),
                  ),
                  title: Text("Title: ${blogs[index].title}", style: TextStyle(fontWeight: FontWeight.w700),),
                  subtitle: Text(blogs[index].body),
                  onTap: () => showTapMessage(context, blogs[index].title),
                )
              ],
            );
          },

      )
    );
  }
}
