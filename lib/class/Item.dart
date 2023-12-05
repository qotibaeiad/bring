class Item {
  late String url;
  late String desc;
  late String price;
  late String category;
  late String quant;
  late String shop;

  // Private constructor
  Item._private();

  // Singleton instance
  static final Item _instance = Item._private();

  // Factory constructor to return the singleton instance
  factory Item() => _instance;

  // Method to set item data
  void setItemData(String url, String desc, String price, String category,
      String quant, String shop) {
    this.url = url;
    this.desc = desc;
    this.price = price;
    this.category = category;
    this.quant = quant;
    this.shop = shop;
  }

  // Method to convert the item to JSON
  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'desc': desc,
      'price': price,
      'category': category,
      'quant': quant,
      'shop': shop,
    };
  }
}
