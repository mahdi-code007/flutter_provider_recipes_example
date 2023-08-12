import 'dart:convert';

import '../models/recipts_model.dart';
import 'package:http/http.dart' as http;

class RecipeRepo{
  static Future<List<RecipeModel>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "YOUR_API_KEY", // TODO YOUR_API_KEY
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    var recipes = _temp.map((e) => RecipeModel.fromJson(e)).toList();
    return recipes;
  }
}