class FoodModel {
  String? name;
  String? calories;
  String? servingSizeG;
  String? proteinG;

  double? fatTotalG;
  double? fatSaturatedG;
  int? sodiumMg;
  int? potassiumMg;
  int? cholesterolMg;
  double? carbohydratesTotalG;
  double? fiberG;
  double? sugarG;

  FoodModel({
    this.name,
    this.calories,
    this.servingSizeG,
    this.proteinG,
    this.fatTotalG,
    this.fatSaturatedG,
    this.sodiumMg,
    this.potassiumMg,
    this.cholesterolMg,
    this.carbohydratesTotalG,
    this.fiberG,
    this.sugarG,
  });

  FoodModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    calories = json['calories']?.toString();
    servingSizeG = json['serving_size_g']?.toString();
    proteinG = json['protein_g']?.toString();

    fatTotalG = (json['fat_total_g'] as num?)?.toDouble();
    fatSaturatedG = (json['fat_saturated_g'] as num?)?.toDouble();
    sodiumMg = (json['sodium_mg'] as num?)?.toInt();
    potassiumMg = (json['potassium_mg'] as num?)?.toInt();
    cholesterolMg = (json['cholesterol_mg'] as num?)?.toInt();
    carbohydratesTotalG = (json['carbohydrates_total_g'] as num?)?.toDouble();
    fiberG = (json['fiber_g'] as num?)?.toDouble();
    sugarG = (json['sugar_g'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['calories'] = calories;
    data['serving_size_g'] = servingSizeG;
    data['protein_g'] = proteinG;
    data['fat_total_g'] = fatTotalG;
    data['fat_saturated_g'] = fatSaturatedG;
    data['sodium_mg'] = sodiumMg;
    data['potassium_mg'] = potassiumMg;
    data['cholesterol_mg'] = cholesterolMg;
    data['carbohydrates_total_g'] = carbohydratesTotalG;
    data['fiber_g'] = fiberG;
    data['sugar_g'] = sugarG;
    return data;
  }
}
