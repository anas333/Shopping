class Shirts {
  dynamic id;
  String shirtName;
  dynamic shirtPrice;
  String shirtDesc;
  String shirtImg;

  Shirts(
      {required this.id,
      required this.shirtName,
      required this.shirtPrice,
      required this.shirtDesc,
      required this.shirtImg});

  factory Shirts.fromJson(Map<dynamic, dynamic> json) {
    return Shirts(
        id: json['id'] as dynamic,
        shirtPrice: json['price'] as dynamic,
        shirtName: json['name'],
        shirtDesc: json['desc'] as String,
        shirtImg: json['img']);
  }
}
