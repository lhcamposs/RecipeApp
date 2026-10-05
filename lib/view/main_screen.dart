import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/view/app_drawer.dart';
import 'package:recipe_app/view/recipe_detail_screen.dart';
import 'package:recipe_app/viewmodel/recipe_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final RecipeViewModel _viewModel = RecipeViewModel();

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    // Initialize pages for each tab
    _pages = [
      RecipeListTab(category: RecipeCategory.doces, viewModel: _viewModel),
      RecipeListTab(category: RecipeCategory.salgadas, viewModel: _viewModel),
      RecipeListTab(category: RecipeCategory.bebidas, viewModel: _viewModel),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receitas Favoritas'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const AppDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.cake), label: 'Doces'),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Salgadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_drink),
            label: 'Bebidas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: _onItemTapped,
      ),
    );
  }
}

class RecipeListTab extends StatelessWidget {
  final RecipeCategory category;
  final RecipeViewModel viewModel;

  const RecipeListTab({
    super.key,
    required this.category,
    required this.viewModel,
  });

  IconData _getIconForImageName(String name) {
    switch (name) {
      case 'cake':
        return Icons.cake;
      case 'icecream':
        return Icons.icecream;
      case 'cookie':
        return Icons.cookie;
      case 'local_pizza':
        return Icons.local_pizza;
      case 'restaurant':
        return Icons.restaurant;
      case 'rice_bowl':
        return Icons.rice_bowl;
      case 'local_drink':
        return Icons.local_drink;
      case 'wine_bar':
        return Icons.wine_bar;
      case 'coffee':
        return Icons.coffee;
      default:
        return Icons.fastfood;
    }
  }

  @override
  Widget build(BuildContext context) {
    final recipes = viewModel.getRecipesByCategory(category);

    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        final recipe = recipes[index];
        return Card(
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          child: InkWell(
            onTap: () {
              // Navigate to details screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailScreen(recipe: recipe),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .primaryContainer,
                    child: Icon(
                      _getIconForImageName(recipe.imageUrl),
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          recipe.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
