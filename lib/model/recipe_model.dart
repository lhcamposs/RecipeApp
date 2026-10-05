enum RecipeCategory { doces, salgadas, bebidas }

class Recipe {
  final String id;
  final String title;
  final String description;
  final List<String> ingredients;
  final String instructions;
  final RecipeCategory category;
  final String imageUrl; // We'll use placeholder icons for simplicity

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.instructions,
    required this.category,
    required this.imageUrl,
  });
}