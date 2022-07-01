import 'post.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:listviewapi/post.dart';

class HttpServices {
  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body) as List;
      return list.map<Post>((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
