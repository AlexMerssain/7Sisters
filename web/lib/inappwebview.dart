import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class inappwebview extends StatefulWidget {
  const inappwebview({super.key});

  @override
  State<inappwebview> createState() => _inappwebviewState();
}

class _inappwebviewState extends State<inappwebview> {
  double _progress = 0;
  late InAppWebViewController webView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 1,
          backgroundColor: Color.alphaBlend(
              Color.fromRGBO(235, 242, 238, 0.906),
              Color.fromARGB(0, 137, 126, 111)),
          elevation: 10,
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (await webView.canGoBack()) {
              webView.goBack();
              return false;
            } else {
              return true;
            }
          },
          child: Column(
            children: [
              _progress < 1
                  ? SizedBox(
                      height: 5,
                      child: LinearProgressIndicator(
                          value: _progress, color: Colors.red))
                  : SizedBox(),
              Expanded(
                child: InAppWebView(
                  initialUrlRequest: URLRequest(
                      url: Uri.parse('https://Getdeliver.000webhostapp.com')),
                  onWebViewCreated: (InAppWebViewController controller) {
                    webView = controller;
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      _progress = progress / 100;
                    });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
