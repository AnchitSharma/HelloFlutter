import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{

  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen>{

  final TextEditingController _textEditingController = new TextEditingController();

  void _handleSubmitted(String text){
    _textEditingController.clear();
  }
  Widget _textComposerWidget(){
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new TextField(
        decoration: new InputDecoration.collapsed(
          hintText: "Send a message"
        ),
        controller: _textEditingController,
        onSubmitted: _handleSubmitted,
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return _textComposerWidget();
  }

}