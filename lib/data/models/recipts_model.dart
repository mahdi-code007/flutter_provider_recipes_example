class RecipeModel {
  RecipeModel({
    String? name,
    String? images,
    double? rating,
    String? totalTime,

  }){
    _name = name;
    _images = images;
    _rating = rating;
    _totalTime = totalTime;
  }
  RecipeModel.fromJson(dynamic json) {
    _name = json['name'];
    _images = json['images'][0]['hostedLargeUrl'];
    _rating = json['rating'];
    _totalTime = json['totalTime'];
  }
  String? _name;
  String? _images;
  double? _rating;
  String? _totalTime;

  String? get name => _name ?? '';
  String? get images => _images ?? '';
  String? get totalTime => _totalTime ?? '';
  double get rating => _rating ?? 0.0;


}