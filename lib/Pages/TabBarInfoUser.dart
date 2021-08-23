import 'package:flutter/material.dart';
import 'package:flutter_http_web/Models/Post.dart';

class TabBarInfoUser extends StatefulWidget {
  const TabBarInfoUser({Key? key, this.index, this.posts}) : super(key: key);
  final int? index;
  final List<Post>? posts;
  @override
  _TabBarInfoUserState createState() => _TabBarInfoUserState();
}

class _TabBarInfoUserState extends State<TabBarInfoUser> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade500,
          bottom: TabBar(
            indicatorColor: Colors.lime,
            //indicatorWeight: 4.0,
            labelColor: Colors.white,
            //labelPadding: EdgeInsets.only(top: 10.0),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Posts',
                icon: Icon(
                  Icons.podcasts,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              //child: Image.asset('images/android.png'),

              Tab(
                text: 'Comentários',
                icon: Icon(
                  Icons.comment,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              Tab(
                text: 'Albums',
                icon: Icon(
                  Icons.album,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              Tab(
                text: 'Fotos',
                icon: Icon(
                  Icons.photo,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
              Tab(
                text: 'Tarefas',
                icon: Icon(
                  Icons.task,
                  color: Colors.white,
                ),
                iconMargin: EdgeInsets.only(bottom: 10.0),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: ListView.builder(
                itemCount: widget.posts!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: FlutterLogo(size: 56.0),
                      title: Text(widget.posts![index].title.toString()),
                      subtitle: Text(widget.posts![index].body.toString()),
                      trailing: Icon(Icons.more_vert),
                      onTap: () {
                        /*Navigator.pushNamed(context, '/TabBarInfoUser',
                            arguments: {0});*/
                      },
                    ),
                  );
                },
              ),
            ),
            Center(
                child: Text(
              'Comentários',
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'Albums',
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'Fotos',
              style: TextStyle(fontSize: 32),
            )),
            Center(
                child: Text(
              'Tarefas',
              style: TextStyle(fontSize: 32),
            )),
          ],
        ),
      ),
    );
  }
}
