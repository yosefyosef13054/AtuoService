class ReplyMessageModel {
  var type, parent, owner;
  var parentMessage;
  var voiceTime;
  ReplyMessageModel({
    this.type,
    this.parentMessage,
    this.owner,
    this.voiceTime,
    this.parent,
  });

  ReplyMessageModel.fromJson(Map<String, dynamic> map) {
    this.parent = map['parent'];
    this.parentMessage = map['parentMessage'];
    this.voiceTime = map['voiceTime'];
    this.type = map['type'];
    this.owner = map['owner'];
  }
}
