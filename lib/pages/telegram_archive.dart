import 'package:flutter/material.dart';
import 'package:homeworkonolti/main.dart';
import 'package:homeworkonolti/model/telegram_archiver.dart';
import 'package:homeworkonolti/pages/chatting_profile.dart';
import 'archive_file.dart';

class TelegramArchive extends StatefulWidget {
  const TelegramArchive({Key? key}) : super(key: key);

  @override
  _TelegramArchiveState createState() => _TelegramArchiveState();
}

bool color = true;


class _TelegramArchiveState extends State<TelegramArchive> {
  final List<TelegramArchiver> lst1 = [
    TelegramArchiver(text: "Bootcamp", subtitle: "15:00"),
    TelegramArchiver(text: "Homework", subtitle: "15:14"),
    TelegramArchiver(text: "Azam aka", subtitle: "15:23"),
    TelegramArchiver(text: "Oybek", subtitle: "15:37"),
    TelegramArchiver(text: "Hasan", subtitle: "15:46"),
    TelegramArchiver(text: "Ergash", subtitle: "16:05"),
    TelegramArchiver(text: "Hakkerla", subtitle: "16:17"),
    TelegramArchiver(text: "Donyor aka", subtitle: "16:23"),
    TelegramArchiver(text: "Ziyodbek", subtitle: "16:30"),
    TelegramArchiver(text: "Asadbek", subtitle: "16:33"),
    TelegramArchiver(text: "Laziz", subtitle: "16:43"),
  ];
  List<TelegramArchiver> _archivedFiles = [];
  bool _colorChanger = true;
  var keytelegramArchive = const PageStorageKey("key_TelegramArchive");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colorChanger ? Colors.white : Color(0XFF303240),
      drawer: menuDrawer(),
      appBar: AppBar(
        backgroundColor: _colorChanger ? Colors.blue : Color(0XFF303240),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.archive)),
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.lock_open),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Icon(Icons.search),
              ),
            ],
          ),
        ],
        title: const Text("Telegram"),
      ),
      body: _archivedFiles.isEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.red,
                          child: Icon(
                            Icons.delete,
                            size: 30.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            Icons.archive,
                            size: 30.0,
                            color: Colors.orange,
                          ),
                        )
                      ],
                    ),
                  ),
                  key: UniqueKey(),
                  onDismissed: (val) {
                    if (DismissDirection.endToStart == val) {
                      setState(
                        () {
                          _archivedFiles.add(TelegramArchiver(
                              text: lst1[index].text,
                              subtitle: lst1[index].subtitle));
                          lst1.removeAt(index);
                        },
                      );
                    } else if (DismissDirection.startToEnd == val) {
                      setState(
                        () {
                          lst1.removeAt(index);
                        },
                      );
                    }
                  },
                  child: Card(
                    color: _colorChanger ? Colors.white : Color(0XFF303240),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChattingProfile(
                                      key: keytelegramArchive,
                                      data: lst1[index].text,
                                      subtitle: lst1[index].subtitle,
                                      color: _colorChanger,
                                    )));
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://source.unsplash.com/random/$index"),
                        radius: MediaQuery.of(context).size.height * 0.04,
                      ),
                      title: Text(
                        lst1[index].text.toString(),
                        style: TextStyle(
                            color: _colorChanger ? Colors.black : Colors.white),
                      ),
                      subtitle: Text(lst1[index].subtitle.toString(),
                          style: TextStyle(
                              color:
                                  _colorChanger ? Colors.black : Colors.white)),
                      trailing: Icon(
                        Icons.done_all,
                        color: _colorChanger ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                );
              },
              itemCount: lst1.length,
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Card(
                    color: _colorChanger ? Colors.white : Color(0XFF303240),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ArchivedFiles(
                            data: _archivedFiles,
                            color: _colorChanger,
                          );
                        }));
                      },
                      title: Text("Archived files",
                          style: TextStyle(
                              color:
                                  _colorChanger ? Colors.black : Colors.white)),
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.archive,
                          color: Colors.white,
                          size: MediaQuery.of(context).size.height * 0.04,
                        ),
                        radius: MediaQuery.of(context).size.height * 0.04,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.81,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Dismissible(
                          background: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  color: Colors.red,
                                  child: Icon(
                                    Icons.delete,
                                    size: 30.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  child: Icon(
                                    Icons.archive,
                                    size: 30.0,
                                    color: Colors.orange,
                                  ),
                                )
                              ],
                            ),
                          ),
                          key: UniqueKey(),
                          onDismissed: (val) {
                            if (DismissDirection.endToStart == val) {
                              setState(() {
                                _archivedFiles.add(TelegramArchiver(
                                    text: lst1[index].text,
                                    subtitle: lst1[index].subtitle));
                                lst1.removeAt(index);
                              });
                            } else if (DismissDirection.startToEnd == val) {
                              setState(() {
                                lst1.removeAt(index);
                              });
                            }
                          },
                          child: Card(
                            color: _colorChanger
                                ? Colors.white
                                : Color(0XFF303240),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ChattingProfile(
                                      data: lst1[index].text,
                                      subtitle: lst1[index].subtitle,
                                      color: _colorChanger,
                                    ),
                                  ),
                                );
                              },
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://source.unsplash.com/random/$index"),
                                radius:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              title: Text(
                                lst1[index].text.toString(),
                                style: TextStyle(
                                    color: _colorChanger
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              subtitle: Text(
                                lst1[index].subtitle.toString(),
                                style: TextStyle(
                                    color: _colorChanger
                                        ? Colors.black
                                        : Colors.white),
                              ),
                              trailing: Icon(
                                Icons.done_all,
                                color:
                                    _colorChanger ? Colors.black : Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: lst1.length,
                    ),
                  )
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _colorChanger ? Colors.blue : Color(0XFF303240),
        child: Icon(Icons.edit),
        onPressed: () {
          Navigator.pushNamed(context, "/add_contacts");
        },
      ),

    );
  }

  Drawer menuDrawer() {
    return Drawer(
      backgroundColor: _colorChanger ? Colors.white : Color(0XFF303240),
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: _colorChanger ? Colors.blue : Color(0XFF303240)),
              accountName: const Text("Sadullaev To'lqinjon"),
              accountEmail: const Text("Sadullaev@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage:
                    NetworkImage("https://source.unsplash.com/random/1"),
              ),
              otherAccountsPictures: [
                InkWell(
                  child: CircleAvatar(
                    backgroundColor:
                        _colorChanger ? Colors.blue.shade400 : Colors.white,
                    child: Icon(
                      Icons.light_mode,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      _colorChanger = !_colorChanger;
                    });
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: const ListTile(
                title: Text("Sadullaev__"),
                subtitle: Text("+998 900119597"),
              ),
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://source.unsplash.com/random/1"),
                  ),
                  title: Text(
                    "Sadullaev__",
                    style: TextStyle(
                        color: _colorChanger ? Colors.black : Colors.white),
                  ),
                ),
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://source.unsplash.com/random/2"),
                  ),
                  title: Text("Tolkinjon",
                      style: TextStyle(
                          color: _colorChanger ? Colors.black : Colors.white)),
                ),
                ListTile(
                  leading: Icon(
                    Icons.add,
                    color: _colorChanger ? Color(0XFF5F6368) : Colors.white,
                  ),
                  title: Text(
                    "New Account",
                    style: TextStyle(
                        color: _colorChanger ? Colors.black : Colors.white),
                  ),
                ),
              ],
            ),
            ListTile(
              leading: Icon(
                Icons.group,
                color: _colorChanger ? Color(0XFF5F6368) : Colors.white,
              ),
              title: Text(
                "New Group",
                style: TextStyle(
                    color: _colorChanger ? Colors.black : Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: _colorChanger ? Color(0XFF5F6368) : Colors.white,
              ),
              title: Text(
                "Contacts",
                style: TextStyle(
                    color: _colorChanger ? Colors.black : Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.call,
                color: _colorChanger ? Color(0XFF5F6368) : Colors.white,
              ),
              title: Text(
                "Calls",
                style: TextStyle(
                    color: _colorChanger ? Colors.black : Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.location_on,
                color: _colorChanger ? Color(0XFF5F6368) : Colors.white,
              ),
              title: Text(
                "People Nearby",
                style: TextStyle(
                    color: _colorChanger ? Colors.black : Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.bookmark,
                color: _colorChanger ? Color(0XFF5F6368) : Colors.white,
              ),
              title: Text(
                "Saved Messages",
                style: TextStyle(
                    color: _colorChanger ? Colors.black : Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: _colorChanger ? Color(0XFF5F6368) : Colors.white,
              ),
              title: Text(
                "Settings",
                style: TextStyle(
                    color: _colorChanger ? Colors.black : Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person_add_outlined,
                color: _colorChanger ? Color(0XFF5F6368) : Colors.white,
              ),
              title: Text(
                "Invite Friends",
                style: TextStyle(
                    color: _colorChanger ? Colors.black : Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.circle_notifications_sharp,
                color: _colorChanger ? Color(0XFF5F6368) : Colors.white,
              ),
              title: Text(
                "Telegram Features",
                style: TextStyle(
                    color: _colorChanger ? Colors.black : Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
