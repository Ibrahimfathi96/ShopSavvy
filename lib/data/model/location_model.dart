import 'dart:convert';

LocationMd locationMdFromJson(String str) => LocationMd.fromJson(json.decode(str));
String locationMdToJson(LocationMd data) => json.encode(data.toJson());
class LocationMd {
  LocationMd({
      this.locationId, 
      this.locationUserId, 
      this.locationName, 
      this.locationCity, 
      this.locationStreet, 
      this.locationLat, 
      this.locationLong,});

  LocationMd.fromJson(dynamic json) {
    locationId = json['location_id'];
    locationUserId = json['location_user_id'];
    locationName = json['location_name'];
    locationCity = json['location_city'];
    locationStreet = json['location_street'];
    locationLat = json['location_lat'];
    locationLong = json['location_long'];
  }
  num? locationId;
  num? locationUserId;
  String? locationName;
  String? locationCity;
  String? locationStreet;
  num? locationLat;
  num? locationLong;
LocationMd copyWith({  num? locationId,
  num? locationUserId,
  String? locationName,
  String? locationCity,
  String? locationStreet,
  num? locationLat,
  num? locationLong,
}) => LocationMd(  locationId: locationId ?? this.locationId,
  locationUserId: locationUserId ?? this.locationUserId,
  locationName: locationName ?? this.locationName,
  locationCity: locationCity ?? this.locationCity,
  locationStreet: locationStreet ?? this.locationStreet,
  locationLat: locationLat ?? this.locationLat,
  locationLong: locationLong ?? this.locationLong,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['location_id'] = locationId;
    map['location_user_id'] = locationUserId;
    map['location_name'] = locationName;
    map['location_city'] = locationCity;
    map['location_street'] = locationStreet;
    map['location_lat'] = locationLat;
    map['location_long'] = locationLong;
    return map;
  }

}