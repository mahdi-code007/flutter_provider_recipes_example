import 'package:flutter/cupertino.dart';

import '../../data/models/recipts_model.dart';
import '../../data/repositories/recipe_repo.dart';

class RecipeProvider extends ChangeNotifier{
  List<RecipeModel> recipeList = [];

  bool isLoading = true;
  Future<void> getRecipes() async {
    isLoading = true;
    notifyListeners();
    recipeList = await RecipeRepo.getRecipe();
    isLoading = false;
    notifyListeners();
  }
}