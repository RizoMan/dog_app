import 'package:flutter/material.dart';
import './dog_card.dart';
import './dog_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Rate Dogs',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(title: 'We Rate Dogs'),
    );
  }
}

class MyHomePage extends StatefulWidget{
  final String title;

  MyHomePage({Key key, this.title}): super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  List<Dog> initialDoggos = []
    ..add(Dog('Ruby', 'Portland, OR, USA', 
    'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        child: new DogCard(initialDoggos[0]),
      ),
    );
  }
}