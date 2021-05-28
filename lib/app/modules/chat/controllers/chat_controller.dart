import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:autoservice/app/modules/chat/controllers/get_chat_details.dart';
import 'package:autoservice/app/modules/chat/controllers/get_more_message.dart';
import 'package:autoservice/app/modules/chat/controllers/message_details_api/message.dart';
import 'package:autoservice/app/modules/chat/controllers/message_model.dart';
import 'package:autoservice/app/modules/chat/controllers/reply_message.dart';
import 'package:autoservice/app/modules/chat/controllers/message_details_api/get_order_details.dart';
import 'package:autoservice/services/socket_service.dart';
import 'package:autoservice/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:convert';
import 'package:autoservice/app/widgets/SendRequestDialog.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:autoservice/app/modules/scrap_orders/model.dart';
import 'package:autoservice/app/services/httpService.dart';
import 'package:autoservice/app/modules/chat/controllers/record/record_audio.dart';

//
class ChatController extends GetxController {
  final http = Get.find<HttpService>();

  //init notification service
  final notificationService = Get.find<NotificationsService>();
  //init http service
  final httpService = Get.find<HttpService>();
  //init socket service
  final socketService = Get.find<SocketService>();

  Rx<TextEditingController> messageController;
  RxString messageText = RxString('');
  //use this value in current page in pagination
  RxInt currentPage = RxInt(1);
  //this obj from package i used it for mention in message
  AutoScrollController autoScrollCtrl = AutoScrollController();

  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  final RoundedLoadingButtonController btnController =
      new RoundedLoadingButtonController();
  //order model to get all data about order
  Rx<MyScrapRequests> carInfoModel = Rx<MyScrapRequests>();
  //loading before fetch chat details
  RxBool loading = true.obs;
  //show send icon
  RxBool typing = false.obs;
  //show record icon
  RxBool recording = false.obs;
  //use this value to detect the other user is readied all message or not
  RxBool isReadiedAllMsg = false.obs;
  // var user='s';
  RxList<MessageModal> messages = RxList([]);
  //order model to get all data about order
  //Form Key for chat input
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Rx<ReplyMessageModel> replyMessage = Rx<ReplyMessageModel>();
  //var to replace value to order id
  RxString orderId = "0".obs;
  var dialogResponse = "".obs;
  //this var include client id to use it in socket and others
  RxString clientId = RxString("");
  //this is values for garage information
  RxString fcmToken = RxString("");
  RxString garageId = RxString("");
  RxString garageName = RxString("");
  RxString garageImg = RxString("");
  /*
  this vars for socket (when app paused and resumed)
  * */
  RxString socketClientId = "".obs;
  RxString socketOrderId = "".obs;
  RxString socketChatId = "".obs;
  //--

