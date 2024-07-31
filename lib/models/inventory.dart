class Inventory {
  final String id;
  final String itemName;
  final int quantity;

  Inventory({required this.id, required this.itemName, required this.quantity});

  // Dummy data generator
  static List<Inventory> getDummyData() {
    return List.generate(10, (index) => Inventory(
      id: '$index',
      itemName: 'Item $index',
      quantity: 10 + index * 2,
    ));
  }
}
