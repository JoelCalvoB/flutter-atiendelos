import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWEbViewPage extends StatefulWidget {
  String urlWebview;
  InAppWEbViewPage({Key? key,required this.urlWebview}) : super(key: key);

  @override
  State<InAppWEbViewPage> createState() => _InAppWEbViewPageState();
}

class _InAppWEbViewPageState extends State<InAppWEbViewPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: () async => false,
      child: Container(
        child: SafeArea(
          child: InAppWebView(
              initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(
                  useHybridComposition: true
            )
              ),
            initialUrlRequest:URLRequest(url: Uri.parse(widget.urlWebview)),),
        ),
      ),
    );
  }
}

