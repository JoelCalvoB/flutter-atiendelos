import 'package:flutter/material.dart';
import 'package:webviewproyecto/WebView/InAppWebViewPage.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final identificadorForm = GlobalKey<FormState>();
  final TextEditingController txturlWebView = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: identificadorForm,
          child: Column(
            children: [
              Text("Ingresa url para visualizar"),
              TextFormField(
                  controller: txturlWebView,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingresar url para webview...';
                    }
                    return null;
                  }),
              SizedBox(
                height: 30,
              ),
              TextButton(
                child: Text("Visualizar webview"),
                onPressed: () {
                  if (identificadorForm.currentState!.validate()) {
                    String txtWebView = txturlWebView.text;
                    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>InAppWEbViewPage(urlWebview: txtWebView,)));
                  }
                },
              )
            ],
          ),
        ));
  }
}
