import 'dart:ui';
import 'package:autoservice/app/Colors.dart';
import 'package:autoservice/app/widgets/inputs/CarPriceInput.dart';
import 'package:flutter/material.dart';

class FirstTimeForm extends StatefulWidget {
  const FirstTimeForm({
    Key key,
    @required this.width,
    @required this.selecteditem1,
    @required this.controller1,
  }) : super(key: key);

  final double width;
  final String selecteditem1;
  final TextEditingController controller1;

  @override
  _FirstTimeFormState createState() => _FirstTimeFormState();
}

class _FirstTimeFormState extends State<FirstTimeForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Container(
          width: widget.width * .9,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/icons/Ta2min/Ta3min(1).png',
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'صنع السيارة',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                      color: AppColors.primaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: widget.width * 0.25,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                    child: Center(
                      child: Text(
                        'آسيوي',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.whiteColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: widget.width * 0.25,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                    child: Center(
                      child: Text(
                        'أمريكي',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: widget.width * 0.25,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primaryColor),
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                    child: Center(
                      child: Text(
                        'أوروبي',
                        textScaleFactor: 1,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cairo',
                            color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        ),
        Container(
          width: widget.width * .9,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      'النوع',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: widget.width * 0.25,
                            margin: EdgeInsets.all(10),
                            child: Container(
                              width: widget.width * 0.25,
                              child: Center(
                                child: new DropdownButton<String>(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                  value: 'اختر',
                                  items: <String>['A', 'اختر', 'C', 'D']
                                      .map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(
                                        child: new Text(
                                          value,
                                          textScaleFactor: 1,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cairo',
                                              color: AppColors.primaryColor),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    // setState(() {
                                    //   widget.selecteditem1 = value;
                                    // });

                                    // print(widget.selecteditem1);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'الموديل',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: AppColors.primaryColor),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.all(10),
                            width: widget.width * .25,
                            child: Center(
                              child: new DropdownButton<String>(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                                value: 'اختر',
                                items: <String>['A', 'اختر', 'C', 'D']
                                    .map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: Center(
                                      child: new Text(
                                        value,
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Cairo',
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  // setState(() {
                                  //   widget.selecteditem1 = value;
                                  // });

                                  // print(widget.selecteditem1);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/icons/Ta2min/Ta3min(7).png',
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'سنة الصنع',
                  textScaleFactor: 1,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Cairo',
                      color: AppColors.primaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 33,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    width: 60,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primaryColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Container(
                        child: Text(
                          '2019',
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Cairo',
                              color: AppColors.primaryColor),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
        Container(
          width: widget.width * .9,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/icons/Ta2min/Ta3min(10).png',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'السعر التقريبي للسيارة',
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: widget.width * .8,
                child: CarPriceInput(
                    lines: 1,
                    controller: widget.controller1,
                    label: '',
                    type: TextInputType.number),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
        Container(
          width: widget.width * .9,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/icons/Ta2min/Ta3min(9).png',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    'إضافة خدمات للوثيقة',
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cairo',
                        color: AppColors.primaryColor),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Container(
                width: widget.width * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  child: Center(
                    child: Text(
                      'عدم حق الرجوع',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: widget.width * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  child: Center(
                    child: Text(
                      'خدمة الطريق',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: widget.width * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryColor),
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(25)),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                  child: Center(
                    child: Text(
                      'سيارة بديلة',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: AppColors.primaryColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: widget.width * .9,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(7),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/icons/Ta2min/Ta3min(2).png',
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      'هل توجد إضافات أخرى على السيارة ؟',
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Cairo',
                          color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: widget.width * .8,
                child: CarPriceInput(
                    lines: 4,
                    controller: widget.controller1,
                    label: '',
                    type: TextInputType.number),
              ),
              SizedBox(height: 30)
            ],
          ),
        ),
        Container(
          height: 10,
          margin: EdgeInsets.symmetric(vertical: 30),
        )
      ],
    );
  }
}
// new DropdownButton<String>(
//   items: <String>['A', 'B', 'C', 'D'].map((String value) {
//     return new DropdownMenuItem<String>(
//       value: value,
//       child: new Text(value),
//     );
//   }).toList(),
//   onChanged: (_) {},
// )
