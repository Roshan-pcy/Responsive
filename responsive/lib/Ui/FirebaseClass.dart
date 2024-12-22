import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyFriends extends StatefulWidget {
  const MyFriends({super.key});

  @override
  State<MyFriends> createState() => _MyFriendsState();
}

class _MyFriendsState extends State<MyFriends> {
  final obj = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Frineds'),
        ),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  print('clicked');
                  String id = generateUserId();

                  obj.doc('123').set({
                    'id': id,
                    'name': 'Anonumous',
                    'goal': 'success',
                    'gender': 'male',
                  }).then((value) {
                    addFriend('123', '171239390149224');
                  });
                },
                child: Text('Add'))
          ],
        ));
  }

  String generateUserId() {
    final random = Random();
    final millisecondsSinceEpoch = DateTime.now().millisecondsSinceEpoch;
    final randomPart = random.nextInt(100);

    print('$millisecondsSinceEpoch$randomPart');
    return '$millisecondsSinceEpoch$randomPart';
  }

  Future<void> addFriend(String currentUserId, String friendUserId) async {
    print('function called');
    final friendRef = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserId)
        .collection('friends')
        .doc(friendUserId);

    // Check if the friend already exists
    final friendDoc = await friendRef.get();
    if (!friendDoc.exists) {
      // If the friend does not exist, add them with their ID only
      await friendRef.set({
        'friendId': friendUserId,
        // Add other friend details as needed
      });
      print('Friend added successfully');
    } else {
      print('Friend already exists');
    }
  }
}
