import 'package:flutter/material.dart';
import 'package:homeworkonolti/model/telegram_archiver.dart';

class AddContacts extends StatefulWidget {

  AddContacts({Key? key}) : super(key: key);

  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  List<TelegramArchiver> lst2 = [
    TelegramArchiver(text: "Bootcamp_flutter", subtitle: "15:00"),
    TelegramArchiver(text: "Homework_flutter", subtitle: "+998 90 123 45 67"),
    TelegramArchiver(text: "Azam aka", subtitle: "+998 99 458 25 63"),
    TelegramArchiver(text: "Oybek", subtitle: "+998 94 564 22 33"),
    TelegramArchiver(text: "Hasan", subtitle: "+998 90 111 11 11"),
    TelegramArchiver(text: "Ergash", subtitle: "+998 90 798 00 11"),
    TelegramArchiver(text: "Hakkerla", subtitle: "+998 91 111 11 12"),
    TelegramArchiver(text: "Donyor aka", subtitle: "+998 90 222 10 13"),
    TelegramArchiver(text: "Ziyodbek", subtitle: "+998 33 550 11 21"),
    TelegramArchiver(text: "Asadbek", subtitle: "+998 90 101 10 00"),
    TelegramArchiver(text: "Laziz", subtitle: "+998 90 909 09 09"),
  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("New Messages"),
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: EdgeInsets.only(),
                child: IconButton(
                  icon: Icon(
                    Icons.list,
                    size: 30.0,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.group,
                          size: 30.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            "New Group",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.lock,
                          size: 30.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            "New Secret Chat",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.drive_file_move,
                          size: 30.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            "New Channel",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 8,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: MediaQuery.of(context).size.height * 0.035,
                        backgroundImage: NetworkImage(
                            "https://source.unsplash.com/random/$index"),
                      ),
                      title: Text(lst2[index].text.toString()),
                      subtitle: Text(lst2[index].subtitle.toString()),
                    ),
                  );
                },
                itemCount: lst2.length,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () {
          
          Navigator.pushNamed(context, "/add_contact_number",arguments: lst2);
        },
      ),
    );
  }
}
