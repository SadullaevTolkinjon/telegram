import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:homeworkonolti/model/note_model.dart';
import 'package:flutter/material.dart';

class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  final _noteController = TextEditingController();
  bool _isSwitched = false;
  var _sliderValue = 0.0;
  List<NoteModels> _notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
        elevation: 0,
      ),
      body: JelloIn(
          child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: _noteController,
                      decoration: const InputDecoration(
                        labelText: "Type here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(55.0),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Should Remind ?"),
                        CupertinoSwitch(
                          activeColor: Colors.blue,
                          value: _isSwitched,
                          onChanged: (val) {
                            setState(() {
                              _isSwitched = val;
                            });
                          },
                        )
                      ],
                    ),
                    const Center(
                      child: Text("Importance Level !!!"),
                    ),
                    Slider(
                        value: _sliderValue,
                        divisions: 10,
                        label: _sliderValue.toString(),
                        onChanged: (val) {
                          setState(() {
                            _sliderValue = val;
                          });
                        }),
                    ElevatedButton(
                      child: const Text("Save Notes"),
                      onPressed: () {
                        setState(() {
                          _notes.add(NoteModels(
                              model: _noteController.text,
                              isRemind: _isSwitched,
                              importanceLevel: _sliderValue));

                          _noteController.clear();
                          _sliderValue = 0.0;
                          _isSwitched = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: _notes.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (val) {
                            setState(() {
                              _notes.removeAt(index);
                            });
                          },
                          child: Card(
                            child: ListTile(
                              title: Center(
                                child: Text(
                                  _notes[index].model.toString(),
                                ),
                              ),
                              trailing: CircleAvatar(
                                backgroundColor: _notes[index].isRemind!
                                    ? Colors.green
                                    : Colors.red,
                              ),
                              leading: CircleAvatar(
                                child: Text(
                                  _notes[index].importanceLevel.toString(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: _notes.length,
                    )
                  :const Center(
                      child: Text(
                      "Empty",
                      style: TextStyle(fontSize: 20.0),
                    ))),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child:const Icon(Icons.send),
        onPressed: () {
          Navigator.pushNamed(context, "/telegram");
        },
      ),
    );
  }
}
