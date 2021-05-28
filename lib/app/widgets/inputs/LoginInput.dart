import 'package:autoservice/app/Colors.dart';

import 'package:flutter/material.dart';

class ProfileInput extends StatelessWidget {
  TextEditingController controller;
  IconData icon;
  String label;
  Function validator;
  Function submit;
  TextInputAction action;
  TextInputType type;
  bool secure;
  bool enabled;
  String errorText;
  String image;
  int lines;
  var suffixIcon;
  ProfileInput({
    Key key,
    @required this.controller,
    this.icon,
    this.image,
    @required this.label,
    @required this.type,
    this.validator,
    this.action,
    this.secure = false,
    this.submit,
    this.errorText,
    this.lines = 1,
    this.suffixIcon,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child: Theme(
        data: ThemeData(primaryColor: AppColors.whiteColor),
        child: TextFormField(
          enabled: enabled,
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: "Moderat",
              fontWeight: FontWeight.w500),
          controller: controller,
          keyboardType: type,
          validator: validator,
          obscureText: secure,
          maxLines: lines,
          cursorWidth: 2,
          cursorColor: Colors.grey,
          cursorRadius: Radius.circular(1),
          textInputAction: action,
          onFieldSubmitted: (v) => submit(),
          decoration: InputDecoration(
              suffixIcon: suffixIcon,
              // border: OutlineInputBorder(
              //   borderRadius: const BorderRadius.all(
              //     Radius.circular(5.0),
              //   ),

              // ),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              filled: true,
              fillColor: AppColors.whiteColor,
              errorText: errorText,
              labelText: label,
              labelStyle: TextStyle(
                color: AppColors.secondaryText,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
              // prefixIcon: ClipOval(child: Image.asset(image)),
              // icon != null ? Icon(icon, color: Colors.blue) : null,
              contentPadding: EdgeInsets.all(10)),
        ),
      ),
    );
  }
}
