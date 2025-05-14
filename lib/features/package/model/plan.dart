class Plan {
  final String title;
  final String subtitle;
  final int originalPrice;
  final int discountedPrice;
  final int discountPercent;

  Plan({
    required this.title,
    required this.subtitle,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercent,
  });
}
