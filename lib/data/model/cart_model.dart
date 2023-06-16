import 'dart:convert';

CartMd cartMdFromJson(String str) => CartMd.fromJson(json.decode(str));
String cartMdToJson(CartMd data) => json.encode(data.toJson());
class CartMd {
  CartMd({
      this.itemsTotalPrice,
      this.itemsTotalCount,
      this.cartId, 
      this.cartUserId, 
      this.cartItemsId, 
      this.itemsId, 
      this.itemsName, 
      this.itemsNameAr, 
      this.itemsDesc, 
      this.itemsDescAr, 
      this.itemsImage, 
      this.itemsCount, 
      this.itemsActive, 
      this.itemsPrice, 
      this.itemsDiscount, 
      this.itemsDate, 
      this.itemsCategories,});

  CartMd.fromJson(dynamic json) {
    itemsTotalPrice = json['itemsprice'];
    itemsTotalCount = json['itemscount'];
    cartId = json['cart_id'];
    cartUserId = json['cart_user_id'];
    cartItemsId = json['cart_items_id'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
  }
  num? itemsTotalPrice;
  num? itemsTotalCount;
  num? cartId;
  num? cartUserId;
  num? cartItemsId;
  num? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  num? itemsCount;
  num? itemsActive;
  num? itemsPrice;
  num? itemsDiscount;
  String? itemsDate;
  num? itemsCategories;
CartMd copyWith({  num? itemsTotalPrice,
  num? itemsTotalCount,
  num? cartId,
  num? cartUserId,
  num? cartItemsId,
  num? itemsId,
  String? itemsName,
  String? itemsNameAr,
  String? itemsDesc,
  String? itemsDescAr,
  String? itemsImage,
  num? itemsCount,
  num? itemsActive,
  num? itemsPrice,
  num? itemsDiscount,
  String? itemsDate,
  num? itemsCategories,
}) => CartMd(  itemsTotalPrice: itemsTotalPrice ?? this.itemsTotalPrice,
  itemsTotalCount: itemsTotalCount ?? this.itemsTotalCount,
  cartId: cartId ?? this.cartId,
  cartUserId: cartUserId ?? this.cartUserId,
  cartItemsId: cartItemsId ?? this.cartItemsId,
  itemsId: itemsId ?? this.itemsId,
  itemsName: itemsName ?? this.itemsName,
  itemsNameAr: itemsNameAr ?? this.itemsNameAr,
  itemsDesc: itemsDesc ?? this.itemsDesc,
  itemsDescAr: itemsDescAr ?? this.itemsDescAr,
  itemsImage: itemsImage ?? this.itemsImage,
  itemsCount: itemsCount ?? this.itemsCount,
  itemsActive: itemsActive ?? this.itemsActive,
  itemsPrice: itemsPrice ?? this.itemsPrice,
  itemsDiscount: itemsDiscount ?? this.itemsDiscount,
  itemsDate: itemsDate ?? this.itemsDate,
  itemsCategories: itemsCategories ?? this.itemsCategories,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itemsprice'] = itemsTotalPrice;
    map['itemscount'] = itemsTotalCount;
    map['cart_id'] = cartId;
    map['cart_user_id'] = cartUserId;
    map['cart_items_id'] = cartItemsId;
    map['items_id'] = itemsId;
    map['items_name'] = itemsName;
    map['items_name_ar'] = itemsNameAr;
    map['items_desc'] = itemsDesc;
    map['items_desc_ar'] = itemsDescAr;
    map['items_image'] = itemsImage;
    map['items_count'] = itemsCount;
    map['items_active'] = itemsActive;
    map['items_price'] = itemsPrice;
    map['items_discount'] = itemsDiscount;
    map['items_date'] = itemsDate;
    map['items_categories'] = itemsCategories;
    return map;
  }

}