import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/customer_services_controller.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomerServicesView extends GetView<CustomerServicesController> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final locale = Get.locale;
    return Scaffold(
      backgroundColor: Color.fromRGBO(239, 244, 255, 1),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        toolbarHeight: 75,
        title: Text(
          'customerService'.tr,
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
      ),
      body: Form(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SingleChildScrollView(
                child: SingleChildScrollView(
                  child: AnimationLimiter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: AnimationConfiguration.toStaggeredList(
                        duration: const Duration(milliseconds: 600),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset:
                              MediaQuery.of(context).size.width / 1,
                          child: SlideAnimation(child: widget),
                        ),
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Obx(
                              () => controller.loading.value == true
                                  ? Container()
                                  : Container(
                                      width: width * .9,
                                      padding: EdgeInsets.all(15),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 10),
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: AppColors.shadowColor,
                                              blurRadius: 20,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                          color: AppColors.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Column(
                                        children: [
                                          HtmlWidget(controller
                                              .response.data['title']),
                                        ],
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
