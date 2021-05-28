import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/terms_controller.dart';

class TermsView extends GetView<TermsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TermsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TermsView is working',
          textScaleFactor: 1,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
