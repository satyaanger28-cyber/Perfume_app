class Perfume {
  final String id;
  final String name;
  final String category; // e.g. Floral, Woody, Oriental, Fresh
  final double price;
  final String description;
  final List<String> notes; // fragrance notes
  final String imageAsset; // placeholder color-based image for now
  final int colorValue; // used to render a placeholder swatch/image

  const Perfume({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.notes,
    required this.imageAsset,
    required this.colorValue,
  });
}
