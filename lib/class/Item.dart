class Item {
  String id;
  String url;
  String desc;
  String price;
  String category;
  String quant;
  String shop;
  String time;
  String location;
  String stars;
  String top;

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
    required this.top,
  });

  // Method to update a specific field
  void updateField(String fieldName, dynamic value) {
    switch (fieldName) {
      case 'url':
        this.url = value;
        break;
      case 'desc':
        this.desc = value;
        break;
      case 'price':
        this.price = value.toString(); // Convert to string
        break;
      case 'category':
        this.category = value;
        break;
      case 'quant':
        this.quant = value.toString(); // Convert to string
        break;
      case 'shop':
        this.shop = value;
        break;
      case 'time':
        this.time = value.toString(); // Convert to string
        break;
      case 'location':
        this.location = value;
        break;
      case 'stars':
        this.stars = value.toString(); // Convert to string
        break;
      case 'top':
        this.top = value;
        break;
      // Add more cases for other fields as needed
    }
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['_id']?.toString() ?? '',
      url: json['url']?.toString() ?? '',
      desc: json['desc']?.toString() ?? '',
      price: json['price']?.toString() ?? '',
      category: json['category']?.toString() ?? '',
      quant: json['quant']?.toString() ?? '',
      shop: json['shop']?.toString() ?? '',
      time: json['time']?.toString() ?? '',
      location: json['location']?.toString() ?? '',
      stars: json['stars']?.toString() ?? '',
      top: json['top']?.toString() ?? '',
    );
  }
}
