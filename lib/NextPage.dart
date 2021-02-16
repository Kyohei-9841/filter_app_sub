import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:english_words/english_words.dart';
import 'package:twitter_login/entity/auth_result.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_login/entity/user.dart';
import 'dart:convert';

// リクエスト
import './Http/Request/Main.dart';
import './Http/Request/MainAdditional.dart';
import './Http/Request/User.dart';
import './Http/Request/Search.dart';
import './Http/Request/Reply.dart';
import './Http/Request/Tweet.dart';
import './Http/Request/Retweet.dart';
import './Http/Request/Favorites.dart';
import './Http/Request/RetweetDestroy.dart';
import './Http/Request/Unretweet.dart';
import './Http/Request/FavoritesDestroy.dart';
import './Http/Request/DirectMessages.dart';
import './Http/Request/DirectMessagesShow.dart';
import './Http/Request/DirectMessagesNew.dart';
import './Http/Request/BlocksIds.dart';
import './Http/Request/BlocksList.dart';
import './Http/Request/BlocksCreate.dart';
import './Http/Request/BlocksDestroy.dart';
import './Http/Request/MutesIds.dart';
import './Http/Request/MutesList.dart';
import './Http/Request/MutesCreate.dart';
import './Http/Request/MutesDestroy.dart';
import './Http/Request/WebhookAdd.dart';

// レスポンス
import './Http/Response/Main.dart';
import './Http/Response/MainAdditional.dart';
import './Http/Response/User.dart';
import './Http/Response/Search.dart';
import './Http/Response/Reply.dart';
import './Http/Response/Tweet.dart';
import './Http/Response/Retweet.dart';
import './Http/Response/Favorites.dart';
import './Http/Response/RetweetDestroy.dart';
import './Http/Response/Unretweet.dart';
import './Http/Response/FavoritesDestroy.dart';
import './Http/Response/DirectMessages.dart';
import './Http/Response/DirectMessagesShow.dart';
import './Http/Response/DirectMessagesNew.dart';
import './Http/Response/BlocksIds.dart';
import './Http/Response/BlocksList.dart';
import './Http/Response/BlocksCreate.dart';
import './Http/Response/BlocksDestroy.dart';
import './Http/Response/MutesIds.dart';
import './Http/Response/MutesList.dart';
import './Http/Response/MutesCreate.dart';
import './Http/Response/MutesDestroy.dart';
import './Http/Response/WebhookAdd.dart';

class NextPage extends StatefulWidget {

  @override
  _NextPage createState() => _NextPage();
}

class _NextPage extends State<NextPage> {

  var _suggestions = [];
  var _user_response_data;

  final _biggerFont = const TextStyle(fontSize: 18.0);

  AuthResult auth_result;

  @override
  Widget build(BuildContext context) {

    getAccsesToken();

    return Scaffold(
      appBar: AppBar(
        title: Text('SNS認証画面'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: _handlePressed,
            // onPressed: () => {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context)=>ThirdPage(),)
            //   )
            // },
            color: Colors.blue,
            child: Text(
              '動作',
              style: TextStyle(
                  color:Colors.white,
                  fontSize: 20.0
              ),
            ),
          )
        ],
      ),
      // body:Center(
      //   child: Text('Hello World'),
      // ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          // if (index >= _suggestions.length) {
          //   _suggestions.addAll(generateWordPairs().take(10));
          // }
          // return ListTile(title: Text(_suggestions[i].toString(), style: _biggerFont));
          if (_suggestions.length != 0) {
            return _buildRow(_suggestions[i]);
          } else {
            return Text("更新中");
          }
        });
  }

  Widget _buildRow(pair) {
    return ListTile(
      title: Text(
        pair.toString(),
        style: _biggerFont,
      ),
    );
  }

  getAccsesToken() async {
    print("ログインのところ");

    final twitterLogin = TwitterLogin(
      apiKey: 'TcGWkE49Q5TAZTbRbbu4pXGM2',
      apiSecretKey: '5GoJKLMZVTps7J1NxAFOFWBXO95D0cQyCa7DAYmpL21ht7tUUx',
      redirectURI: 'cm-app://',
    );

    try {

      print(_user_response_data);

      if(_user_response_data == null) {
        auth_result = await twitterLogin.login();

        User user = auth_result.user;

        String user_url = "https://00534195df91.ngrok.io/filtering-app-2a2dc/us-central1/api/other/user";
        // String user_url = "https://us-central1-filtering-app-2a2dc.cloudfunctions.net/api/other/user";

        print("aaaaaaaあああ");

        final user_request = new UserRequest(
            screen_name: user.screenName,
            access_token: auth_result.authToken,
            access_token_secret: auth_result.authTokenSecret
        );
        print("aaaaaaaあああ2");

        final user_response = await http.post(user_url,
          body: user_request.toJson(),
          // headers: {"Content-Type": "application/json"}
        );

        print("ここ3");

        _user_response_data = UserResponse.fromJson(json.decode(user_response.body));
      }

      print("ここ4");

      String user_id = _user_response_data.user_id;

      print("ここ5");

      print(user_id);

      if (_suggestions.length == 0) {
        String url = "https://00534195df91.ngrok.io/filtering-app-2a2dc/us-central1/api/main";
        // String url = "https://us-central1-filtering-app-2a2dc.cloudfunctions.net/api/main";

        print("ここ１");

        final request = new MainRequest(
            user_id: _user_response_data.user_id,
            access_token: auth_result.authToken ,
            access_token_secret: auth_result.authTokenSecret
        );
        print("ここ2");

        final response = await http.post(url,
          body: request.toJson(),
          // headers: {"Content-Type": "application/json"}
        );
        print("ここ3");

        var response_data = MainResponse.fromJson(json.decode(response.body));

        print(response_data.response_data[0]);

        _suggestions = response_data.response_data;
      }

      setState(() {
        _suggestions;
        _user_response_data;
      });

    } catch(e) {
      print("エラー");
      print(e);
    }
  }

  void _handlePressed() async {
    String url = "https://00534195df91.ngrok.io/filtering-app-2a2dc/us-central1/api/webhook/subscriptions/remove";
    // String url = "https://us-central1-filtering-app-2a2dc.cloudfunctions.net/api/direct_messages/list";

    print("動作ここ１");
    print(_user_response_data.user_id);
    print(auth_result.authToken);
    print(auth_result.authTokenSecret);

    final request = new WebhookAddRequest(
        user_id: _user_response_data.user_id,
        access_token: auth_result.authToken ,
        access_token_secret: auth_result.authTokenSecret,
    );
    print("動作ここ2");

    final response = await http.post(url,
      body: request.toJson(),
      // headers: {"Content-Type": "application/json"}
    );
    print("動作ここ3");

    var response_data = WebhookAddResponse.fromJson(json.decode(response.body));

    print(response_data.response_data);

    // print(response_data.response_data.length);

    // _suggestions = response_data.response_data;
    //
    // setState(() {
    //   _suggestions;
    //   _user_response_data;
    // });

  }
}
