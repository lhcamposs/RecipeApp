import 'package:flutter/cupertino.dart';
import 'package:recipe_app/model/recipe_model.dart';

class RecipeViewModel extends ChangeNotifier {
  // Mock Data Source
  final List<Recipe> _allRecipes = [
    // Doces
    Recipe(
      id: 'd1',
      title: 'Bolo de Chocolate',
      description: 'Um bolo fofinho e cheio de chocolate.',
      ingredients: ['Farinha', 'Açúcar', 'Chocolate em pó', 'Ovos', 'Leite'],
      instructions: 'Misture os ingredientes secos, adicione os líquidos. Asse por 40 min.',
      category: RecipeCategory.doces,
      imageUrl: 'cake',
    ),
    Recipe(
      id: 'd2',
      title: 'Pudim de Leite',
      description: 'Clássico pudim de leite condensado com calda de caramelo.',
      ingredients: ['Leite condensado', 'Leite', 'Ovos', 'Açúcar para a calda'],
      instructions: 'Faça a calda. Bata os outros ingredientes no liquidificador. Asse em banho-maria.',
      category: RecipeCategory.doces,
      imageUrl: 'icecream',
    ),
    Recipe(
      id: 'd3',
      title: 'Brigadeiro',
      description: 'O doce mais amado do Brasil.',
      ingredients: [
        'Leite condensado',
        'Chocolate em pó',
        'Manteiga',
        'Granulado'
      ],
      instructions: 'Leve ao fogo até desgrudar do fundo da panela. Enrole e passe no granulado.',
      category: RecipeCategory.doces,
      imageUrl: 'cookie',
    ),

    // Salgadas
    Recipe(
      id: 's1',
      title: 'Lasanha à Bolonhesa',
      description: 'Camadas de massa, molho de carne e muito queijo.',
      ingredients: [
        'Massa de lasanha',
        'Carne moída',
        'Molho de tomate',
        'Queijo',
        'Presunto'
      ],
      instructions: 'Alterne camadas de massa, molho e queijo. Asse até dourar.',
      category: RecipeCategory.salgadas,
      imageUrl: 'local_pizza',
    ),
    Recipe(
      id: 's2',
      title: 'Frango Assado',
      description: 'Frango inteiro temperado e assado perfeitamente.',
      ingredients: [
        'Frango inteiro',
        'Alho',
        'Limão',
        'Sal',
        'Pimenta',
        'Batatas'
      ],
      instructions: 'Tempere o frango e asse com as batatas por 1 hora e meia.',
      category: RecipeCategory.salgadas,
      imageUrl: 'restaurant',
    ),
    Recipe(
      id: 's3',
      title: 'Risoto de Cogumelos',
      description: 'Arroz cremoso com cogumelos frescos e parmesão.',
      ingredients: [
        'Arroz arbóreo',
        'Cogumelos',
        'Caldo de legumes',
        'Vinho branco',
        'Parmesão'
      ],
      instructions: 'Refogue o arroz, adicione o vinho e o caldo aos poucos. Finalize com queijo.',
      category: RecipeCategory.salgadas,
      imageUrl: 'rice_bowl',
    ),

    // Bebidas
    Recipe(
      id: 'b1',
      title: 'Suco de Laranja',
      description: 'Suco natural e refrescante.',
      ingredients: ['Laranjas', 'Gelo', 'Açúcar (opcional)'],
      instructions: 'Esprema as laranjas e sirva com gelo.',
      category: RecipeCategory.bebidas,
      imageUrl: 'local_drink',
    ),
    Recipe(
      id: 'b2',
      title: 'Caipirinha',
      description: 'Drink brasileiro tradicional.',
      ingredients: ['Cachaça', 'Limão', 'Açúcar', 'Gelo'],
      instructions: 'Macere o limão com açúcar, adicione cachaça e muito gelo.',
      category: RecipeCategory.bebidas,
      imageUrl: 'wine_bar',
    ),
    Recipe(
      id: 'b3',
      title: 'Café Expresso',
      description: 'Para dar aquela energia.',
      ingredients: ['Pó de café', 'Água quente'],
      instructions: 'Passe a água quente pelo pó sob pressão.',
      category: RecipeCategory.bebidas,
      imageUrl: 'coffee',
    ),
  ];

  List<Recipe> getRecipesByCategory(RecipeCategory category) {
    return _allRecipes.where((recipe) => recipe.category == category).toList();
  }
}