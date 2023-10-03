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
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login/Sign Up'),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKeySignin,
        child: ListView(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              validator: validate.validateUsername,
              controller: userName,
              decoration: InputDecoration(
                  label: Text('Username'),
                  hintText: 'Silahkan masukkan username'),
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
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return SignUp();
                  },
                ));
              },
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
