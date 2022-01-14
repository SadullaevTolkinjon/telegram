import 'package:flutter/material.dart';
import 'package:homeworkonolti/model/telegram_archiver.dart';
import 'package:homeworkonolti/pages/profile_page.dart';

class ChattingProfile extends StatefulWidget {
  String? data;
  var subtitle;
  bool? color;
  ChattingProfile({Key? key, this.data, this.subtitle, this.color})
      : super(key: key);

  @override
  _ChattingProfileState createState() => _ChattingProfileState();
}

class _ChattingProfileState extends State<ChattingProfile> {
  final _nameController = TextEditingController();
  List malumot = [];
  List<TelegramArchiver> time = [];

  @override
  Widget build(BuildContext context) {
    final _timer = DateTime.now().hour;
    final _minute = DateTime.now().minute;
    return Scaffold(
      backgroundColor: widget.color! ? Colors.white : Color(0XFF303240),
      appBar: AppBar(
        backgroundColor: widget.color! ? Colors.blue : Color(0XFF303240),
        title: ListTile(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProfilePage(data: widget.data,subtitle: widget.subtitle,rang: widget.color,)));
          },
          title: Text(
            widget.data.toString(),
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            "last seen at ${widget.subtitle.toString()}",
            style: TextStyle(color: Colors.white),
          ),
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage("https://source.unsplash.com/random/1"),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.call_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.805,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: index.isEven
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Container(
                          key: PageStorageKey(index),
                          width: 150,
                          height: 40.0,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${malumot[index]}"),
                                  Text(
                                      "${time[index].text}:${time[index].subtitle}",style: TextStyle(fontSize: 8),)
                                ],
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              color: Colors.cyan),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(top: 5.0),
                    height: MediaQuery.of(context).size.height * 0.05,
                  );
                },
                itemCount: malumot.length,
                reverse: true,
              ),
            ),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.emoji_emotions),
                suffixIcon: InkWell(
                  child: Icon(Icons.send),
                  onTap: () {
                    setState(() {
                      malumot.add(_nameController.text);
                      time.add(TelegramArchiver(
                          text: _timer.toString(),
                          subtitle: _minute.toString()));
                      _nameController.clear();
                    });
                  },
                ),
                hintText: "Message",
                border: OutlineInputBorder(
                  borderSide: BorderSide(style: BorderStyle.none),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
