import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  void host() {
    Firestore.instance.collection('rooms').document().setData({ 'players': '[]' });
  }

  void join() {}

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
