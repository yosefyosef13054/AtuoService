import 'package:flutter/material.dart';

class SwiperDialog extends StatefulWidget {
  SwiperDialog(this.swiperWidget);

  Widget swiperWidget;

  @override
  _SwiperDialogState createState() => _SwiperDialogState();
}

class _SwiperDialogState extends State<SwiperDialog> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        insetPadding: MediaQuery.of(context).viewInsets +
            const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: widget.swiperWidget);
  }
}
