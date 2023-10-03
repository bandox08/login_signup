import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class signupc extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final String userName;
  final String password;
  final String name;
  final String email;

  signupc(this.userName, this.password, this.email, this.name);

  @override
  Widget build(BuildContext context) {
    CollectionReference signup =
        FirebaseFirestore.instance.collection('signup');

    Future<void> addSignUp() {
      // Call the user's CollectionReference to add a new user
      return signup
          .add({
            'User_Name': userName,
            'Name': name,
            'Email': email,
            'password': password,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return const Placeholder();
  }
}
