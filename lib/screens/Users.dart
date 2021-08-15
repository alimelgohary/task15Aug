import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urltry/models/users.dart';
import 'package:urltry/services/users.dart';
import 'package:urltry/main.dart';
import 'package:url_launcher/url_launcher.dart';

class PostsScreen extends StatefulWidget {
  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  int i = 0;
  bool loading = true;
  List<User> list = [];

  getPosts() async {
    list = await UsersService().getPosts();
    loading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  void launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : {print('error launching url')};
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Feed',
      home: Scaffold(
        appBar: AppBar(
          title: Text('News Feed'),
          leading: MaterialButton(
            onPressed: () {},
            child: Icon(Icons.account_circle),
          ),
          actions: [
            MaterialButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
                child: Icon(Icons.logout))
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: i == 0
                      ? null
                      : () {
                          i--;
                          setState(() {});
                        },
                  child: Text('Previous User')),
              Padding(padding: EdgeInsets.all(20)),
              TextButton(
                  onPressed: i == list.length - 1
                      ? null
                      : () {
                          i++;
                          setState(() {});
                        },
                  child: Text('Next User')),
            ],
          ),
        ),
        body: Center(
          child: loading
              ? CircularProgressIndicator(
                  strokeWidth: 5,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${list[i].name}",
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                    InkWell(
                      child: Text(
                        "${list[i].email}",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        launchURL("mailto:${list[i].email}");
                      },
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                    InkWell(
                      child: Text(
                        "${list[i].phone}",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        launchURL("tel:${list[i].phone}");
                      },
                    ),
                    Padding(padding: EdgeInsets.all(20)),
                    InkWell(
                      child: Text(
                        "${list[i].website}",
                        style: TextStyle(fontSize: 20),
                      ),
                      onTap: () {
                        launchURL("https:${list[i].website}");
                      },
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
