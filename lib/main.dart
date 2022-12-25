import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'WebView/InAppWebViewPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Atiendelos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(child: MyHomePage()),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; // <- override this method
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(milliseconds: 3500),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => InAppWEbViewPage(
                    urlWebview: 'https://atiendelosappversion1.web.app/'))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              FadeInImage(
                fadeInDuration: Duration(milliseconds: 1000),
                placeholder:AssetImage('assets/icon/logoresutaurante.png') , image:NetworkImage('https://www.itecsi.mx/wp-content/uploads/2021/04/itecsi-integracion-tecnologia-sistemas-informacion.png') )
            ] ),
        ));
  }
}
