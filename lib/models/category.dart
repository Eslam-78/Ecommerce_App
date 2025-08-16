class Catigory {
  final int categoryId;
  final String name;
  final String description;
  final int? parentCategoryID;

  Catigory({
    required this.categoryId,
    required this.name,
    required this.description,
    this.parentCategoryID,
  });

  factory Catigory.fromJson(Map<String, dynamic> json) {
    return Catigory(
      categoryId: (json['categoryId'] as int?) ?? 0,
      name: (json['name'] as String?) ?? 'Unknown Category',
      description: (json['description'] as String?) ?? 'No description',
      parentCategoryID: json['parentCategoryID'] as int?,
    );
  }
}

List<Catigory> mockCategories = [
  Catigory(
    categoryId: 1,
    name: 'Electronics',
    description: 'All electronic and electrical devices',
  ),

  Catigory(
    categoryId: 2,
    name: 'Home Appliances',
    description: 'Appliances for home and kitchen use',
  ),
  Catigory(
    categoryId: 3,
    name: 'Personal Care',
    description: 'Beauty and personal hygiene products',
  ),
];
