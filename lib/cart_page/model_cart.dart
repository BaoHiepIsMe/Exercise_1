class ItemCategory {
  final String image;
  final String name;
  final String information;
  final String select;
  ItemCategory(this.name, this.image, this.information, this.select);
}

class Item {
  final String name;
  final double price;
  final String image;
  final String category;

  Item(this.name, this.price, this.image, this.category);
}
