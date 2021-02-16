import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:oauth1/oauth1.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;

///
/// https://stackoverflow.com/questions/60461547/how-to-sign-in-with-twitter-using-firebase-auth-with-flutter
///
class TwitterSignInPage extends StatefulWidget {

  final twitterPlatform = Platform(
    'https://api.twitter.com/oauth/request_token', // temporary credentials request
    'https://api.twitter.com/oauth/authorize', // resource owner authorization
    'https://api.twitter.com/oauth/access_token', // token credentials request
    SignatureMethods.hmacSha1, // signature method
  );

  final ClientCredentials clientCredentials;
  final String oauthCallbackHandler;

  TwitterSignInPage({
    @required final String consumerKey,
    @required final String consumerSecret,
    @required this.oauthCallbackHandler,
  }) : clientCredentials = ClientCredentials(consumerKey, consumerSecret);

  @override
  State<StatefulWidget> createState() => TwitterSignInPageState();
}

enum Menu {twitter_sign_in, twitter_sign_out}

class TwitterSignInPageState extends State<TwitterSignInPage> {
  final flutterWebviewPlugin = FlutterWebviewPlugin();

  Authorization _oauth;

  @override
  void initState() {
    super.initState();

    // Twitter OAuth の初期化
    _oauth = Authorization(widget.clientCredentials, widget.twitterPlatform);

    flutterWebviewPlugin.onUrlChanged.listen((url) {
      // STEP2のコールバックを、STEP3へ移動するために監視
      if (url.startsWith(widget.oauthCallbackHandler)) {
        final queryParameters = Uri.parse(url).queryParameters;
        final oauthToken = queryParameters['oauth_token'];
        final oauthVerifier = queryParameters['oauth_verifier'];
        if (null != oauthToken && null != oauthVerifier) {
          _twitterLogInFinish(oauthToken, oauthVerifier);
        }
      }
    });
    _twitterLogInStart();
  }

  @override
  void dispose() {
    flutterWebviewPlugin.dispose();
    super.dispose();
  }

  Future<void> _twitterLogInStart() async {
    assert(null != _oauth);

    // STEP1:リクエストトークンの入手
    //    oauth/request_tokenをPOST送信することで、リクエストトークンを入手
    //    oauth_callbackは、STEP2が成功したときにリダイレクトされるURL
    final requestTokenResponse =
        await _oauth.requestTemporaryCredentials(widget.oauthCallbackHandler);

    // STEP2: 認証ページへのリダイレクト
    //   oauth/authenticate のGETリクエストに、STEP1で入手したトークンを、oauth_tokenとして渡す
    final authorizationPage = _oauth.getResourceOwnerAuthorizationURI(
        requestTokenResponse.credentials.token);

    flutterWebviewPlugin.reloadUrl(authorizationPage);
  }

  Future<void> _twitterLogInFinish(
      String oauthToken, String oauthVerifier) async {

    // STEP3: リクエストトークンをアクセストークンに変換
    //     リクエストトークンをアクセストークンに書換えるのに、アプリケーションはPOST oauth/access_token へ STEP2で入手した、
    //     oauth_verifier POSTリクエストを送信する必要がある。
    //     リクエストトークンは、oauth_token ヘッダーにも渡されるが、これは署名プロセスに追記される
    final tokenCredentialsResponse = await _oauth.requestTokenCredentials(
        Credentials(oauthToken, ''), oauthVerifier);

    // final result = TwitterAuthProvider.getCredential(
    //   authToken: tokenCredentialsResponse.credentials.token,
    //   authTokenSecret: tokenCredentialsResponse.credentials.tokenSecret,
    // );

    final result = TwitterAuthProvider.credential(
      accessToken: tokenCredentialsResponse.credentials.token,
      secret: tokenCredentialsResponse.credentials.tokenSecret,
    );
    print("ここは？");

    print(result);

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(title: Text("Twitter Login")),
      url: "https://twitter.com",
    );
  }
}