import 'package:flutter/material.dart';
import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/widgets/inputs/AccessoriesAddInput.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';

class SendScrapRequestDialog extends StatelessWidget {
  SendScrapRequestDialog({
    Key key,
    @required this.response,
  }) : super(key: key);

  // final bool error;
  final response;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        child: Container(
          height: 500,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(13),
                  bottomLeft: Radius.circular(13),
                  topRight: Radius.circular(13),
                  bottomRight: Radius.circular(13))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Center(
                    child: Text(
                      'احرص بعد الاتفاق مع التاجر علي ',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                  Center(
                    child: Text(
                      ' طلب القطعه عبر الضغط علي',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    child: Center(
                      child: Row(
                        children: [
                          Image.asset('assets/images/icons/Scrap/scrap(7).png'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'طلب توصيل ',
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cairo',
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.red[800],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Text(
                      'و ذلك لضمان حقك في ضمان جوده القطعه مع إمكانية الترجيع او التبديل ',
                      textScaleFactor: 1,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  Center(
                    child: Text(
                      'مجاناً',
                      textScaleFactor: 1,
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    response.toString(),
                    textScaleFactor: 1,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 35,
                      width: 90,
                      child: Center(
                        child: Text(
                          'إغلاق',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cairo',
                              color: Colors.white),
                        ),
                      ),
                      color: Colors.red[800],
                    ),
                  ),
                ],
              )
              // Container(
              //   margin: EdgeInsets.only(top: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [

              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class SendScrapRequestInputsDialog extends StatelessWidget {
  //  SendScrapRequestDialog({
  //   Key key,
  //   // @required this.label,
  //   // this.error = false,
  // }) : super(key: key);

  // final bool error;
  // final String label;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ChatController chatController = Get.find();
  FocusNode node;
  @override
  Widget build(BuildContext context) {
    // final node = FocusScope.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Form(
        key: _formKey,
        child: Container(
          child: Container(
            height: 430,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13),
                    bottomLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                    bottomRight: Radius.circular(13))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Center(
                      child: Text(
                        'رجاء تسجيل اسم القطع',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    Center(
                      child: Text(
                        ' المتفق عليها و السعر ',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontFamily: 'Cairo',
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'add_price'.tr,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontFamily: 'Cairo',
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      child: AccessoriesInput(
                          // focusNode: node,
                          lines: 1,
                          action: TextInputAction.next,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'required'.tr;
                            }
                          },
                          submit: () => node.nextFocus(),
                          controller: chatController.priceController,
                          label: '',
                          type: TextInputType.number),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'scrapPices'.tr,
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontFamily: 'Cairo',
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Column(
                      children: [
                        Container(
                          child: AccessoriesInput(
                              focusNode: node,
                              lines: 3,
                              action: TextInputAction.done,
                              submit: () {
                                final FormState form = _formKey.currentState;

                                if (form.validate()) {
                                  chatController.submit(context);
                                } else {
                                  chatController.btnController.error();
                                  Future.delayed(
                                      Duration(milliseconds: 1200),
                                      () =>
                                          chatController.btnController.reset());
                                }
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'required'.tr;
                                }
                              },
                              controller: chatController.detailsController,
                              label: '',
                              type: TextInputType.text),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Container(
                        child: Container(
                          width: 120,
                          child: RoundedLoadingButton(
                            color: AppColors.primaryColor,
                            child: Text(
                              'sendscrap'.tr,
                              textScaleFactor: 1,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Cairo',
                                  color: AppColors.whiteColor),
                            ),
                            controller: chatController.btnController,
                            onPressed: () {
                              final FormState form = _formKey.currentState;

                              if (form.validate()) {
                                chatController.submit(context);
                              } else {
                                chatController.btnController.error();
                                Future.delayed(Duration(milliseconds: 1200),
                                    () => chatController.btnController.reset());
                              }
                            },
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.whiteColor),
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(15)),
                        height: 45,
                      ),
                    ),
                  ],
                )
                // Container(
                //   margin: EdgeInsets.only(top: 10),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [

                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
