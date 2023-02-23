import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Screen'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/u6vbBpbDSxd5XaJ5pWcd/messages')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data!.docs;
          return ListView.builder(
              itemBuilder: (ctx, index) => Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(documents[index]['text']),
                  ),
              itemCount: streamSnapshot.data!.docs.length);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/u6vbBpbDSxd5XaJ5pWcd/messages')
              .add({'text': 'This was added by clicking the button!'});
        },
      ),
    );
  }
}
