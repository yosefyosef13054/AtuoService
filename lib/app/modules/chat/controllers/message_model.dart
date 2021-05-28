import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageModal {
  int id, owner, type, parent, parentType, played;
  String message, messageTime, messageDate, messageTimeOnly, voiceTime;
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  IconData plyIcon = Icons.play_arrow;
  String parentMessage;
  int readed;
  MessageModal(
      {this.id,
      this.message,
      this.type,
      this.parentMessage,
      this.assetsAudioPlayer,
      this.messageDate,
      this.plyIcon,
      this.parentType,
      this.voiceTime,
      this.messageTimeOnly,
      this.parent,
      this.played,
      this.messageTime,
      this.owner,
      this.readed});

  MessageModal.fromJson(Map<String, dynamic> map, {orderTime}) {
    this.id = map['id'];
    this.messageTime = map['messageTime'] ?? orderTime;
    this.message =
        map['message'] ?? "https://auto.wecoders.app/${map['fileURL']}";
    this.message = map['fileURL'] != null
        ? "https://auto.wecoders.app/${map['fileURL']}"
        : map['message'];
    this.messageTimeOnly = map['messageTimeOnly'];
    this.assetsAudioPlayer = map['assetsAudioPlayer'] ?? AssetsAudioPlayer();
    this.parentType = map['parentType'];
    this.messageDate = map['messageDate'];
    this.voiceTime = map['voiceTime'] ?? "";
    this.parent = map['parent'];
    this.played = map['played'];
    this.parentMessage = map['parentMessage'] == null
        ? ""
        : map['parentMessage'].toString() ?? "";
    this.type = map['type'] == null
        ? map['fileURL'].toString().contains('mp3')
            ? 3
            : 2
        : map['type'];
    this.owner = map['fileURL'] != null ? 0 : map['owner'];
    this.readed = map['readed'];
  }
}
