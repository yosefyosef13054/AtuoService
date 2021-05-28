import 'package:autoservice/app/modules/call/controllers/call_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'call_acceptable.dart';
import '../call_buttons.dart';
import '../call_header.dart';

class CallBody extends GetView<CallController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CallHeader(),
        Obx(() =>
            controller.incomingCall.value ? CallAcceptable() : CallButtons())
      ],
    );
  }
}
