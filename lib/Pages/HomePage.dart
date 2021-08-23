import 'package:flutter/material.dart';
import 'package:flutter_http_web/Models/Post.dart';
import 'package:flutter_http_web/Models/User.dart';
import 'package:flutter_http_web/Pages/TabBarInfoUser.dart';
import 'package:flutter_http_web/Util/NetworkUtil.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  List<Post> posts = [];

  @override
  void initState() {
    getUsers();
    getPosts();
    super.initState();
  }

  Future<void> getUsers() async {
    var result = await Networkutil.getAllUsers();
    setState(() {
      users = result;
    });
  }

  Future<void> getPosts() async {
    var result = await Networkutil.getAllPost();
    setState(() {
      posts = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Http Web',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              enabled: true,
              leading: Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).pushNamed("/Home");
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(users[index].name.toString()),
              subtitle: Text(users[index].email.toString()),
              trailing: Icon(Icons.more_vert),
              onTap: () {
                // Navigator.pushNamed(context, '/TabBarInfoUser',
                //     arguments: {0, posts});
                List<Post> postParam = posts
                    .where((element) => element.userId == users[index].id)
                    .toList();

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TabBarInfoUser(
                      index: 0,
                      posts: postParam,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
