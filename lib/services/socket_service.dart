import 'dart:async';
import 'dart:convert';
import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';
import 'package:autoservice/app/modules/chat/controllers/chat_socket/receive_message.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class SocketService extends GetxService {
  static const String URI = "https://autoservice-socket.herokuapp.com";
  IO.Socket socket;
  RxString userStatue = "".obs;
  RxBool inChatRoom = false.obs, readAllMessage = false.obs;

  Future<SocketService> init() async {
    // print('SocketService  Intiated ...');
    return this;
  }

  void initSocket(String identifier) async {
    IO.cache.clear();
    if (socket.isNull == false) {
      socket.io.disconnect();
    }
    socket = IO.io(
        URI,
        OptionBuilder()
            .setTransports(['websocket'])
            .setQuery(
                {"chatID": identifier, "timestamp": DateTime.now().toString()})
            .disableAutoConnect() // disable auto-connection

            // for Flutter or Dart VM
            // .setExtraHeaders() // optional
            .build());
    socket.onConnect((data) {
      print("connected...");
      // sendMessage('Hi from $identifier..');
    });
    socket.onConnectError((error) {
      // print("Socket Connect error $error");
    });
    socket.onConnectTimeout((error) {
      // print('Socket Connect error TimeOut $error');
    });

    socket.onError((error) {
      // print('Socket error  $error');
    });

    socket.onDisconnect((data) {
      // print('Socket onDisconnect  $data');
    });

    socket.on("receive_message", _onReceiveMessage);

    socket.on("receive_typing", _onReceiveTyping);

    socket.on("receive_stop_typing", _onReceiveStopTyping);

    socket.on("receive_recording", _onReceiveRecording);

    socket.on("receive_stop_recording", _onReceiveStopRecording);

    socket.on("receive_confirm_readed", _onReceiveConfirmReadied);

//------
    socket.connect();
  }

  sendMessage(event, message) {
    // print("sending message $message by socket to event $event");
    socket.emit(event, [message]);
  }

  _onReceiveMessage(messageData) {
    var data = json.decode(json.encode(messageData));
    if (inChatRoom.value) {
      final chatController = Get.find<ChatController>();
      if (chatController.clientId.value == data['senderChatID'] &&
          chatController.orderId.value.toString() == data['orderID']) {
        ReceiveMessageSocket.receiveMessage(data, chatController);
        UserStatusSocket.sendConfirmReadied(
            otherUserName: chatController.socketClientId.value,
            orderID: chatController.socketOrderId.value);
      }
    }

    print("Data from Socket $data");
    print(
        "New message: ${data['content']} received from :${data['senderChatID']}");
  }

  _onReceiveTyping(messageData) {
    var data = json.decode(json.encode(messageData));

    if (inChatRoom.value) {
      final chatController = Get.find<ChatController>();
      if (chatController.clientId.value == data['senderChatID'] &&
          chatController.orderId.value.toString() == data['orderID']) {
        userStatue("جاري الكتابة");
      }
    }

    print("Data from Socket $data");
  }

  _onReceiveStopTyping(messageData) {
    var data = json.decode(json.encode(messageData));

    if (inChatRoom.value) {
      final chatController = Get.find<ChatController>();
      if (chatController.clientId.value == data['senderChatID'] &&
          chatController.orderId.value.toString() == data['orderID']) {
        userStatue("");
      }
    }
    print("Data from Socket $data");
  }

  _onReceiveRecording(messageData) {
    var data = json.decode(json.encode(messageData));

    if (inChatRoom.value) {
      final chatController = Get.find<ChatController>();
      if (chatController.clientId.value == data['senderChatID'] &&
          chatController.orderId.value.toString() == data['orderID']) {
        userStatue("جاري تسجيل مقطع صوتي...");
      }
    }

    print("Data from Socket $data");
  }

  _onReceiveStopRecording(messageData) {
    var data = json.decode(json.encode(messageData));
    if (inChatRoom.value) {
      final chatController = Get.find<ChatController>();
      if (chatController.clientId.value == data['senderChatID'] &&
          chatController.orderId.value.toString() == data['orderID']) {
        userStatue("");
      }
    }
    userStatue("");
    print("Data from Socket $data");
  }

  _onReceiveConfirmReadied(messageData) {
    var data = json.decode(json.encode(messageData));
    print(data);
    if (inChatRoom.value) {
      final chatController = Get.find<ChatController>();
      // if (chatController.clientId.value == data['senderChatID'] &&
      //     chatController.orderId.value.toString() == data['orderID']) {
      //   readAllMessage.value = !readAllMessage.value;
      // }

    }
    readAllMessage.value = !readAllMessage.value;
    userStatue("");
    print("Data from Socket -confirmReadied- $data");
  }
}
