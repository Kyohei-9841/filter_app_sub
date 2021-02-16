import 'package:flutter/material.dart';
import './firebase_auth.dart';
import './HexColor.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import './NextPage.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {

  void _handlePressed() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('ログインページ'),
      //   centerTitle: true,
      // ),
      body: Container(
        // alignment: Alignment.center, // 中央
        // transform: Matrix4.rotationZ(0.1), // 傾き
        // color: HexColor('66FF66'),
        color: Colors.grey,
        padding: EdgeInsets.only(top:250.0),
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                transform: Matrix4.rotationZ(0.1),
                // child: Center(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width:300.0,
                        child: TextLiquidFill(
                          text: 'JOMU',
                          waveColor: Colors.blueAccent,
                          boxBackgroundColor: HexColor('66FF66'),
                          textStyle: TextStyle(
                            fontSize: 90.0,
                            fontWeight: FontWeight.bold,
                          ),
                          boxHeight: 150.0,
                        ),
                      ),
                    ],
                  ),
                // ),
              ),
              Container(
                padding: EdgeInsets.only(top:50.0),
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 6.0,
                      color: Colors.orange,
                      child: Text('ログイン'),
                      onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>NextPage(),)
                        )
                      },
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