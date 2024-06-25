import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key, required this.url, required this.name});
  final String url;
  final String name;

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:  Text(widget.name)),
      body: WebViewWidget(

        controller: controller(context),
      ),
    );
  }

  WebViewController controller(BuildContext context){
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(

          onProgress: (int progress) {
          },
          onUrlChange: ( url) {
          },
          onPageStarted: (url) {

          },
          onPageFinished: (String url) {


          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},

        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    return controller;
  }

}


