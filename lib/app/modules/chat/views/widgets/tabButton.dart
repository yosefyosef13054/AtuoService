 
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  // const TabButton({
  //   Key key,
  // }) : super(key: key);
  const TabButton({
    Key key,
    @required color,
    @required icon,
    @required text,
    @required function,
  })  : _color = color,
        _icon = icon,
        _text = text,
        _function = function,
        super(key: key);
  final _color;
  final _icon;
  final _text;
  final _function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: this._function,
      icon: Container(
        // width: 30,
        // height: 30,
        padding:EdgeInsets.all(3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white),
        child: Icon(
          this._icon,
          size: 20,
          color: this._color,
        ),
      ),
      label: Expanded(
        child: Text(
          this._text,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .apply(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: this._color,
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 15),  
        shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
      ),

    );
  }
}
