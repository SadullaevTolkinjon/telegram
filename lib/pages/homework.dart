import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _forBody = [
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.amber, backgroundColor: Colors.blue),
            child: Text(
              "Reminder",
              style: TextStyle(fontSize: 35.0),
            ),
            onPressed: () {},
          ),
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.amber, backgroundColor: Colors.blue),
            child: Text(
              "Reminder 2",
              style: TextStyle(fontSize: 35.0),
            ),
            onPressed: () {},
          ),
        )
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.amber, backgroundColor: Colors.blue),
            child: Text(
              "Reminder 3",
              style: TextStyle(fontSize: 35.0),
            ),
            onPressed: () {},
          ),
        )
      ],
    ),
  ];
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Dismissible(
        key: UniqueKey(),
        onDismissed: (val) {
          if (DismissDirection.endToStart == val) {
            setState(() {
              _forBody[_currentIndex + 1];
            
            });
          } else if (DismissDirection.startToEnd == val) {
            setState(() {
              _forBody[_currentIndex - 1];
            });
          }
        },
        child: _forBody[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (val) {
          setState(() {
            _currentIndex = val;
            indexChanger(val);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add photo"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings")
        ],
      ),
    );
  }

  indexChanger(int index) {}
}
