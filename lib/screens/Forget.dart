import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgetScreen extends StatelessWidget {
  final String email;
  ForgetScreen(this.email);
  final mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    mailController.text = email;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recover Password',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Recover password'),
          actions:[ MaterialButton(
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              child: Icon(Icons.keyboard_backspace)),]
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: ListView(
              children: [
                TextField(
                  controller: mailController,
                  decoration:
                      InputDecoration(labelText: 'Email or phone number'),
                ),
                Padding(padding: EdgeInsets.all(10)),
                ElevatedButton(
                    onPressed: () {}, child: Text('Send Recovery Email'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
