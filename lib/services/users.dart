import 'package:urltry/models/users.dart';
import 'package:dio/dio.dart';

class UsersService{

  String base = "https://jsonplaceholder.typicode.com/";
  String req = "users";
  Future<List<User>> getPosts() async {
    List<User> posts = [];
    Response res = await Dio().get(base+req);
    res.data.forEach((val){
      var post = User.fromJson(val);
      posts.add(post);
    });

    return posts;
  }
}