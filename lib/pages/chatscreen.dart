import 'package:chat_app/pages/chat_messages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();

  List<ChatMessages> _messages = [];

  void _handleOnSubmitted(String text) {
    if (_controller.text.isEmpty) {
//      Scaffold.of(context).showSnackBar(SnackBar(
//        content: Text("Can't Send Empty Message"),
//      ));
      Fluttertoast.showToast(
          msg: 'Please Enter Message',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white);
    } else {
      _controller.clear();
      ChatMessages messages = ChatMessages(text: text);
      setState(() {
        _messages.insert(0, messages);
      });
    }
  }

  Widget _textComposerWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: "Type a message",
                    hintStyle: TextStyle(fontSize: 18.0),
                  ),
                  controller: _controller,
                  onSubmitted: _handleOnSubmitted,
                ),
              ),
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: () => _handleOnSubmitted(_controller.text),
              child: Icon(
                Icons.send,
                color: Colors.red,
              ),
              minWidth: 10.0,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Flexible(
              child: ListView.builder(
            padding: EdgeInsets.all(8.0),
            reverse: true,
            itemBuilder: (context, index) => _messages[index],
            itemCount: _messages.length,
          )),
          Container(
            child: _textComposerWidget(),
          )
        ],
      ),
    );
  }
}
