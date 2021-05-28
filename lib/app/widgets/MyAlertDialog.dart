import 'package:flutter/material.dart';

class SucsessDialog extends StatelessWidget {
  const SucsessDialog({
    Key key,
    @required this.label,
    this.error = false,
  }) : super(key: key);

  final bool error;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            height: 140,
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(13),
                    bottomLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                    bottomRight: Radius.circular(13))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            error == true ? 'Something Wrong' : "Success!",
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: error == true
                                    ? Colors.red
                                    : Color.fromRGBO(85, 127, 219, 1),
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            label,
                            textScaleFactor: 1,
                            style: TextStyle(
                                color: Color.fromRGBO(139, 139, 139, 1),
                                fontWeight: FontWeight.w500,
                                fontSize: 12),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              iconSize: 15,
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
