import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './twitter_sign_in.dart';

class FirebaseAuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FIrebaseAuthPageState();
}

enum Menu {
  twitter_sign_in,
  item2,
}
class FIrebaseAuthPageState extends State<FirebaseAuthPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _userAvatarUrl = '';
  String _userDisplayName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Auth Sample"),
      ),
      body: Column(
        children: <Widget>[
          PopupMenuButton(
            onSelected: popupMenuSelected,
            itemBuilder: (BuildContext context) =>
            <PopupMenuEntry<Menu>>[
              const PopupMenuItem( child: const ListTile( leading:Icon(Icons.account_box),
                  title:Text("Twitter Sign In")), value: Menu.twitter_sign_in),
              const PopupMenuItem( child: const ListTile( leading:Icon(Icons.account_circle),
                  title:Text("item2")), value: Menu.item2),
            ],
          ),
          ListTile(leading :
            CircleAvatar(
              backgroundImage: NetworkImage(_userAvatarUrl),
            ),
            title:Text(_userDisplayName ?? ''),),
        ],
      ),
    );
  }
  void popupMenuSelected(Menu selectedMenu){
    switch(selectedMenu) {
      case Menu.twitter_sign_in:
        _pushTwitterPage(context);
        break;
      default:
        break;
    }
  }

  void _pushTwitterPage(BuildContext context) async {
    Widget page = TwitterSignInPage(
            consumerKey: "TcGWkE49Q5TAZTbRbbu4pXGM2",
            consumerSecret: "5GoJKLMZVTps7J1NxAFOFWBXO95D0cQyCa7DAYmpL21ht7tUUx",
            oauthCallbackHandler: "cm-app://");

    final credential = await Navigator.of(context).push(
        MaterialPageRoute<AuthCredential>(builder: (_) => page)
    );

    var user;
    print("くれで");

    print(credential);
    var result = (await _auth.signInWithCredential(credential));
    print(result.user.uid);

    if (credential != null) {
      user = (await _auth.signInWithCredential(credential)).user;
    }
    setState(() {
      if (user != null) {
        _userAvatarUrl = user.photoUrl;
        _userDisplayName = user.displayName;
      } else {
        _userDisplayName = 'Failed to sign in with Twitter. ';
      }
    });
  }

//  void _twitterSignOut() async {
//    _auth.signOut();
//  }

}