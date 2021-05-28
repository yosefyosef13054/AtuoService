import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:autoservice/app/modules/heavy_cars/controllers/heavy_cars_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/modules/used_cars_forsell/model.dart' as model;
import 'package:photo_view/photo_view.dart';
import 'package:autoservice/app/modules/used_accessories_details/views/widgets/galleryWidgetItem.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class HeavyCarsView extends GetView<HeavyCarsController> {
  HeavyCarsView({Key key, this.item, this.url}) : super(key: key);
  var item;
  var url;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    _makePhoneCall() async {
      url = "tel:" + "${item.phone}";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    void launchWhatsApp({
      @required int phone,
      @required String message,
    }) async {
      String url() {
        if (Platform.isAndroid) {
          // add the [https]
          return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
        } else {
          // add the [https]
          return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
        }
      }

      if (await canLaunch(url())) {
        await launch(url());
      } else {
        throw 'Could not launch ${url()}';
      }
    }

    return Scaffold(
      backgroundColor:
          // Color.fromRGBO(255, 255, 255, 1),
          AppColors.whiteColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'شاحنات ومعدات',
          textScaleFactor: 1,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: 'Cairo',
              color: AppColors.whiteColor),
        ),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(color: AppColors.whiteColor),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * .12,
                width: width,
                color: AppColors.primaryColor,
              ),
              SingleChildScrollView(
                child: AnimationLimiter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 600),
                      childAnimationBuilder: (widget) => SlideAnimation(
                        horizontalOffset: MediaQuery.of(context).size.width / 1,
                        child: SlideAnimation(child: widget),
                      ),
                      children: [
                        // Container(
                        //   height: height * .05,
                        //   width: width,
                        // ),
                        Stack(
                          children: [
                            Center(
                              child: Container(
                                width: width * .9,
                                // margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(239, 244, 255, 1),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height * .3,
                                      width: width,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: item.images.length,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            splashColor: Theme.of(context)
                                                .accentColor
                                                .withOpacity(0.8),
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    child: Container(
                                                      child: PhotoView(
                                                        tightMode: true,
                                                        imageProvider:
                                                            NetworkImage(
                                                          url.toString() +
                                                              item.images
                                                                  .elementAt(
                                                                      index)
                                                                  .imageUrl,
                                                        ),
                                                        heroAttributes:
                                                            const PhotoViewHeroAttributes(
                                                                tag:
                                                                    "someTag2"),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                              // showDialog(
                                              //   context: context,
                                              //   builder: (BuildContext context) {
                                              //     return SwiperDialog(
                                              //         ImageThumbCarouselWidget(
                                              //             url: url,
                                              //             galleriesList:
                                              //                 item.images,

                                              // );
                                            },
                                            child: GalleryItemWidget(
                                              image: url.toString() +
                                                  item.images
                                                      .elementAt(index)
                                                      .imageUrl,
                                              isInside: false,
                                            ),
                                          );
                                        },
                                      ),
                                    ),

                                    SizedBox(
                                      height: height * 0.1,
                                    ),
                                    Center(
                                      child: Text(
                                        item.description,
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: Colors.black),
                                      ),
                                    ),
                                    // Container(
                                    //   margin: EdgeInsets.symmetric(vertical: 10),
                                    //   child: FDottedLine(
                                    //     color: Colors.grey,
                                    //     width: width * 0.8,
                                    //     strokeWidth: 0.50,
                                    //     dottedLength: 3.0,
                                    //     space: 2.0,
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 45,
                                          width: width * 0.2,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.shadowColor,
                                                  blurRadius: 20,
                                                  offset: Offset(0, 10),
                                                ),
                                              ],
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                'المحافظة',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                              Text(
                                                item.areaName,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 45,
                                          width: width * 0.2,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.shadowColor,
                                                  blurRadius: 20,
                                                  offset: Offset(0, 10),
                                                ),
                                              ],
                                              color: Color.fromRGBO(
                                                  128, 128, 188, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'سنة الصنع',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                              Text(
                                                item.carYearName,
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          height: 45,
                                          width: width * 0.2,
                                          decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.shadowColor,
                                                  blurRadius: 20,
                                                  offset: Offset(0, 10),
                                                ),
                                              ],
                                              color: Color.fromRGBO(
                                                  200, 142, 116, 1),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'السعر / د.ك',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                              Text(
                                                item.unitPrice.toString(),
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Cairo',
                                                    color:
                                                        AppColors.whiteColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )

                                    // FDottedLine(
                                    //   color: Colors.grey,
                                    //   width: 60.0,
                                    //   strokeWidth: 0.50,
                                    //   dottedLength: 3.0,
                                    //   space: 2.0,
                                    // ),
                                    // FDottedLine(
                                    //   color: Colors.grey,
                                    //   height: 60.0,
                                    //   strokeWidth: 0.50,
                                    //   dottedLength: 3.0,
                                    //   space: 2.0,
                                    // )
                                    ,
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: height * 0.1,
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15),
                                              bottomRight:
                                                  Radius.circular(15))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              ClipOval(
                                                  child:
                                                      // image != null
                                                      //     ? Image.file(
                                                      //         image,
                                                      //         fit: BoxFit.cover,
                                                      //       )
                                                      //     :
                                                      Image.network(
                                                'https://images.unsplash.com/photo-1541963463532-d68292c34b19?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxleHBsb3JlLWZlZWR8M3x8fGVufDB8fHw%3D&w=1000&q=80',
                                                fit: BoxFit.cover,
                                                height: width * 0.12,
                                                width: width * 0.12,
                                              )),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    item.clientName,
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white),
                                                  ),
                                                  Text(
                                                    item.phone.toString(),
                                                    textScaleFactor: 1,
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily: 'Cairo',
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Spacer(
                                            flex: 03,
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () async {
                                                  await _makePhoneCall();
                                                },
                                                icon: Image.asset(
                                                  'assets/images/icons/Acs/Acs(3).png',
                                                  height: 25,
                                                  width: 25,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  launchWhatsApp(
                                                      phone:
                                                          int.parse(item.phone),
                                                      message: '');
                                                },
                                                icon: Image.asset(
                                                  'assets/images/icons/Acs/Acs(4).png',
                                                  height: 25,
                                                  width: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(
                                            flex: 01,
                                          ),

                                          // Icon(Icons.call, color: Colors.white),
                                          // Icon(Icons.chat, color: Colors.white),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: height * .282,
                              height: height * 0.09,
                              width: width * .9,
                              right: width * .05,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  height: height * 0.09,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  child: Center(
                                    child: Text(
                                      item.partNameAr,
                                      textScaleFactor: 1,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Cairo',
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
