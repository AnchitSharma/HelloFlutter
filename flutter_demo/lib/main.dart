import 'package:flutter/material.dart';


void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My App",
      home: new HomePage(),
      theme: new ThemeData(
        primarySwatch: Colors.green,
        brightness: Brightness.dark,
        accentColor: Colors.red,
      ),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String myText = "Hello World";

  void _changeState(){
    setState(() {
      if(myText.startsWith("H")){
        myText = "Welcome to my App";
      }else{
        myText = "Hello World";
      }
    });
  }
  Widget _bodyWidget(){
    return new Container(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(myText,
            style: new TextStyle(
              fontSize: 22.0
            ),),

          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("HomePage"),
      ),
      body: _bodyWidget(),
      floatingActionButton: new FloatingActionButton(onPressed: _changeState,
      child: new Icon(Icons.add),),
    );
  }
}

