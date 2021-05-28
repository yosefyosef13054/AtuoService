// To parse this JSON data, do
//
//     final myScrapRequests = myScrapRequestsFromJson(jsonString);

import 'dart:convert';

List<MyScrapRequests> myScrapRequestsFromJson(String str) =>
    List<MyScrapRequests>.from(
        json.decode(str).map((x) => MyScrapRequests.fromJson(x)));

String myScrapRequestsToJson(List<MyScrapRequests> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyScrapRequests {
  MyScrapRequests({
    this.id,
    this.clientId,
    this.clientName,
    this.scrapCompanyId,
    this.scrapCompanyName,
    this.regionId,
    this.regionName,
    this.locationId,
    this.locationName,
    this.carTypeId,
    this.carTypeName,
    this.modelId,
    this.modelName,
    this.carYear,
    this.orderDate,
    this.accepted,
    this.isFavorite,
    this.acceptedDate,
    this.pendingDelivery,
    this.pendingDeliveryDate,
    this.delivered,
    this.deliveredDate,
    this.canceled,
    this.canceledDate,
    this.moneyReceived,
    this.totalPrice,
    this.autoServicePercent,
    this.autoServiceTotal,
    this.companies,
    this.attachments,
    this.description,
    this.acceptedComment,
    this.clientUniqueId,
    this.companyUniqueId,
  });

  var id;
  var clientId;
  var clientName;
  var scrapCompanyId;
  var scrapCompanyName;
  var regionId;
  var regionName;
  var locationId;
  var locationName;
  var carTypeId;
  var carTypeName;
  var modelId;
  var modelName;
  var carYear;
  DateTime orderDate;
  var accepted;
  var isFavorite;
  var acceptedDate;
  var pendingDelivery;
  var pendingDeliveryDate;
  var delivered;
  var deliveredDate;
  var canceled;
  var canceledDate;
  var moneyReceived;
  var totalPrice;
  var autoServicePercent;
  var autoServiceTotal;
  var companies;
  var attachments;
  var description;
  var acceptedComment;
  var clientUniqueId;
  var companyUniqueId;

  factory MyScrapRequests.fromJson(Map<String, dynamic> json) =>
      MyScrapRequests(
        id: json["id"],
        clientId: json["clientId"],
        clientName: json["clientName"],
        scrapCompanyId: json["scrapCompanyId"],
        scrapCompanyName: json["scrapCompanyName"],
        regionId: json["regionId"] == null ? null : json["regionId"],
        regionName: json["regionName"] == null ? null : json["regionName"],
        locationId: json["locationId"] == null ? null : json["locationId"],
        locationName:
            json["locationName"] == null ? null : json["locationName"],
        carTypeId: json["carTypeId"] == null ? null : json["carTypeId"],
        carTypeName: json["carTypeName"] == null ? null : json["carTypeName"],
        modelId: json["modelId"] == null ? null : json["modelId"],
        modelName: json["modelName"] == null ? null : json["modelName"],
        carYear: json["carYear"] == null ? null : json["carYear"],
        orderDate: DateTime.parse(json["orderDate"]),
        accepted: json["accepted"],
        isFavorite: json["isFavorite"],
        acceptedDate: json["acceptedDate"],
        pendingDelivery: json["pendingDelivery"],
        pendingDeliveryDate: json["pendingDeliveryDate"],
        delivered: json["delivered"],
        deliveredDate: json["deliveredDate"],
        canceled: json["canceled"],
        canceledDate: json["canceledDate"],
        moneyReceived: json["moneyReceived"],
        totalPrice: json["totalPrice"],
        autoServicePercent: json["autoServicePercent"],
        autoServiceTotal: json["autoServiceTotal"],
        companies: json["companies"],
        attachments: json["attachments"],
        description: json["description"] == null ? null : json["description"],
        acceptedComment: json["acceptedComment"],
        clientUniqueId: json["clientUniqueId"],
        companyUniqueId: json["companyUniqueId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "clientName": clientName,
        "scrapCompanyId": scrapCompanyId,
        "scrapCompanyName": scrapCompanyName,
        "regionId": regionId == null ? null : regionId,
        "regionName": regionName == null ? null : regionName,
        "locationId": locationId == null ? null : locationId,
        "locationName": locationName == null ? null : locationName,
        "carTypeId": carTypeId == null ? null : carTypeId,
        "carTypeName": carTypeName == null ? null : carTypeName,
        "modelId": modelId == null ? null : modelId,
        "modelName": modelName == null ? null : modelName,
        "carYear": carYear == null ? null : carYear,
        "orderDate": orderDate.toIso8601String(),
        "accepted": accepted,
        "isFavorite": isFavorite,
        "acceptedDate": acceptedDate,
        "pendingDelivery": pendingDelivery,
        "pendingDeliveryDate": pendingDeliveryDate,
        "delivered": delivered,
        "deliveredDate": deliveredDate,
        "canceled": canceled,
        "canceledDate": canceledDate,
        "moneyReceived": moneyReceived,
        "totalPrice": totalPrice,
        "autoServicePercent": autoServicePercent,
        "autoServiceTotal": autoServiceTotal,
        "companies": companies,
        "attachments": attachments,
        "description": description == null ? null : description,
        "acceptedComment": acceptedComment,
        "clientUniqueId": clientUniqueId,
        "companyUniqueId": companyUniqueId,
      };
}

// To parse this JSON data, do
//
//     final garages = garagesFromJson(jsonString);

Garages garagesFromJson(String str) => Garages.fromJson(json.decode(str));

String garagesToJson(Garages data) => json.encode(data.toJson());

class Garages {
  Garages({
    this.id,
    this.clientId,
    this.clientName,
    this.clientFcmToken,
    this.scrapCompanyId,
    this.scrapCompanyName,
    this.regionId,
    this.regionName,
    this.locationId,
    this.locationName,
    this.carTypeId,
    this.carTypeName,
    this.modelId,
    this.modelName,
    this.carYear,
    this.orderDate,
    this.accepted,
    this.isFavorite,
    this.acceptedDate,
    this.pendingDelivery,
    this.pendingDeliveryDate,
    this.delivered,
    this.deliveredDate,
    this.canceled,
    this.canceledDate,
    this.moneyReceived,
    this.totalPrice,
    this.autoServicePercent,
    this.autoServiceTotal,
    this.companies,
    this.attachments,
    this.description,
    this.acceptedComment,
    this.clientUniqueId,
    this.companyUniqueId,
  });

  int id;
  int clientId;
  String clientName;
  String clientFcmToken;
  int scrapCompanyId;
  String scrapCompanyName;
  int regionId;
  String regionName;
  int locationId;
  String locationName;
  int carTypeId;
  String carTypeName;
  int modelId;
  String modelName;
  int carYear;
  DateTime orderDate;
  bool accepted;
  dynamic isFavorite;
  DateTime acceptedDate;
  dynamic pendingDelivery;
  dynamic pendingDeliveryDate;
  dynamic delivered;
  dynamic deliveredDate;
  dynamic canceled;
  dynamic canceledDate;
  dynamic moneyReceived;
  int totalPrice;
  dynamic autoServicePercent;
  dynamic autoServiceTotal;
  List<Company> companies;
  List<Attachment> attachments;
  String description;
  String acceptedComment;
  String clientUniqueId;
  String companyUniqueId;

  factory Garages.fromJson(Map<String, dynamic> json) => Garages(
        id: json["id"],
        clientId: json["clientId"],
        clientName: json["clientName"],
        clientFcmToken: json["clientFCMToken"],
        scrapCompanyId: json["scrapCompanyId"],
        scrapCompanyName: json["scrapCompanyName"],
        regionId: json["regionId"],
        regionName: json["regionName"],
        locationId: json["locationId"],
        locationName: json["locationName"],
        carTypeId: json["carTypeId"],
        carTypeName: json["carTypeName"],
        modelId: json["modelId"],
        modelName: json["modelName"],
        carYear: json["carYear"],
        orderDate: DateTime.parse(json["orderDate"]),
        accepted: json["accepted"],
        isFavorite: json["isFavorite"],
        acceptedDate: DateTime.parse(json["acceptedDate"]),
        pendingDelivery: json["pendingDelivery"],
        pendingDeliveryDate: json["pendingDeliveryDate"],
        delivered: json["delivered"],
        deliveredDate: json["deliveredDate"],
        canceled: json["canceled"],
        canceledDate: json["canceledDate"],
        moneyReceived: json["moneyReceived"],
        totalPrice: json["totalPrice"],
        autoServicePercent: json["autoServicePercent"],
        autoServiceTotal: json["autoServiceTotal"],
        companies: List<Company>.from(
            json["companies"].map((x) => Company.fromJson(x))),
        attachments: List<Attachment>.from(
            json["attachments"].map((x) => Attachment.fromJson(x))),
        description: json["description"],
        acceptedComment: json["acceptedComment"],
        clientUniqueId: json["clientUniqueId"],
        companyUniqueId: json["companyUniqueId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "clientName": clientName,
        "clientFCMToken": clientFcmToken,
        "scrapCompanyId": scrapCompanyId,
        "scrapCompanyName": scrapCompanyName,
        "regionId": regionId,
        "regionName": regionName,
        "locationId": locationId,
        "locationName": locationName,
        "carTypeId": carTypeId,
        "carTypeName": carTypeName,
        "modelId": modelId,
        "modelName": modelName,
        "carYear": carYear,
        "orderDate": orderDate.toIso8601String(),
        "accepted": accepted,
        "isFavorite": isFavorite,
        "acceptedDate": acceptedDate.toIso8601String(),
        "pendingDelivery": pendingDelivery,
        "pendingDeliveryDate": pendingDeliveryDate,
        "delivered": delivered,
        "deliveredDate": deliveredDate,
        "canceled": canceled,
        "canceledDate": canceledDate,
        "moneyReceived": moneyReceived,
        "totalPrice": totalPrice,
        "autoServicePercent": autoServicePercent,
        "autoServiceTotal": autoServiceTotal,
        "companies": List<dynamic>.from(companies.map((x) => x.toJson())),
        "attachments": List<dynamic>.from(attachments.map((x) => x.toJson())),
        "description": description,
        "acceptedComment": acceptedComment,
        "clientUniqueId": clientUniqueId,
        "companyUniqueId": companyUniqueId,
      };
}

class Attachment {
  Attachment({
    this.id,
    this.fileName,
    this.orderId,
    this.orderName,
    this.fileUrl,
  });

  int id;
  String fileName;
  int orderId;
  dynamic orderName;
  String fileUrl;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
        id: json["id"],
        fileName: json["fileName"],
        orderId: json["orderId"],
        orderName: json["orderName"],
        fileUrl: json["fileURL"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fileName": fileName,
        "orderId": orderId,
        "orderName": orderName,
        "fileURL": fileUrl,
      };
}

class Company {
  Company({
    this.id,
    this.scrapLocationId,
    this.orderId,
    this.companyUniqueId,
    this.companyFcmToken,
    this.scrapLocationName,
    this.userId,
    this.lastModifiedDate,
    this.userName,
    this.companyNameEn,
    this.companyNameAr,
    this.companyName,
    this.arrange,
    this.commotionPercent,
    this.smsPhone,
    this.phone,
    this.status,
    this.imageUrl,
    this.createdDate,
    this.userAccount,
    this.specialties,
    this.companyChat,
    this.models,
  });

  var id;
  var scrapLocationId;
  var orderId;
  var companyUniqueId;
  var companyFcmToken;
  var scrapLocationName;
  var userId;
  var lastModifiedDate;
  var userName;
  var companyNameEn;
  var companyNameAr;
  var companyName;
  var arrange;
  var commotionPercent;
  var smsPhone;
  var phone;
  var status;
  var imageUrl;
  var createdDate;
  var userAccount;
  var specialties;
  var models;
  CompanyChat companyChat;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        scrapLocationId: json["scrapLocationId"],
        orderId: json["orderId"],
        companyUniqueId: json["companyUniqueId"],
        companyFcmToken: json["companyFCMToken"],
        scrapLocationName: json["scrapLocationName"],
        userId: json["userId"],
        lastModifiedDate: DateTime.parse(json["lastModifiedDate"]),
        userName: json["userName"],
        companyNameEn: json["companyNameEn"],
        companyNameAr: json["companyNameAr"],
        companyName: json["companyName"],
        arrange: json["arrange"],
        commotionPercent: json["commotionPercent"],
        smsPhone: json["smsPhone"],
        phone: json["phone"],
        status: json["status"],
        imageUrl: json["imageURL"],
        createdDate: DateTime.parse(json["createdDate"]),
        userAccount: json["userAccount"],
        specialties: json["specialties"],
        models: json["models"],
        companyChat: CompanyChat.fromJson(json["chat"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "scrapLocationId": scrapLocationId,
        "orderId": orderId,
        "companyUniqueId": companyUniqueId,
        "companyFCMToken": companyFcmToken,
        "scrapLocationName": scrapLocationName,
        "userId": userId,
        "lastModifiedDate": lastModifiedDate.toIso8601String(),
        "userName": userName,
        "companyNameEn": companyNameEn,
        "companyNameAr": companyNameAr,
        "companyName": companyName,
        "arrange": arrange,
        "commotionPercent": commotionPercent,
        "smsPhone": smsPhone,
        "phone": phone,
        "status": status,
        "imageURL": imageUrl,
        "createdDate": createdDate.toIso8601String(),
        "userAccount": userAccount,
        "specialties": specialties,
        "models": models,
      };
}


class CompanyChat {
  CompanyChat({
    this.id,
    this.orderId,
    this.clientId,
    this.clientName,
    this.companyId,
    this.companyName,
    this.lastSender,
    this.readed,
    this.lastCall,
    this.answered,
    this.channelName,
    this.chatId,
  });

  int id;
  int orderId;
  int clientId;
  String clientName;
  int companyId;
  String companyName;
  String lastSender;
  int readed;
  dynamic lastCall;
  dynamic answered;
  dynamic channelName;
  String chatId;

  factory CompanyChat.fromJson(Map<String, dynamic> json) => CompanyChat(
    id: json["id"],
    orderId: json["orderId"],
    clientId: json["clientId"],
    clientName: json["clientName"],
    companyId: json["companyId"],
    companyName: json["companyName"],
    lastSender: json["lastSender"],
    readed: json["readed"],
    lastCall: json["lastCall"],
    answered: json["answered"],
    channelName: json["channelName"],
    chatId: json["chatId"],
  );

}
