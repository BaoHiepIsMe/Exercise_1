class ItemCategory {
  final String image;
  final String name;
  final String information;
  final String select;
  ItemCategory(this.image,this.name,  this.information, this.select);
}

class Item {
  final String name;
  final String image;
  final double price;
  final String category;

  Item(this.name, this.image ,this.price, this.category);
   @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          price == other.price &&
          image == other.image &&
          category == other.category;

  @override
  int get hashCode =>
      name.hashCode ^ price.hashCode ^ image.hashCode ^ category.hashCode;
}
