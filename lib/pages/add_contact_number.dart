import 'package:flutter/material.dart';
import 'package:homeworkonolti/model/telegram_archiver.dart';
import 'package:homeworkonolti/pages/add_contact.dart';

class AddContactNumber extends StatefulWidget {
  List<TelegramArchiver>? qabul;
  AddContactNumber({Key? key, this.qabul}) : super(key: key);

  @override
  _AddContactNumberState createState() => _AddContactNumberState();
}

class _AddContactNumberState extends State<AddContactNumber> {
  var nameController = TextEditingController();
  final _nameController2 = TextEditingController();
  var nameControllernumber = TextEditingController();

  String _dropValue = "Uzbekistan";

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
        title: Text("Add Contacts"),
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(),
                child: IconButton(
                  icon: Icon(
                    Icons.done,
                    size: 30.0,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.qabul!.add(TelegramArchiver(
                          text: nameController.text,
                          subtitle: nameControllernumber.text));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddContacts()));
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 45.0,
              child: Icon(
                Icons.add_a_photo_outlined,
                size: 35.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "First Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: TextFormField(
              controller: _nameController2,
              decoration: InputDecoration(
                hintText: "Last Name",
              ),
            ),
          ),
          DropdownButton(
              value: _dropValue,
              items: [
                DropdownMenuItem(
                  child: Text("Uzbekistan"),
                  value: "Uzbekistan",
                ),
                DropdownMenuItem(
                  child: Text("Russia"),
                  value: "Russia",
                ),
                DropdownMenuItem(
                  child: Text("Kazakthstan"),
                  value: "Kazakhstan",
                ),
                DropdownMenuItem(
                  child: Text("USA"),
                  value: "USA",
                )
              ],
              onChanged: (v) {
                setState(() {
                  _dropValue = v.toString();
                });
              }),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
            child: TextFormField(
              controller: nameControllernumber,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "Phone number",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
