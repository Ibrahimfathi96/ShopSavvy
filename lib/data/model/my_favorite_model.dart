import 'dart:convert';

MyFavoriteMd myFavoriteMdFromJson(String str) => MyFavoriteMd.fromJson(json.decode(str));
String myFavoriteMdToJson(MyFavoriteMd data) => json.encode(data.toJson());
class MyFavoriteMd {
  MyFavoriteMd({
      this.favoriteId, 
      this.favoriteUsersId, 
      this.favoriteItemsId, 
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
      this.itemsCategories, 
      this.usersId,});

  MyFavoriteMd.fromJson(dynamic json) {
    favoriteId = json['favorite_id'];
    favoriteUsersId = json['favorite_users_id'];
    favoriteItemsId = json['favorite_items_id'];
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
    usersId = json['users_id'];
  }
  num? favoriteId;
  num? favoriteUsersId;
  num? favoriteItemsId;
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
  num? usersId;
MyFavoriteMd copyWith({  num? favoriteId,
  num? favoriteUsersId,
  num? favoriteItemsId,
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
  num? usersId,
}) => MyFavoriteMd(  favoriteId: favoriteId ?? this.favoriteId,
  favoriteUsersId: favoriteUsersId ?? this.favoriteUsersId,
  favoriteItemsId: favoriteItemsId ?? this.favoriteItemsId,
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
  usersId: usersId ?? this.usersId,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['favorite_id'] = favoriteId;
    map['favorite_users_id'] = favoriteUsersId;
    map['favorite_items_id'] = favoriteItemsId;
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
    map['users_id'] = usersId;
    return map;
  }

}