import 'dart:io' show Platform;

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:okaydemo/values/theme.dart';
import "package:okaythis_flutter_plugin/okaythis_flutter_plugin.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> permissions;
  OkaythisFlutterPlugin okaySdk;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String initReponse;
  String _appPns = "";
  String _pubPss = Platform.isAndroid
      ? "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxgyacF1NNWTA6rzCrtK60se9fVpTPe3HiDjHB7MybJvNdJZIgZbE9k3gQ6cdEYgTOSG823hkJCVHZrcf0/AK7G8Xf/rjhWxccOEXFTg4TQwmhbwys+sY/DmGR8nytlNVbha1DV/qOGcqAkmn9SrqW76KK+EdQFpbiOzw7RRWZuizwY3BqRfQRokr0UBJrJrizbT9ZxiVqGBwUDBQrSpsj3RUuoj90py1E88ExyaHui+jbXNITaPBUFJjbas5OOnSLVz6GrBPOD+x0HozAoYuBdoztPRxpjoNIYvgJ72wZ3kOAVPAFb48UROL7sqK2P/jwhdd02p/MDBZpMl/+BG+qQIDAQAB"
      : "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxgyacF1NNWTA6rzCrtK60se9fVpTPe3HiDjHB7MybJvNdJZIgZbE9k3gQ6cdEYgTOSG823hkJCVHZrcf0/AK7G8Xf/rjhWxccOEXFTg4TQwmhbwys+sY/DmGR8nytlNVbha1DV/qOGcqAkmn9SrqW76KK+EdQFpbiOzw7RRWZuizwY3BqRfQRokr0UBJrJrizbT9ZxiVqGBwUDBQrSpsj3RUuoj90py1E88ExyaHui+jbXNITaPBUFJjbas5OOnSLVz6GrBPOD+x0HozAoYuBdoztPRxpjoNIYvgJ72wZ3kOAVPAFb48UROL7sqK2P/jwhdd02p/MDBZpMl/+BG+qQIDAQAB";
  String INSTALLATION_ID = Platform.isAndroid ? "9990" : "9980";
  String _tokenStringMessage = "";
  final _linkingFormKey = GlobalKey<FormState>();
  final _authFormKey = GlobalKey<FormState>();
  final _unlinkFormKey = GlobalKey<FormState>();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    _configOkay();
    // Request permissions
    if (Platform.isAndroid) {
      _requestPermission();
      _initPsa();
    }

    // android
    _firebaseMessaging.configure(
      onMessage: backgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );

    // Retrieve appPns token here
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        _appPns = token;
        _tokenStringMessage = "Push Messaging token: $token";
      });
      print(_tokenStringMessage);
      print("App Token $_appPns");
    });
  }

  void _configOkay() {
    OkaythisFlutterPlugin.config(
        host: "http://protdemo.demohoster.com",
        onEnrollmentHandler: (bool enrollmentStatus) async {
          print("Enrollment Status: $enrollmentStatus");
        },
        onLinkingHandler: (bool linkingStatus) async {
          print("Linking Status: ${linkingStatus ? "Success" : "Failed"}");
        },
        onUnLinkingHandler: (bool unlinkingStatus) async {
          print("Unlinking Status: ${unlinkingStatus ? "Success" : "Failed"}");
        },
        onAuthorizationHandler: (bool authStatus) async {
          print("Auth Status: ${authStatus ? "Success" : "Failed"}");
        });
  }

  void _initPsa() async {
    try {
      initReponse = await OkaythisFlutterPlugin.initPsa();
      print("Response from init: $initReponse");
    } on PlatformException catch (e) {
      initReponse = "Issue with psa init $e";
    }
  }

  void _startEnrollment(
      String appPns, String pubPss, String installationId) async {
    await OkaythisFlutterPlugin.startEnrollment(appPns, pubPss, installationId);
  }

  void _requestPermission() async {
    print(await OkaythisFlutterPlugin.requestRequiredPermissions());
  }

  Future<dynamic> backgroundMessageHandler(Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
      print("Firebase data: $data");
    }

    print(message);

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
      print("Firebase Notification: $notification");
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("$initReponse"),
          Form(
            key: _linkingFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (linkingCode) {
                    if (linkingCode.isEmpty) {
                      return 'Please enter some text';
                    }
                    try {
                      print(linkingCode);
                      OkaythisFlutterPlugin.linkTenant(linkingCode);
                      return linkingCode;
                    } catch (e) {
                      return "invalid type";
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_linkingFormKey.currentState.validate()) {
                        // Process data.
                      }
                    },
                    child: Text('Link User'),
                  ),
                ),
              ],
            ),
          ),
          Form(
            key: _unlinkFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (tenantId) {
                    if (tenantId.isEmpty) {
                      return 'Please enter tenant id ';
                    }
                    try {
                      print(tenantId);
                      OkaythisFlutterPlugin.unlinkTenant(int.parse(tenantId));
                      return tenantId;
                    } catch (e) {
                      return "invalid type";
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_unlinkFormKey.currentState.validate()) {
                        // Process data.
                      }
                    },
                    child: Text('Unlink Tenant'),
                  ),
                ),
              ],
            ),
          ),
          Form(
            key: _authFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (sessionId) {
                    if (sessionId.isEmpty) {
                      return 'Please enter some text';
                    }
                    try {
                      print(sessionId);
                      OkaythisFlutterPlugin.startAuthorization(
                          int.parse(sessionId), _appPns, BaseTheme.getTheme());
                      return sessionId;
                    } catch (e) {
                      return "invalid type";
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_authFormKey.currentState.validate()) {
                        // Process data.
                      }
                    },
                    child: Text('Start Authentication'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _startEnrollment(_appPns, _pubPss, INSTALLATION_ID);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
