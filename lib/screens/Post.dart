import 'package:flutter/material.dart';
import 'package:listviewapi/httpServices.dart';
import 'package:listviewapi/post.dart';

class listView extends StatefulWidget {
  const listView({Key? key}) : super(key: key);

  @override
  State<listView> createState() => _listViewState();
}

class _listViewState extends State<listView> {
  HttpServices httpServices = HttpServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Converted to Maps'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.orange[300],
      ),
      body: FutureBuilder<List<Post>>(
        future: httpServices.fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              separatorBuilder: (BuildContext context, index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, index) {
                var data = snapshot.data![index];
                return ListTile(
                  title: Text(data.body.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
