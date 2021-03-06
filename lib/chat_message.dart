import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String _name = "Sourav";

class ChatMessage extends StatelessWidget {
final String text;

ChatMessage({required this.text});

  @override

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 16),
            child: new CircleAvatar(
              child: Text(_name[0]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_name,
              style: Theme.of(context).textTheme.subhead),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Text(text),
              )

            ],
          )
        ],
      ),
    );
  }
}
