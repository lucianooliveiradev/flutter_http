import 'dart:convert' as convert;
import 'package:flutter_http_web/Models/User.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_http_web/Models/Post.dart';

class Networkutil {
  static Future<List<User>> getAllUsers() async {
    try {
      var data = [];
      List<User> users = [];

      var uri = Uri.http('jsonplaceholder.typicode.com', '/users');
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        data = convert.jsonDecode(response.body);
      }

      if (data.isNotEmpty) {
        users = data.map((e) => User.fromJson(e)).toList();
      }

      return users;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<Post>> getAllPost() async {
    try {
      var data = [];
      List<Post> posts = [];

      var uri = Uri.http('jsonplaceholder.typicode.com', '/posts');
      var response = await http.get(uri);
      if (response.statusCode == 200) {
        data = convert.jsonDecode(response.body);
      }

      if (data.isNotEmpty) {
        posts = data.map((e) => Post.fromJson(e)).toList();
      }

      return posts;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
