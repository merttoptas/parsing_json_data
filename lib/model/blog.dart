import 'package:flutter/material.dart';

class Blog{
  int id;
  String title;
  String body;

  Blog({this.id, this.title,this.body});

  Blog.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        body = json['body'];

  Map toJson() {
    return {'id': id, 'title': title, 'body': body};
  }
}