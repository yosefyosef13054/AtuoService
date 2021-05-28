// To parse this JSON data, do
//
//     final myOrders = myOrdersFromJson(jsonString);

import 'dart:convert';

List<MyOrders> myOrdersFromJson(String str) =>
    List<MyOrders>.from(json.decode(str).map((x) => MyOrders.fromJson(x)));

String myOrdersToJson(List<MyOrders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyOrders {
  MyOrders({
    this.id,
    this.clientId,
    this.clientName,
    this.clientPhone,
    this.orderDate,
    this.paymentTypeId,
    this.paymentTypeName,
    this.paymentDate,
    this.startDate,
    this.finishDate,
    this.createdDate,
    this.areaName,
    this.finished,
    this.status,
    this.addressId,
    this.addressName,
    this.myFatoorahId,
    this.apiInvoiceId,
    this.apiPaymentDate,
    this.myFatoorahUrl,
    this.companyId,
    this.companyName,
    this.acceptedByCompany,
    this.couponCode,
    this.acceptedDate,
    this.finishedByCompany,
    this.finishedDate,
    this.timeId,
    this.timeName,
    this.orderDetails,
    this.addons,
    this.orderDetailsIDs,
    this.addonsIDs,
    this.balance,
    this.discount,
    this.totalCost,
    this.couponId,
  });

  var id;
  var clientId;
  var clientName;
  var clientPhone;
  var orderDate;
  var paymentTypeId;
  var paymentTypeName;
  var paymentDate;
  var startDate;
  var finishDate;
  var createdDate;
  var areaName;
  var finished;
  var status;
  var addressId;
  var addressName;
  var myFatoorahId;
  var apiInvoiceId;
  var apiPaymentDate;
  var myFatoorahUrl;
  var companyId;
  var companyName;
  var acceptedByCompany;
  var couponCode;
  var acceptedDate;
  var finishedByCompany;
  var finishedDate;
  var timeId;
  var timeName;
  List<Addon> orderDetails;
  List<Addon> addons;
  var orderDetailsIDs;
  var addonsIDs;
  var balance;
  var discount;
  var totalCost;
  var couponId;

  factory MyOrders.fromJson(Map<String, dynamic> json) => MyOrders(
        id: json["id"],
        clientId: json["clientId"],
        clientName: json["clientName"],
        clientPhone: json["clientPhone"],
        orderDate: DateTime.parse(json["orderDate"]),
        paymentTypeId: json["paymentTypeId"],
        paymentTypeName: json["paymentTypeName"],
        paymentDate: json["paymentDate"],
        startDate: DateTime.parse(json["startDate"]),
        finishDate: DateTime.parse(json["finishDate"]),
        createdDate: DateTime.parse(json["createdDate"]),
        areaName: json["areaName"],
        finished: json["finished"],
        status: json["status"],
        addressId: json["addressId"],
        addressName: json["addressName"],
        myFatoorahId:
            json["myFatoorahId"] == null ? null : json["myFatoorahId"],
        apiInvoiceId: json["apiInvoiceId"],
        apiPaymentDate: json["apiPaymentDate"] == null
            ? null
            : DateTime.parse(json["apiPaymentDate"]),
        myFatoorahUrl:
            json["myFatoorahURL"] == null ? null : json["myFatoorahURL"],
        companyId: json["companyId"],
        companyName: json["companyName"],
        acceptedByCompany: json["acceptedByCompany"],
        couponCode: json["couponCode"],
        acceptedDate: json["acceptedDate"],
        finishedByCompany: json["finishedByCompany"],
        finishedDate: json["finishedDate"],
        timeId: json["timeId"],
        timeName: json["timeName"],
        orderDetails: List<Addon>.from(
            json["orderDetails"].map((x) => Addon.fromJson(x))),
        addons: List<Addon>.from(json["addons"].map((x) => Addon.fromJson(x))),
        orderDetailsIDs: json["orderDetailsIDs"],
        addonsIDs: json["addonsIDs"],
        balance: json["balance"],
        discount: json["discount"],
        totalCost: json["totalCost"],
        couponId: json["couponId"] == null ? null : json["couponId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "clientName": clientName,
        "clientPhone": clientPhone,
        "orderDate": orderDate.toIso8601String(),
        "paymentTypeId": paymentTypeId,
        "paymentTypeName": paymentTypeName,
        "paymentDate": paymentDate,
        "startDate": startDate.toIso8601String(),
        "finishDate": finishDate.toIso8601String(),
        "createdDate": createdDate.toIso8601String(),
        "areaName": areaName,
        "finished": finished,
        "status": status,
        "addressId": addressId,
        "addressName": addressName,
        "myFatoorahId": myFatoorahId == null ? null : myFatoorahId,
        "apiInvoiceId": apiInvoiceId,
        "apiPaymentDate":
            apiPaymentDate == null ? null : apiPaymentDate.toIso8601String(),
        "myFatoorahURL": myFatoorahUrl == null ? null : myFatoorahUrl,
        "companyId": companyId,
        "companyName": companyName,
        "acceptedByCompany": acceptedByCompany,
        "couponCode": couponCode,
        "acceptedDate": acceptedDate,
        "finishedByCompany": finishedByCompany,
        "finishedDate": finishedDate,
        "timeId": timeId,
        "timeName": timeName,
        "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
        "addons": List<dynamic>.from(addons.map((x) => x.toJson())),
        "orderDetailsIDs": orderDetailsIDs,
        "addonsIDs": addonsIDs,
        "balance": balance,
        "discount": discount,
        "totalCost": totalCost,
        "couponId": couponId == null ? null : couponId,
      };
}

class Addon {
  Addon({
    this.id,
    this.orderId,
    this.orderName,
    this.serviceId,
    this.serviceName,
    this.unitPrice,
    this.quantity,
    this.total,
  });

  var id;
  var orderId;
  var orderName;
  var serviceId;
  var serviceName;
  var unitPrice;
  var quantity;
  var total;

  factory Addon.fromJson(Map<String, dynamic> json) => Addon(
        id: json["id"],
        orderId: json["orderId"],
        orderName: json["orderName"],
        serviceId: json["serviceId"],
        serviceName: json["serviceName"],
        unitPrice: json["unitPrice"],
        quantity: json["quantity"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderId": orderId,
        "orderName": orderName,
        "serviceId": serviceId,
        "serviceName": serviceName,
        "unitPrice": unitPrice,
        "quantity": quantity,
        "total": total,
      };
}

// To parse this JSON data, do
//
//     final cartOrder = cartOrderFromJson(jsonString);

List<CartOrder> cartOrderFromJson(String str) =>
    List<CartOrder>.from(json.decode(str).map((x) => CartOrder.fromJson(x)));

String cartOrderToJson(List<CartOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartOrder {
  CartOrder({
    this.id,
    this.clientId,
    this.clientName,
    this.phone,
    this.companyId,
    this.companyName,
    this.areaName,
    this.paymentTypeId,
    this.couponId,
    this.paymentTypeCode,
    this.paymentTypeName,
    this.orderDate,
    this.sendPayment,
    this.payed,
    this.myFatoorahId,
    this.myFatoorahUrl,
    this.apiInvoiceId,
    this.apiPaymentDate,
    this.canceled,
    this.totalCost,
    this.payment,
    this.deliveryCharge,
    this.balance,
    this.notes,
    this.discount,
    this.addressId,
    this.addressName,
    this.cancelComment,
    this.orderDetails,
  });

  var id;
  var clientId;
  var clientName;
  var phone;
  var companyId;
  var companyName;
  var areaName;
  var paymentTypeId;
  var couponId;
  var paymentTypeCode;
  var paymentTypeName;
  var orderDate;
  var sendPayment;
  var payed;
  var myFatoorahId;
  var myFatoorahUrl;
  var apiInvoiceId;
  var apiPaymentDate;
  var canceled;
  var totalCost;
  var payment;
  var deliveryCharge;
  var balance;
  var notes;
  var discount;
  var addressId;
  var addressName;
  var cancelComment;
  List<OrderCartDetail> orderDetails;

  factory CartOrder.fromJson(Map<String, dynamic> json) => CartOrder(
        id: json["id"],
        clientId: json["clientId"],
        clientName: json["clientName"],
        phone: json["phone"],
        companyId: json["companyId"],
        companyName: json["companyName"],
        areaName: json["areaName"],
        paymentTypeId: json["paymentTypeId"],
        couponId: json["couponId"] == null ? null : json["couponId"],
        paymentTypeCode: json["paymentTypeCode"],
        paymentTypeName: json["paymentTypeName"],
        orderDate: DateTime.parse(json["orderDate"]),
        sendPayment: json["sendPayment"],
        payed: json["payed"],
        myFatoorahId: json["myFatoorahId"],
        myFatoorahUrl: json["myFatoorahURL"],
        apiInvoiceId: json["apiInvoiceId"],
        apiPaymentDate: json["apiPaymentDate"],
        canceled: json["canceled"],
        totalCost: json["totalCost"].toDouble(),
        payment: json["payment"],
        deliveryCharge: json["deliveryCharge"],
        balance: json["balance"].toDouble(),
        notes: json["notes"],
        discount: json["discount"] == null ? null : json["discount"].toDouble(),
        addressId: json["addressId"],
        addressName: json["addressName"],
        cancelComment: json["cancelComment"],
        orderDetails: List<OrderCartDetail>.from(
            json["orderDetails"].map((x) => OrderCartDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "clientId": clientId,
        "clientName": clientName,
        "phone": phone,
        "companyId": companyId,
        "companyName": companyName,
        "areaName": areaName,
        "paymentTypeId": paymentTypeId,
        "couponId": couponId == null ? null : couponId,
        "paymentTypeCode": paymentTypeCode,
        "paymentTypeName": paymentTypeName,
        "orderDate": orderDate.toIso8601String(),
        "sendPayment": sendPayment,
        "payed": payed,
        "myFatoorahId": myFatoorahId,
        "myFatoorahURL": myFatoorahUrl,
        "apiInvoiceId": apiInvoiceId,
        "apiPaymentDate": apiPaymentDate,
        "canceled": canceled,
        "totalCost": totalCost,
        "payment": payment,
        "deliveryCharge": deliveryCharge,
        "balance": balance,
        "notes": notes,
        "discount": discount == null ? null : discount,
        "addressId": addressId,
        "addressName": addressName,
        "cancelComment": cancelComment,
        "orderDetails": List<dynamic>.from(orderDetails.map((x) => x.toJson())),
      };
}

class OrderCartDetail {
  OrderCartDetail({
    this.id,
    this.orderId,
    this.orderName,
    this.imageUrl,
    this.productId,
    this.productName,
    this.companyId,
    this.companyName,
    this.unitPrice,
    this.quantity,
    this.total,
    this.notes,
  });

  var id;
  var orderId;
  var orderName;
  var imageUrl;
  var productId;
  var productName;
  var companyId;
  var companyName;
  var unitPrice;
  var quantity;
  var total;
  var notes;

  factory OrderCartDetail.fromJson(Map<String, dynamic> json) =>
      OrderCartDetail(
        id: json["id"],
        orderId: json["orderId"],
        orderName: json["orderName"],
        imageUrl: json["imageURL"],
        productId: json["productId"],
        productName: json["productName"],
        companyId: json["companyId"],
        companyName: json["companyName"],
        unitPrice: json["unitPrice"].toDouble(),
        quantity: json["quantity"],
        total: json["total"].toDouble(),
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "orderId": orderId,
        "orderName": orderName,
        "imageURL": imageUrl,
        "productId": productId,
        "productName": productName,
        "companyId": companyId,
        "companyName": companyName,
        "unitPrice": unitPrice,
        "quantity": quantity,
        "total": total,
        "notes": notes,
      };
}
