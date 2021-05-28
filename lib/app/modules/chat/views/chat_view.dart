import 'package:autoservice/app/modules/chat/controllers/work_with_orders/order_options.dart';
import 'package:autoservice/app/modules/chat/views/widgets/car_box_information.dart';
import 'package:autoservice/generated/time/time_format.dart';
import 'package:autoservice/theme/variables.dart';
import 'package:flutter/material.dart';
import 'package:autoservice/app/modules/chat/controllers/work_with_orders/call.dart';
import 'package:get/get.dart';

import '../controllers/chat_controller.dart';
import 'chat_loader.dart';
import 'widgets/chat-widgets/chat-footer.dart';
import 'widgets/chat-widgets/chat-body.dart';
import 'package:autoservice/app/Colors.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> with WidgetsBindingObserver {
  final controller = Get.find<ChatController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      print("app is resumed now");
      controller.socketClientId.value = "M_13";
      controller.socketOrderId.value =
          controller.carInfoModel.value.id.toString();
      print("================================================");
      UserStatusSocket.sendConfirmReadied(
          otherUserName: controller.socketClientId.value,
          orderID: controller.socketOrderId.value);
    }
    if (state == AppLifecycleState.paused) {
      print("app is resumed now");
      controller.socketClientId.value = "";
      controller.socketOrderId.value = "";
      print("=================================================");
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 130,
        centerTitle: true,
        actions: <Widget>[
          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(() => Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    // border: Border.all(color: AppColors.whiteColor),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: ClipOval(
                                    child: Image.network(
                                  'https://auto.wecoders.app/' +
                                      controller.garageImg.value,
                                  fit: BoxFit.contain,
                                )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                controller.garageName.value,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Cairo',
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          ),
// <<<<<<< HEAD
//                           Text(
//                             controller.garageName.value,
//                             textScaleFactor: 1,
//                             style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                                 fontFamily: 'Cairo',
//                                 color: Colors.white),
//                           ),
// =======
                          Text('${controller.socketService.userStatue.value}',
                              style: Get.textTheme.bodyText2.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
// >>>>>>> de0e979126850f3ce99295a6a7e5016bfb9866d7
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          OrderOptions.callClient(
                              userName: controller.garageName.value,
                              context: context,
                              callerName: controller.orderId.value,
                              otherDeviceToken: controller.fcmToken.value,
                              deviceToken:
                                  controller.notificationService.pushToken,
                              orderId: controller.orderId.value.toString(),
                              clientId: controller.carInfoModel.value.clientId
                                  .toString(),
                              companyId: controller.garageId.value);
                          controller.closeAllRecords();
                        },
                        child: Obx(() => Container(
                              height: 50,
                              width: width * .5,
                              child: Center(
                                child: Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/icons/Scrap/scrap(8).png'),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    CallOption.callLoading.value
                                        ? Container(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                              valueColor:
                                                  new AlwaysStoppedAnimation<
                                                      Color>(Colors.white),
                                            ),
                                          )
                                        : Text(
                                            'اتصال',
                                            textScaleFactor: 1,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Cairo',
                                                color: Colors.white),
                                          ),
                                  ],
                                ),
                              ),
                              color: Colors.green[600],
                            )),
                      ),
                      InkWell(
                        onTap: () {
                          controller.showRequestInputsDialog(context);
                        },
                        child: Container(
                          height: 50,
                          width: width * .5,
                          child: Center(
                            child: Row(
                              children: [
                                Image.asset(
                                    'assets/images/icons/Scrap/scrap(7).png'),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'طلب توصيل ',
                                  textScaleFactor: 1,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Cairo',
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          color: Colors.red[900],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: 10,
                right: 5,
                child: IconButton(
                  icon: new Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              )
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // CarBoxInformation(
            //   carDetails: controller.carInfoModel,
            // ),
            // Tabs Row

            // Row(
            //   children: [
            //     Expanded(
            //       child: TabButton(
            //           color: AppTheme.successColor,
            //           icon: Icons.local_phone_rounded,
            //           text: 'calling'.tr,
            //           function: () {
            //             // print('Calling');
            //           }),
            //     ),
            //     // Expanded(
            //     //   child: TabButton(
            //     //       color: AppTheme.blueColor,
            //     //       icon: Icons.bookmark,
            //     //       text: 'confirmOrder'.tr,
            //     //       function: () {
            //     //         // print('confirmOrder');
            //     //       }),
            //     // ),
            //     Expanded(
            //       child: TabButton(
            //           color: AppTheme.errorColor,
            //           icon: Icons.close,
            //           text: 'unavailable'.tr,
            //           function: () {
            //             // print('unavailable');
            //           }),
            //     ),
            //   ],
            // ),
            // Chat container
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 8, left: 8),
                child: Obx(() => controller.loading.value
                    ? ChatLoader()
                    : ChatList(chatController: controller)),
              ),
            ),
            // send message container
            ChatFooter(formKey: controller.formKey),
          ],
        ),
      ),
    );
  }
}
