import 'package:flutter/material.dart';
import 'package:homeworkonolti/model/note_model.dart';
import 'package:homeworkonolti/model/telegram_archiver.dart';

class ArchivedFiles extends StatefulWidget {
  List<TelegramArchiver>? data;
  bool? color;
  ArchivedFiles({Key? key, this.data,this.color}) : super(key: key);

  @override
  _ArchivedFilesState createState() => _ArchivedFilesState();
}

class _ArchivedFilesState extends State<ArchivedFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: widget.color! ? Colors.white: Color(0XFF303240),
      appBar: AppBar(
        backgroundColor: widget.color! ? Colors.blue: Color(0XFF303240),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.archive)),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.lock_open),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.search),
              ),
            ],
          ),
        ],
        title: Text("Archived Files",),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: Colors.grey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text("UnArchive")],
              ),
            ),
            key: UniqueKey(),
            onDismissed: (val) {},
            child: Card(
              color: widget.color! ? Colors.white:Color(0XFF303240),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://source.unsplash.com/random/$index"),
                  radius: MediaQuery.of(context).size.height * 0.04,
                ),
                title: Text(widget.data![index].text.toString(),style: TextStyle(
                                    color: widget.color!
                                        ? Colors.black
                                        : Colors.white),),
                subtitle: Text(widget.data![index].subtitle.toString(),style: TextStyle(
                                    color: widget.color!
                                        ? Colors.black
                                        : Colors.white),),
                trailing: Icon(Icons.done_all,color:
                                    widget.color! ? Colors.black : Colors.white,),
              ),
            ),
          );
        },
        itemCount: widget.data!.length,
      ),
    );
  }
}
