class Item {
  late String url;
  late String desc;
  late String price;
  late String category;
  late String quant;
  late String shop;

  // Public constructor
  Item();

  // Factory constructor to create an Item object from JSON
  factory Item.fromJson(Map<String, dynamic> json) {
    Item item = Item();
    item.url = json['url'];
    item.desc = json['desc'];
    item.price = json['price'];
    item.category = json['category'];
    item.quant = json['quant'];
    item.shop = json['shop'];
    return item;
  }

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
