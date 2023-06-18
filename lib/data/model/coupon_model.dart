import 'dart:convert';

CouponMd couponMdFromJson(String str) => CouponMd.fromJson(json.decode(str));
String couponMdToJson(CouponMd data) => json.encode(data.toJson());
class CouponMd {
  CouponMd({
      this.couponId, 
      this.couponName, 
      this.couponCount, 
      this.couponExpired, 
      this.couponDiscount,});

  CouponMd.fromJson(dynamic json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponExpired = json['coupon_expired'];
    couponDiscount = json['coupon_discount'];
  }
  num? couponId;
  String? couponName;
  num? couponCount;
  String? couponExpired;
  num? couponDiscount;
CouponMd copyWith({  num? couponId,
  String? couponName,
  num? couponCount,
  String? couponExpired,
  num? couponDiscount,
}) => CouponMd(  couponId: couponId ?? this.couponId,
  couponName: couponName ?? this.couponName,
  couponCount: couponCount ?? this.couponCount,
  couponExpired: couponExpired ?? this.couponExpired,
  couponDiscount: couponDiscount ?? this.couponDiscount,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['coupon_id'] = couponId;
    map['coupon_name'] = couponName;
    map['coupon_count'] = couponCount;
    map['coupon_expired'] = couponExpired;
    map['coupon_discount'] = couponDiscount;
    return map;
  }

}