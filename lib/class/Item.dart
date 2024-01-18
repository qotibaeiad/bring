class Item {
  final String id;
  final String url;
  final String desc;
  final String price;
  final String category;
  final String quant;
  final String shop;
  final String time;
  final String location;
  final String stars;

  Item({
    required this.id,
    required this.url,
    required this.desc,
    required this.price,
    required this.category,
    required this.quant,
    required this.shop,
    required this.time,
    required this.location,
    required this.stars,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id'] ?? '',
      url: json['url'] ?? '',
      desc: json['desc'] ?? '',
      price: json['price'] ?? '',
      category: json['category'] ?? '',
      quant: json['quant'] ?? '',
      shop: json['shop'] ?? '',
      time: json['time'] ?? '',
      location: json['location'] ?? '',
      stars: json['stars'] ?? '',
    );
  }
}
