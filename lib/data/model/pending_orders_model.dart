import 'dart:convert';

PendingOrdersMd pendingOrdersMdFromJson(String str) => PendingOrdersMd.fromJson(json.decode(str));
String pendingOrdersMdToJson(PendingOrdersMd data) => json.encode(data.toJson());
class PendingOrdersMd {
  PendingOrdersMd({
      this.ordersId, 
      this.ordersUserId, 
      this.ordersLocation, 
      this.ordersType, 
      this.ordersPriceDelivery, 
      this.ordersPrice, 
      this.ordersTotalPrice, 
      this.ordersCoupon, 
      this.ordersDatetime, 
      this.ordersPaymentMethod, 
      this.ordersStatus,});

  PendingOrdersMd.fromJson(dynamic json) {
    ordersId = json['orders_id'];
    ordersUserId = json['orders_user_id'];
    ordersLocation = json['orders_location'];
    ordersType = json['orders_type'];
    ordersPriceDelivery = json['orders_price_delivery'];
    ordersPrice = json['orders_price'];
    ordersTotalPrice = json['orders_total_price'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentMethod = json['orders_payment_method'];
    ordersStatus = json['orders_status'];
  }
  num? ordersId;
  num? ordersUserId;
  num? ordersLocation;
  num? ordersType;
  num? ordersPriceDelivery;
  num? ordersPrice;
  num? ordersTotalPrice;
  num? ordersCoupon;
  String? ordersDatetime;
  num? ordersPaymentMethod;
  num? ordersStatus;
PendingOrdersMd copyWith({  num? ordersId,
  num? ordersUserId,
  num? ordersLocation,
  num? ordersType,
  num? ordersPriceDelivery,
  num? ordersPrice,
  num? ordersTotalPrice,
  num? ordersCoupon,
  String? ordersDatetime,
  num? ordersPaymentMethod,
  num? ordersStatus,
}) => PendingOrdersMd(  ordersId: ordersId ?? this.ordersId,
  ordersUserId: ordersUserId ?? this.ordersUserId,
  ordersLocation: ordersLocation ?? this.ordersLocation,
  ordersType: ordersType ?? this.ordersType,
  ordersPriceDelivery: ordersPriceDelivery ?? this.ordersPriceDelivery,
  ordersPrice: ordersPrice ?? this.ordersPrice,
  ordersTotalPrice: ordersTotalPrice ?? this.ordersTotalPrice,
  ordersCoupon: ordersCoupon ?? this.ordersCoupon,
  ordersDatetime: ordersDatetime ?? this.ordersDatetime,
  ordersPaymentMethod: ordersPaymentMethod ?? this.ordersPaymentMethod,
  ordersStatus: ordersStatus ?? this.ordersStatus,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orders_id'] = ordersId;
    map['orders_user_id'] = ordersUserId;
    map['orders_location'] = ordersLocation;
    map['orders_type'] = ordersType;
    map['orders_price_delivery'] = ordersPriceDelivery;
    map['orders_price'] = ordersPrice;
    map['orders_total_price'] = ordersTotalPrice;
    map['orders_coupon'] = ordersCoupon;
    map['orders_datetime'] = ordersDatetime;
    map['orders_payment_method'] = ordersPaymentMethod;
    map['orders_status'] = ordersStatus;
    return map;
  }

}