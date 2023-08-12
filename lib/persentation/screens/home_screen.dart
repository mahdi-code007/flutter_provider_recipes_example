import 'package:flutter/material.dart';
import 'package:flutter_provider_example/persentation/provider/recipe_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.restaurant_menu),
              SizedBox(width: 10),
              Text('Food Recipes'),
            ],
          ),
        ),
        body: Consumer<RecipeProvider>(
          builder: (context, value, child) {
            if(value.isLoading){
              return const Center(child: CircularProgressIndicator());
            }else{
              return ListView.builder(
                itemCount: value.recipeList.length,
                itemBuilder: (context, index) {
                  return RecipeCard(
                      title: value.recipeList[index].name ?? '',
                      cookTime: value.recipeList[index].totalTime ?? '',
                      rating: value.recipeList[index].rating.toString(),
                      thumbnailUrl: value.recipeList[index].images ?? '');
                },
              );
            }
          },
         ));
  }
}