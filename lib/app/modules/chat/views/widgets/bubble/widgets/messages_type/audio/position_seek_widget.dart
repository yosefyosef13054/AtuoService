import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PositionSeekWidget extends StatefulWidget {
  final Duration currentPosition;
  final Duration duration;
  final Function(Duration) seekTo;
  final Color sliderColor, buttonColor;
  final String recordTime;

  const PositionSeekWidget({
    @required this.currentPosition,
    @required this.recordTime,
    this.sliderColor,
    this.buttonColor,
    @required this.duration,
    @required this.seekTo,
  });

  @override
  _PositionSeekWidgetState createState() => _PositionSeekWidgetState();
}

class _PositionSeekWidgetState extends State<PositionSeekWidget> {
  Duration _visibleValue;
  bool listenOnlyUserInterraction = false;
  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(PositionSeekWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInterraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 20,
            child: Slider(
              min: 0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: percent * widget.duration.inMilliseconds.toDouble(),
              activeColor: widget.buttonColor ?? Get.theme.primaryColor,
              inactiveColor: widget.sliderColor ?? Get.theme.accentColor,
              onChangeEnd: (newValue) {
                setState(() {
                  listenOnlyUserInterraction = false;
                  widget.seekTo(_visibleValue);
                });
              },
              onChangeStart: (_) {
                setState(() {
                  // listenOnlyUserInteraction = true;
                });
              },
              onChanged: (newValue) {
                setState(() {
                  // final to = Duration(milliseconds: newValue.floor());
                  // // _visibleValue = to;
                });
              },
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  durationToString(widget.currentPosition),
                  style: Get.theme.textTheme.bodyText1
                      .copyWith(fontSize: 8, color: Get.theme.primaryColor),
                ),
              ),
              SizedBox(
                width: 40,
                child: Text(
                  durationToString(widget.duration) == "00:00"
                      ? widget.recordTime
                      : durationToString(widget.duration),
                  style: Get.theme.textTheme.bodyText1
                      .copyWith(fontSize: 8, color: Get.theme.primaryColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String durationToString(Duration duration) {
  String twoDigits(int n) {
    if (n >= 10) return "$n";
    return "0$n";
  }

  String twoDigitMinutes =
      twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
  String twoDigitSeconds =
      twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
  return "$twoDigitMinutes:$twoDigitSeconds";
}
