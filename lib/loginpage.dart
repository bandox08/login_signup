import 'package:flutter/material.dart';
import 'package:login_signup/commponent/validator.dart';
import 'package:login_signup/models/authmodel.dart';
import 'package:login_signup/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  AuthModel signCredential = AuthModel();
  GlobalKey<FormState> formKeySignin = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffKey = GlobalKey<ScaffoldState>();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  Validator validate = Validator();
  handleSubmit() {
    print(userName.text);
    print(password.text);
    // print(userName.text);
    // print(password.text);
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
                      'Hello Again!',
                      style: TextStyle(fontSize: 50),
                    ),
                    Text(
                      'Fill Your Detail Or Continue With Social Media',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                validator: validate.validateUsername,
                controller: userName,
                decoration: InputDecoration(
                    label: Text('Username'),
                    hintText: 'Silahkan masukkan username'),
              ),
              SizedBox(
                height: 50,
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
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  var form = formKeySignin.currentState;
                  if (form!.validate()) {
                    /// form.save();
                    handleSubmit();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                onPressed: () {
                  var form = formKeySignin.currentState;
                  if (form!.validate()) {
                    /// form.save();
                    handleSubmit();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'google.png',
                      scale: 20,
                    ),
                    Text(
                      'Sign In With Google',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(height: 20),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SignUp();
                    },
                  ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New User? ',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Text(
                      'Create Account',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
