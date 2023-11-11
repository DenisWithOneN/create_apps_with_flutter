// Copyright 2023 eduhoratiu <https://eduhoratiu.com/>
// Use of this source code is governed by an MIT-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import '../common/strings.dart' as strings;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // To keep track of the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 221, 0),
        title: Row(
          children: <Widget>[
            Icon(Icons.home_filled),
            Text(strings.homeScreenTitle),
          ],
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print('Copy button pressed');
            },
            icon: const Icon(Icons.content_copy),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromARGB(255, 255, 221, 0),
        focusColor: Colors.blue,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        icon: const Icon(Icons.assistant_photo),
        label: const Text(strings.homeFABLabel),
        splashColor: Colors.orange,
        onPressed: () => showDummyDialog(context),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Image.network(
              'https://static.vecteezy.com/system/resources/previews/018/974/617/original/baby-bee-icon-png.png',
              width: 50,
              height: 50,
            ),
            title: const Text('John Honeycomb'),
            subtitle: const Text(
                'me: I think the Queen got something for us to do tomorrow'),
            trailing: const Icon(Icons.check_circle_outline_sharp),
          ),
          ListTile(
            leading: Image.network(
              'https://static.vecteezy.com/system/resources/previews/018/818/817/original/flying-bee-icon-big-eyes-cute-cartoon-funny-baby-png.png',
              width: 50,
              height: 50,
            ),
            title: const Text('Mary Beehive'),
            subtitle: const Text('Mary: Do you got some leftover honey?'),
            trailing: const Icon(Icons.check_circle_outline_sharp),
          ),
          ListTile(
            leading: Image.network(
              'https://static.vecteezy.com/system/resources/previews/020/953/159/original/baby-bee-icon-png.png',
              width: 50,
              height: 50,
            ),
            title: const Text('Fred Propolis'),
            subtitle: const Text('me: I think I\'m allergic to pollen'),
            trailing: const Icon(Icons.check_circle_sharp),
          ),
          const SizedBox(
              height: 90), // Add some space between the ListTiles and the text

          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 20), // Adjust horizontal padding as needed
            child: Text(
              'Nothing else to show here... bzzz',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                color: Color.fromARGB(100, 145, 145, 145),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Color.fromARGB(255, 255, 221, 0),
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Set the new index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'New Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  /// Shows a dummy dialog box with a title and content.
  void showDummyDialog(BuildContext context) {
    TextEditingController textFieldController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(strings.dummyDialogBoxTitle),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(strings.dummyDialogBoxContent),
              TextField(
                controller: textFieldController,
                decoration:
                    const InputDecoration(hintText: 'Write you question...'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                // Access the text from the text field
                String typedText = textFieldController.text;
                // Perform actions with the typed text, if needed
                print('Typed text: $typedText');
                Navigator.of(context).pop();
              },
            ),
            // Add a cancel button to close the dialog
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
