import 'package:flutter/material.dart';
import 'package:login_signup/models/authmodel.dart';
import 'commponent/validator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  DocumentReference signup =
      FirebaseFirestore.instance.collection('signup').doc('data');
  final add = {};
  String radioItem = '';
  AuthModel signCredential = AuthModel();
  GlobalKey<FormState> formKeySignin = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffKey = GlobalKey<ScaffoldState>();
  TextEditingController userName = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Validator validate = Validator();
  handleSubmitsignup() {
    print(userName.text);
    print(password.text);
    print(email.text);
    print(name.text);
    print(radioItem);
  }

  addSignUp() {
    // Call the user's CollectionReference to add a new user
    signup
        .set({
          'User_Name': userName.text,
          'Name': name.text,
          'Email': email.text,
          'password': password.text,
          'Jenis_kelamin': radioItem,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(
      content: const Text('Silahkan Periksa'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
    return Scaffold(
        key: scaffKey,
        body: Container(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKeySignin,
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                  color: Colors.white,
                  height: 150,
                  width: 100,
                  child: Column(
                    children: [
                      Text(
                        'Register Account',
                        style: TextStyle(fontSize: 50),
                      ),
                      Text(
                        'Fill Your Detail Or Continue With Social Media',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                        maxLines: 2,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: validate.email,
                  controller: email,
                  decoration: InputDecoration(
                      label: Text('Email Anda'),
                      hintText: 'Masukkan Email Anda'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: validate.name,
                  controller: name,
                  decoration: InputDecoration(
                      label: Text('Nama Lenkap Anda'),
                      hintText: 'Masukkan Nama Lenkap Anda'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: validate.validateUsername,
                  controller: userName,
                  decoration: InputDecoration(
                      label: Text('User Name Anda'),
                      hintText: 'Masukkan User Name Anda'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: validate.password,
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                      label: Text('Password'),
                      hintText: 'Silahkan masukkan password',
                      suffixIcon: Icon(Icons.remove_red_eye)),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Jenis Kelamin',
                      style: TextStyle(fontSize: 15),
                    ),
                    Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.white,
                        height: 100,
                        width: MediaQuery.sizeOf(context).width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RadioMenuButton(
                              value: 'Laki - Laki',
                              groupValue: radioItem,
                              onChanged: (value) {
                                setState(() {
                                  radioItem = value!;
                                });
                              },
                              child: Text('Laki - Laki'),
                            ),
                            RadioMenuButton(
                                value: 'Perempuan',
                                groupValue: radioItem,
                                onChanged: (value) {
                                  setState(() {
                                    radioItem = value!;
                                  });
                                },
                                child: Text('Perempuan'))
                          ],
                        )),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => addSignUp(),
                  child: Text(
                    'Lanjut Daftar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