  void submit(context) async {
    await httpService.postUrl('ScrapOrders/UpdateAccepted', {
      'acceptedComment': detailsController.text.toString(),
      'totalPrice': priceController.text.toString(),
      'scrapCompanyId': clientId.value.toString(),
      'id': orderId.value.toString(),
    }).then((response) {
      print(response);
      try {
        Future.delayed(Duration(milliseconds: 10), () {
          Fluttertoast.showToast(
              msg: 'created_Request_Successfully'.tr,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.TOP,
              timeInSecForIosWeb: 0,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        });
        // /used-cars-add
        btnController.success();
        detailsController.clear();
        priceController.clear();

        Future.delayed(
            Duration(milliseconds: 600), () => btnController.reset());
        Future.delayed(Duration(milliseconds: 600),
            () => Get.offAndToNamed('/home-screen'));
        loading.value = false;
      } catch (e) {
        btnController.error();
        Future.delayed(
            Duration(milliseconds: 1200), () => btnController.reset());
        loading.value = false;
        print("Exepition with Login : ${e}");
      }
    }).catchError((onError) {
      loading.value = false;
      btnController.error();
      Future.delayed(Duration(milliseconds: 1200), () => btnController.reset());
      print(onError);
      print('eroooooooor');
      print(onError.response);
      Fluttertoast.showToast(
          msg: onError.response.data.toString(),
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 0,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

      //Get.back();
// onError.response['error_description']
      // // print('Login error ${onError.response.data['error_description']}');
    });
  }

  void showRequestDialog(context) {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(
                child: SendScrapRequestDialog(
              response: dialogResponse.value,
            ));
          });
    });
  }

  void showRequestInputsDialog(context) {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return Center(child: SendScrapRequestInputsDialog());
          });
    });
  }

  @override
  void onInit() async {
    // dialogResponse.value = Get.arguments['dialogResponse']['deliveryMessage'];
    messageController = TextEditingController().obs;
    orderId.value = Get.arguments['orderId'];

    socketService.inChatRoom(true);
    listenToConfirmReadied();
    await getOrderDetails();
    UserStatusSocket.listenStartTyping(messageText,
        otherUserName: "M_${garageId.value}",
        orderID: carInfoModel.value.id.toString());
    UserStatusSocket.listenStopTyping(messageText,
        otherUserName: "M_${garageId.value}",
        orderID: carInfoModel.value.id.toString());
    print(carInfoModel.value.clientId.toString());

    super.onInit();
  }

  listenToConfirmReadied() {
    socketService.readAllMessage.listen((val) {
      print("all meg is readied");
      isReadiedAllMsg.value = !isReadiedAllMsg.value;
      messages.forEach((message) {
        message.readed = 2;
      });
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    RecordAudio.recordfilePath("");
    // notificationService.otherId.value = "";
    socketService.userStatue("");
    socketService.inChatRoom(false);
    closeAllRecords();
  }

  closeAllRecords() {
    for (int i = 0; i < messages.length; i++) {
      messages[i].assetsAudioPlayer.stop();
    }
  }

  getOrderDetails() async {
    var response = await http.get('DefaultLists/GetScrapDelivery');
    dialogResponse.value = response.data['deliveryMessage'];
    await OrderDetails.getOrderDetails(
        messages: this.messages,
        orderId: this.orderId.value.toString(),
        carInfoModel: this.carInfoModel,
        fcmToken: fcmToken,
        garageImg: garageImg,
        garageId: garageId,
        garageName: garageName);

    clientId.value = "M_${garageId.value}";
    // notificationService.otherId.value = carInfoModel.value.id.toString();
    //
    // print(notificationService.otherId.value);

    await getChatDetails();
  }

  getChatDetails({userId, otherId}) async {
    await ChatDetails.getChatDetails(
      loading: loading,
      messages: messages,
      userId: this.carInfoModel.value.id.toString(),
      otherId: this.clientId.toString(),
    ).then((value) {
      Future.delayed(Duration(seconds: 2), () {
        this.autoScrollCtrl.animateTo(
            this.autoScrollCtrl.position.maxScrollExtent + 2000,
            duration: const Duration(milliseconds: 10),
            curve: Curves.easeIn);
      });
    });

    UserStatusSocket.sendConfirmReadied(
        otherUserName: "M_${garageId.value}",
        orderID: carInfoModel.value.id.toString());

    //this values for socket only
    socketClientId("M_${garageId.value}");
    socketOrderId(carInfoModel.value.id.toString());
    socketChatId(ChatDetails.chatId.value);
    //--
  }

  Future sendMessage(
      {RxString message,
      Rx<ReplyMessageModel> replyMessage,
      int type,
      Rx<TextEditingController> textMessage}) {
    formKey.currentState.save();
    if (type == 0) {
      Message.sendTextMessage(
          message: message,
          scrollController: this.autoScrollCtrl,
          messageList: this.messages,
          typing: this.typing,
          fcmToken: this.fcmToken.value,
          myId: this.carInfoModel.value.clientId.toString(),
          orderID: this.orderId.value,
          receiverChatID: this.clientId.value,
          companyId: garageId.value,
          replyMessage: replyMessage,
          type: type,
          textController: textMessage,
          chatId: ChatDetails.chatId.value);
    } else if (type == 3) {
      Message.sendAudioMessage(
          message: message,
          scrollController: this.autoScrollCtrl,
          messageList: this.messages,
          recordPath: this.messageText,
          recording: this.recording,
          orderID: this.orderId.value,
          fcmToken: this.fcmToken.value,
          companyId: garageId.value,
          myId: this.carInfoModel.value.clientId.toString(),
          receiverChatID: this.clientId.value,
          replyMessage: replyMessage,
          type: type,
          textController: textMessage,
          chatId: ChatDetails.chatId.value);
    } else if (type == 2) {
      Message.sendPhotoMessage(
          message: message,
          scrollController: this.autoScrollCtrl,
          messageList: this.messages,
          typing: this.typing,
          orderID: this.orderId.value,
          fcmToken: this.fcmToken.value,
          companyId: garageId.value,
          myId: this.carInfoModel.value.clientId.toString(),
          receiverChatID: this.clientId.value,
          replyMessage: replyMessage,
          type: type,
          textController: textMessage,
          chatId: ChatDetails.chatId.value);
    }
  }

  getMoreMessage() {
    autoScrollCtrl.addListener(() {
      if (autoScrollCtrl.position.pixels ==
          autoScrollCtrl.position.minScrollExtent) {
        // print("HI");
        MoreMessage.getMoreMessage(
            messageList: this.messages,
            chatId: ChatDetails.chatId.value,
            userId: orderId.toString(),
            page: currentPage.value);
        currentPage.value++;
      }
    });
  }
}

class UserStatusSocket {
  static final socketService = Get.find<SocketService>();

  //This is come active when user start typing
  static listenStartTyping(userMessage, {otherUserName, orderID}) {
    interval(userMessage, (_) {
      startTyping(otherUserName, orderID);
    });
  }

  //This is come active when user stop typing
  static listenStopTyping(userMessage, {otherUserName, orderID}) {
    debounce(userMessage, (_) {
      stopTyping(otherUserName, orderID);
    });
  }

  static startTyping(otherUserName, orderID) {
    var socketTypingMap =
        json.encode({'receiverChatID': otherUserName, 'orderID': orderID});
    // print("send typing to event send_typing via socket");
    socketService.sendMessage("send_typing", socketTypingMap);
  }

  static stopTyping(otherUserName, orderID) {
    var socketStopTypingMap =
        json.encode({'receiverChatID': otherUserName, 'orderID': orderID});
    // print("send stop typing to event send_stop_typing via socket");
    socketService.sendMessage("send_stop_typing", socketStopTypingMap);
  }

  static startRecording(otherUserName, orderID) {
    var socketRecordingMap =
        json.encode({'receiverChatID': otherUserName, 'orderID': orderID});
    // print("send recording to event send_recording via socket");
    socketService.sendMessage("send_recording", socketRecordingMap);
  }

  static stopRecording(otherUserName, orderID) {
    var socketStopRecordingMap =
        json.encode({'receiverChatID': otherUserName, 'orderID': orderID});
    // print("send stop recording to event send_stop_recording via socket");
    socketService.sendMessage("send_stop_recording", socketStopRecordingMap);
  }

  static sendConfirmReadied({otherUserName, orderID, senderChatID}) {
    var socketConfirmReadiedMap =
        json.encode({'receiverChatID': otherUserName, 'orderID': orderID});
    print("send stop recording to event confirm_readied via socket");
    socketService.sendMessage("confirm_readed", socketConfirmReadiedMap);
  }
}
