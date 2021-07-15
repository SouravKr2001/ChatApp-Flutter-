import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sourav_mtv14/chat_message.dart';

class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController = new TextEditingController();

  final List<ChatMessage> _message = <ChatMessage> [];

  void _handleSubmitted(String text){
        _textController.clear();
        ChatMessage message = new ChatMessage(text: text);
        setState(() {
          _message.insert(0, message);
        });
  }

  Widget _textComposerWidget(){
    return IconTheme(
      data: IconThemeData(
        color: Colors.blueAccent[400]
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: <Widget>[
              Flexible(
                  child:TextField(
                    decoration: InputDecoration.collapsed(hintText: "Send a message"),
                    controller: _textController,
                    onSubmitted: _handleSubmitted,
                  ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: (){
                    _handleSubmitted(_textController.text);
                  },
                ),
              )
            ],
          )

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView.builder(
            padding: EdgeInsets.all(5),
            reverse: true,
            itemBuilder: (_,int index) => _message[index],
            itemCount: _message.length,
          ),
        ),
        new Divider(height: 1),
        new Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),

        )
      ],
    );
  }
}
