class Category {
  const Category({required this.id, required this.name, this.iconAsset, this.iconURL});
  final String id;
  String get categoryId => id;
  final String name;
  final String? iconURL, iconAsset;
}
