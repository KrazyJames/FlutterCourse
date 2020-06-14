import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String body;
  final bool isCurrentUser;

  BorderRadius _senderBubbleRadius = BorderRadius.only(
    topRight: Radius.circular(16.0),
    bottomLeft: Radius.circular(16.0),
    bottomRight: Radius.circular(16.0),
  );

  BorderRadius _currentBubbleRadius = BorderRadius.only(
    topLeft: Radius.circular(16.0),
    bottomLeft: Radius.circular(16.0),
    topRight: Radius.circular(16.0),
  );

  MessageBubble({this.sender, this.body, this.isCurrentUser});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            isCurrentUser ? "" : sender,
            style: TextStyle(
              fontSize: isCurrentUser ? 0.0 : 12.0,
              color: Colors.black,
            ),
          ),
          Material(
            borderRadius: isCurrentUser ? _currentBubbleRadius : _senderBubbleRadius,
            elevation: 4.0,
            color: isCurrentUser ? Colors.lightBlueAccent : Colors.white70,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Text(
                body,
                style: TextStyle(
                  color: isCurrentUser ? Colors.white : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
