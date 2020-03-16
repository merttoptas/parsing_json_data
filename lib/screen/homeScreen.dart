import 'dart:convert';
import 'package:parsing_data/model/blog.dart';
import 'package:parsing_data/services/api.dart';
import 'package:flutter/material.dart';
import 'package:parsing_data/screen/detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
    _getBlog();
  }
  var blogs = new List<Blog>();

  _getBlog() {
    API.getPosts().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        blogs = list.map((model) => Blog.fromJson(model)).toList();
      });
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
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => DetailScreen(blogs[index].title, blogs[index].body))),
                )
              ],
            );
          },

      )
    );
  }
}
