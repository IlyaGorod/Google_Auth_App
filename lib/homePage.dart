import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign In'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Sign In'),
              onPressed: user != null ? null : () async{
                await _googleSignIn.signIn();
                setState(() {

                });
              },
            ),
            ElevatedButton(
              child: Text('Sign Out'),
              onPressed: user == null ? null : () async{
                await _googleSignIn.signOut();
                setState(() {

                });
              },
            ),
          ],
        ),
      ),
    );
  }

}