import 'package:flutter/material.dart';
import 'package:homeworkonolti/model/telegram_archiver.dart';
import 'package:homeworkonolti/pages/telegram_archive.dart';

class ProfilePage extends StatefulWidget {
  String? data;
  String? subtitle;
  bool? rang;
  ProfilePage({Key? key, this.data, this.subtitle,this.rang}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded))
            ],
    
            expandedHeight: MediaQuery.of(context).size.height * 0.3,
            title: ListTile(

              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://source.unsplash.com/random"),
              ),
              title: Text(widget.data.toString()),
              subtitle: Text("last seen at ${widget.subtitle.toString()}"),
            ),
          )
        ],
      ),
    );
  }
}
