import 'package:char_app/constrants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firestore = FirebaseFirestore.instance;
var loggedUser;
//FirebaseUser loggedUser;
final _auth = FirebaseAuth.instance;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //final user = FirebaseAuth.instance.currentUser;
  var userEmail;
  String message;

  final messageController = TextEditingController();
  @override
  void initState() {
    getUser();
    super.initState();
  }

  void getUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
        print('${loggedUser.password}');
        userEmail = loggedUser.email;
        print('yourrr email is  $userEmail');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('${loggedUser.email}'),
        backgroundColor: cBackgroundColor,
        actions: [
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MessageStream(),
          Container(
            height: 50,
            //color: cBackgroundColor,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: cBackgroundColor,
                    child: TextField(
                      controller: messageController,
                      onChanged: (value) {
                        message = value;
                        //print(message);
                      },
                      maxLines: 10,
                      minLines: 1,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Type here..',
                        hintStyle: TextStyle(color: Colors.white54),
                        contentPadding: EdgeInsets.only(left: 10, right: 5),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    color: Color(0xFF1E8449),
                    child: FlatButton(
                      onPressed: () async {
                        // write messages in cloud firestore.
                        if (message != null) {
                          CollectionReference _fireStore =
                              _firestore.collection('messages');
                          await _fireStore.add({
                            'text': message,
                            'sender': loggedUser.email,
                          });
                          messageController.clear();
                          message = null;
                        } else {
                          print('Please write');
                        }
                      },
                      child: Text(
                        'send',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // read all messages from cloud firestore collection.
      stream: _firestore
          .collection('messages')
          .snapshots(), // snapshot is use for quering data.
      builder: (context, snapshot) {
        List<MessageBubble> messageWidgets = [];
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blueGrey,
            ),
          );
        }
        final messages = snapshot.data.docs
            .reversed; // ..reversed used for showing current message in reversed form.

        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');

          final _currentUser = _auth.currentUser.email;

          final messageWidget = MessageBubble(
            message: messageText,
            sender: messageSender,
            isMe: _currentUser == messageSender,
          );
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            children: messageWidgets,
            reverse: true,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message, sender;
  final bool isMe;
  MessageBubble({this.message, this.sender, this.isMe});
  final double redious = 20;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isMe
          ? EdgeInsets.only(left: 20, right: 10, top: 5, bottom: 5)
          : EdgeInsets.only(left: 10, right: 20, top: 5, bottom: 5),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(isMe ? '' : sender,
              style: TextStyle(color: cChatColor, fontSize: 12)),
          Material(
            elevation: 5.0,
            borderRadius: isMe
                ? BorderRadius.only(
                    topRight: Radius.circular(redious),
                    bottomLeft: Radius.circular(redious),
                    topLeft: Radius.circular(redious),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(redious),
                    bottomLeft: Radius.circular(redious),
                    bottomRight: Radius.circular(redious),
                  ),
            color: isMe ? cMyChatColor : cChatColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 18,
                  color: isMe ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
