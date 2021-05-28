import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:autoservice/app/modules/used_accessories_details/controllers/used_accessories_details_controller.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:fdottedline/fdottedline.dart';
import 'package:autoservice/app/modules/new_accessories/model.dart' as model;
import 'package:autoservice/app/modules/used_accessories_details/views/widgets/swiper.dart';
import 'package:autoservice/app/modules/used_accessories_details/views/widgets/galleryWidgetItem.dart';
import 'package:autoservice/app/modules/used_accessories_details/views/widgets/listview.dart';
import 'package:url_launcher/url_launcher.dart';

class UsedAccessoriesDetailsView
    extends GetView<UsedAccessoriesDetailsController> {
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

  UsedAccessoriesDetailsView({this.item, this.url});
  var item;
  String url;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor:
          // Color.fromRGBO(255, 255, 255, 1),
          AppColors.scaffoldBackgroud,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          item.partName,
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
        decoration: BoxDecoration(color: AppColors.scaffoldBackgroud),
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
                        Container(
                          width: width * .9,
                          margin: EdgeInsets.only(top: 5),
                          // margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: height * .25,
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
                                                                        index)[
                                                                'imageURL'],
                                                      ),
                                                      heroAttributes:
                                                          const PhotoViewHeroAttributes(
                                                              tag: "someTag"),
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
                                                item.images.elementAt(
                                                    index)['imageURL'],
                                            isInside: false,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // ClipRRect(
                                  //   borderRadius: BorderRadius.circular(8),
                                  //   child: InkWell(
                                  //     onTap: () {
                                  //       showDialog(
                                  //         context: context,
                                  //         builder: (BuildContext context) {
                                  //           return SwiperDialog(
                                  //               ImageThumbCarouselWidget(
                                  //                   url: url,
                                  //                   galleriesList: item.images,
                                  //                   isInside: true));
                                  //         },
                                  //       );
                                  //     },
                                  //     child: Container(
                                  //       height: height * .25,
                                  //       width: width,
                                  //       child: Image.network(
                                  //         url + item.images[0]['imageURL'],
                                  //         fit: BoxFit.cover,
                                  //         height: height * .27,
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),

                                  SizedBox(
                                    height: height * 0.08,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'نوع السيارة',
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Color.fromRGBO(
                                                    143, 146, 161, 1)),
                                          ),
                                          Text(
                                            item.carTypeName,
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FDottedLine(
                                        color: Colors.grey,
                                        height: 45.0,
                                        strokeWidth: 0.50,
                                        dottedLength: 3.0,
                                        space: 2.0,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'موديل',
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Color.fromRGBO(
                                                    143, 146, 161, 1)),
                                          ),
                                          Text(
                                            item.carModelName.toString(),
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FDottedLine(
                                        color: Colors.grey,
                                        height: 45.0,
                                        strokeWidth: 0.50,
                                        dottedLength: 3.0,
                                        space: 2.0,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'سنة الصنع',
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Color.fromRGBO(
                                                    143, 146, 161, 1)),
                                          ),
                                          Text(
                                            item.startYear.toString() +
                                                ' : ' +
                                                item.endYear.toString(),
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      FDottedLine(
                                        color: Colors.grey,
                                        height: 45.0,
                                        strokeWidth: 0.50,
                                        dottedLength: 3.0,
                                        space: 2.0,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            'السعر',
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Color.fromRGBO(
                                                    200, 142, 116, 1)),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                item.unitPrice.toString(),
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color: Color.fromRGBO(
                                                        200, 142, 116, 1)),
                                              ),
                                              Text(
                                                'د.ك',
                                                textScaleFactor: 1,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: 'Cairo',
                                                    color: Color.fromRGBO(
                                                        200, 142, 116, 1)),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: FDottedLine(
                                      color: Colors.grey,
                                      width: width * 0.8,
                                      strokeWidth: 0.50,
                                      dottedLength: 3.0,
                                      space: 2.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.only(
                                                  bottom: 8.0,
                                                  right: 5,
                                                  left: 5),
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
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: height * 0.1,
                                    decoration: BoxDecoration(
                                        color: AppColors.primaryColor,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15))),
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
                                              url + item.images[0]['imageURL'],
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
                                                      color: Color.fromRGBO(
                                                          143, 146, 161, 1)),
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
                              Positioned(
                                top: height * 0.22,
                                height: height * 0.09,
                                width: width * .9,
                                child: Container(
                                  height: height * 0.09,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  child: Center(
                                    child: Text(
                                      item.partName,
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
                            ],
                          ),
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
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.only(bottom: 10),
      //   child: Row(
      //     children: [
      //       SizedBox(
      //         width: width * .02,
      //       ),
      //       Container(
      //         height: 60,
      //         width: width * 0.75,
      //         decoration: BoxDecoration(
      //             color: AppColors.primaryColor,
      //             borderRadius: BorderRadius.circular(10)),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Container(
      //               margin: EdgeInsets.symmetric(horizontal: 20),
      //               child: Row(
      //                 children: [
      //                   Text(
      //                     '25',
      //                     textScaleFactor: 1,
      //            style: TextStyle(
      //                         fontSize: 23,
      //                         fontWeight: FontWeight.w500,
      //                         fontFamily: 'Cairo',
      //                         color: Colors.white),
      //                   ),
      //                   Text(
      //                     'د.ك',
      //                     textScaleFactor: 1,
      //         style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.w500,
      //                         fontFamily: 'Cairo',
      //                         color: Colors.white),
      //                   ),
      //                 ],
      //               ),
      //             ),
      //             Container(
      //               margin: EdgeInsets.symmetric(horizontal: 20),
      //               child: Row(
      //                 children: [
      //                   Container(
      //                     height: 30,
      //                     width: 30,
      //                     child: Icon(
      //                       Icons.add,
      //                       color: Colors.white,
      //                       size: 20,
      //                     ),
      //                     // margin: EdgeInsets.symmetric(horizontal: 5),
      //                     decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       border: Border.all(
      //                           color: AppColors.whiteColor, width: 2),
      //                       color: AppColors.primaryColor,
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                   Text(
      //                     '1',
      //                     textScaleFactor: 1,
      //        style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.bold,
      //                         fontFamily: 'Cairo',
      //                         color: Colors.white),
      //                   ),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                   Container(
      //                     height: 30,
      //                     width: 30,
      //                     child: Icon(
      //                       Icons.remove,
      //                       color: Colors.white,
      //                       size: 20,
      //                     ),
      //                     // margin: EdgeInsets.symmetric(horizontal: 5),
      //                     decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       border: Border.all(
      //                           color: AppColors.whiteColor, width: 2),
      //                       color: AppColors.primaryColor,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         width: width * .02,
      //       ),
      //       Container(
      //         height: 60,
      //         width: width * 0.15,
      //         child: Icon(Icons.shopping_cart, color: Colors.white),
      //         decoration: BoxDecoration(
      //             color: AppColors.primaryColor,
      //             borderRadius: BorderRadius.circular(10)),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
