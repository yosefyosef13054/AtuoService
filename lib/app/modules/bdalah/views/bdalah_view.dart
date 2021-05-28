import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/bdalah/controllers/bdalah_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:url_launcher/url_launcher.dart';

class BdalahView extends GetView<BdalahController> {
  @override
  var url;
  _makePhoneCall() async {
    url = "tel:" + "${controller.response.data['phone']}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroud,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: height,
                color: AppColors.primaryColor,
              ),
            ),
            Obx(
              () => Positioned(
                top: 0,
                right: 0,
                left: 0,
                height: height,
                child: controller.loading.value == true
                    ? Container()
                    : SingleChildScrollView(
                        child: SizedBox(
                          height: height,
                          child: SingleChildScrollView(
                            child: AnimationLimiter(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 600),
                                  childAnimationBuilder: (widget) =>
                                      SlideAnimation(
                                    horizontalOffset:
                                        MediaQuery.of(context).size.width / 1,
                                    child: SlideAnimation(child: widget),
                                  ),
                                  children: [
                                    // SizedBox(
                                    //   height: height * 0.08,
                                    // ),
                                    Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: width * .1),
                                            child: Text(
                                              'بدالة الونشات',
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color: AppColors.whiteColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    Center(
                                      child: Container(
                                        width: width * .91,
                                        // height: height * 0.75,
                                        padding: EdgeInsets.all(10),
                                        margin:
                                            EdgeInsets.symmetric(vertical: 5),
                                        decoration: BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              controller.response.data['title']
                                                  .toString(),
                                              textScaleFactor: 1,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Cairo',
                                                  color:
                                                      AppColors.primaryColor),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            IconButton(
                                              onPressed: () => _makePhoneCall(),
                                              icon: Icon(
                                                Icons.call,
                                                color: AppColors.primaryColor,
                                                size: 70,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(15),
                                              child: Center(
                                                child: Text(
                                                  controller.response
                                                      .data['description']
                                                      .toString(),
                                                  textScaleFactor: 1,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: 'Cairo',
                                                      color: AppColors
                                                          .primaryColor),
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  border: Border.all(
                                                      color: AppColors
                                                          .primaryColor,
                                                      width: 1),
                                                ),
                                                // height: height * 0.24,
                                                width: width * .7,
                                                child: Image.network(
                                                  'http://www.europarl.europa.eu/resources/library/images/20190308PHT30931/20190308PHT30931-pl.jpg',
                                                  fit: BoxFit.contain,
                                                  // height: height * 0.24,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
