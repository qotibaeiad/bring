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
      id: json['_id']?.toString() ?? '', // Convert to string
      url: json['url']?.toString() ?? '',
      desc: json['desc']?.toString() ?? '',
      price: json['price']?.toString() ?? '', // Convert to string
      category: json['category']?.toString() ?? '',
      quant: json['quant']?.toString() ?? '', // Convert to string
      shop: json['shop']?.toString() ?? '',
      time: json['time']?.toString() ?? '', // Convert to string
      location: json['location']?.toString() ?? '',
      stars: json['stars']?.toString() ?? '', // Convert to string
    );
  }
}
