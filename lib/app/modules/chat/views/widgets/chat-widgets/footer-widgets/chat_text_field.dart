import 'package:autoservice/app/modules/chat/controllers/chat_controller.dart';
import 'package:autoservice/theme/variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTextField extends StatelessWidget {
  ChatTextField({this.formKey, this.chatController});

  GlobalKey formKey;
  ChatController chatController;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Form(
          key: formKey,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 80.0,
            ),
            child: TextFormField(
              maxLines: null,
              keyboardType: TextInputType.name,
              cursorColor: AppTheme.primaryColor,
              controller: chatController.messageController.value,
              onChanged: (v) {
                if (v != "") {
                  chatController.typing(true);
                  UserStatusSocket.startTyping(
                      "M_${chatController.garageId.value}",
                      chatController.orderId.value.toString());
                } else if (v == "") {
                  chatController.typing(false);
                  UserStatusSocket.stopTyping(
                      "M_${chatController.garageId.value}",
                      chatController.orderId.value.toString());
                }
                if (v.trim().isEmpty) {
                  chatController.typing(false);
                  UserStatusSocket.stopTyping(
                      "M_${chatController.garageId.value}",
                      chatController.orderId.value.toString());
                }
              },
              onSaved: (v){
                chatController.messageText.value = v;
              },
              decoration: InputDecoration(
                hintText: "type-message".tr,
                filled: true,
                fillColor: AppTheme.secondaryColor,
                contentPadding: EdgeInsets.all(
                  AppTheme.controlPadding,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  borderSide: BorderSide(
                    width: 1,
                    color: AppTheme.primaryColor,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
              style: TextStyle(
                height: 1.5,
              ),
              // validator: (value) => value.trim().isEmpty
              //     ? 'userNameIsReqiured'.tr
              //     : null,
            ),
          ),
        ),
      ),
    );
  }
}
