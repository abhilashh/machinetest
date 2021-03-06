
class HomeModel {
  HomeModel({
    this.status,
    this.homeData,
  });

  bool? status;
  List<HomeDatum>? homeData;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    status: json["status"],
    homeData: List<HomeDatum>.from(json["homeData"].map((x) => HomeDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "homeData": List<dynamic>.from(homeData!.map((x) => x.toJson())),
  };
}

class HomeDatum {
  HomeDatum({
    this.type,
    this.values,
  });

  String? type;
  List<Value>? values;

  factory HomeDatum.fromJson(Map<String, dynamic> json) => HomeDatum(
    type: json["type"],
    values: List<Value>.from(json["values"].map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "values": List<dynamic>.from(values!.map((x) => x.toJson())),
  };
}

class Value {
  Value({
    this.id,
    this.name,
    this.imageUrl,
    this.bannerUrl,
    this.image,
    this.actualPrice,
    this.offerPrice,
    this.offer,
    this.isExpress,
  });

  int? id;
  String? name;
  String? imageUrl;
  String? bannerUrl;
  String? image;
  String? actualPrice;
  String? offerPrice;
  int? offer;
  bool? isExpress;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    id: json["id"],
    name: json["name"] == null ? null : json["name"],
    imageUrl: json["image_url"] == null ? null : json["image_url"],
    bannerUrl: json["banner_url"] == null ? null : json["banner_url"],
    image: json["image"] == null ? null : json["image"],
    actualPrice: json["actual_price"] == null ? null : json["actual_price"],
    offerPrice: json["offer_price"] == null ? null : json["offer_price"],
    offer: json["offer"] == null ? null : json["offer"],
    isExpress: json["is_express"] == null ? null : json["is_express"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name == null ? null : name,
    "image_url": imageUrl == null ? null : imageUrl,
    "banner_url": bannerUrl == null ? null : bannerUrl,
    "image": image == null ? null : image,
    "actual_price": actualPrice == null ? null : actualPrice,
    "offer_price": offerPrice == null ? null : offerPrice,
    "offer": offer == null ? null : offer,
    "is_express": isExpress == null ? null : isExpress,
  };
}
