import 'package:autoservice/app/modules/chat/views/widgets/bubble/widgets/messages_type/audio/position_seek_widget.dart';
import 'package:flutter/material.dart';

class AudioSlider extends StatelessWidget {
  AudioSlider(
      [this.recordTime,
      this.duration,
      this.currentPosition,
      this.buttonColor,
      this.sliderColor,
      this.seekTo]);
  Duration currentPosition, duration;
  Color sliderColor, buttonColor;
  String recordTime;
  Function seekTo;
  @override
  Widget build(BuildContext context) {
    return PositionSeekWidget(
      currentPosition: currentPosition ?? Duration(),
      sliderColor: sliderColor ?? Colors.grey[300],
      buttonColor: buttonColor ?? Colors.grey,
      recordTime: recordTime,
      duration: duration ?? Duration(),
      seekTo: (to) {
            seekTo(to);
          } ??
          (to) {},
    );
  }
}
