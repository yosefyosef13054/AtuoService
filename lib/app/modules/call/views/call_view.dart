import 'package:autoservice/app/modules/call/views/widgets/call_body.dart';
import 'package:autoservice/theme/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/call_controller.dart';

class CallView extends StatefulWidget {
  @override
  _CallViewState createState() => _CallViewState();
}

class _CallViewState extends State<CallView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      final controller = Get.find<CallController>();
      controller.agoraService.appPaused(true);
      controller.detectCloseCall();
      controller.callFirst(true);

    }
    if (state == AppLifecycleState.paused) {
      final controller = Get.find<CallController>();
      controller.agoraService.appPaused(false);
      controller.callFirst(false);
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient:
              LinearGradient(colors: [Colors.white, Colors.grey[200]])),
          child: Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                ),
              ),
              CallBody()
            ],
          ),
        ),
      ),
    );
  }
}
