import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

final uuid = new Uuid();
final TextStyle btnStyle = new TextStyle();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Espion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void host() async {
    String key = base64.encode(uuid.v4().toString().runes.toList()).substring(0, 6);
    print('Using key: $key');
    Firestore.instance.collection('rooms').document(key).collection('players').add({'id': 'Luan'});
  }

  void join() {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Espion'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(child: Text('Host', style: btnStyle), onPressed: () => host()),
            RaisedButton(child: Text('Join', style: btnStyle), onPressed: () => join()),
          ],
        ),
      ),
    );
  }
}
