import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';

import '../controllers/web_view_in_a_p_p_controller.dart';

class WebViewInAPPView extends GetView<WebViewInAPPController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: InAppWebView(
          initialUrl: Get.arguments['myFatoorahURL'].toString(),
          initialHeaders: {'Authorization': 'Bearer $controller.apiToken'},
          initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                  debuggingEnabled: false, clearCache: true, cacheEnabled: false
                  // useShouldOverrideUrlLoading: true,
                  // useOnLoadResource: true,
                  )),
          onWebViewCreated: (InAppWebViewController webcontroller) {
            // controller.webView = webcontroller;
          },
          onLoadStart: (InAppWebViewController controller, String url) {
            // print(" load started $url");
          },
          onLoadStop:
              (InAppWebViewController webiewcontroller, String url) async {
            // print(" load stopped $url");
            if (url.contains('success')) {
              //id
              const startforid = "?id=";
              const endforid = "&";

              final startIndexforid = url.indexOf(startforid);
              final endIndex =
                  url.indexOf(endforid, startIndexforid + startforid.length);
              String id =
                  url.substring(startIndexforid + startforid.length, endIndex);
              // print(id);

//data.
              const startfordata = "data=";
              final startIndexfordata = url.indexOf(startfordata);
              String data =
                  url.substring(startIndexfordata + startfordata.length);
              // print(data);
              await controller.submit(context, id: id, data: data);
              // print('navigate To Success ');
            }
            if (url.contains('error')) {
              await Get.offAndToNamed('/address-payment',
                  arguments: {'failed': true});
            }
          },
          onConsoleMessage: (controller, consoleMessage) {
            // print("CONSOLE MESSAGE: " + consoleMessage.message);
            if (consoleMessage.message == "CAPTURED") {
              // print("Payment successed ..." + consoleMessage.message);
              Get.back();
            }
            if (consoleMessage.message == "DECLINED" ||
                consoleMessage.message == "closeFailed") {
              // print("Payment Failed ...");
              Get.back();
            }
          },
          onUpdateVisitedHistory: (InAppWebViewController webviewcontroller,
              String url, bool androidIsReload) async {
            // print("onUpdateVisitedHistory $url");
            if (url.contains('success')) {
              //id
              const startforid = "?id=";
              const endforid = "&";

              final startIndexforid = url.indexOf(startforid);
              final endIndex =
                  url.indexOf(endforid, startIndexforid + startforid.length);
              String id =
                  url.substring(startIndexforid + startforid.length, endIndex);
              // print(id);

//data.
              const startfordata = "data=";
              final startIndexfordata = url.indexOf(startfordata);
              String data =
                  url.substring(startIndexfordata + startfordata.length);
              // print(data);
              await controller.submit(context, id: id, data: data);
              // print('navigate To Success ');
            }
            if (url.contains('error')) {
              await Get.offAndToNamed('/address-payment',
                  arguments: {'failed': true});
            }

            // // print("onUpdateVisitedHistory: " + url);
          },
        ),
      ),
    );
  }
}
