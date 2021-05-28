import 'package:autoservice/app/Colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AccessoriesInput extends StatelessWidget {
  TextEditingController controller;
  IconData icon;
  String label;
  Function validator;
  Function submit;
  TextInputAction action;
  TextInputType type;
  bool secure;
  String errorText;
  String image;
  int lines;
  FocusNode focusNode;
  AccessoriesInput(
      {Key key,
      this.focusNode,
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
      this.lines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5),
      child: Theme(
        data: ThemeData(primaryColor: AppColors.whiteColor),
        child: TextFormField(
          focusNode: focusNode,
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
          inputFormatters: type == TextInputType.number
              ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
              : [],
          decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                  const Radius.circular(5.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(5),
              ),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              filled: true,
              fillColor: Color.fromRGBO(233, 236, 242, 1),
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
