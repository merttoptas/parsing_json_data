import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:parsing_data/model/blog.dart';

const baseUrl = "https://jsonplaceholder.typicode.com";

class API {
  static Future getPosts() {
    var url = baseUrl + "/posts";
    return http.get(url);
  }
  var blogs = new List<Blog>();


}