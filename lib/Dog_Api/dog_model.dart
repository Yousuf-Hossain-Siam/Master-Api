class DogModel {
  String? imageLink;
  int? goodWithChildren;
  int? goodWithOtherDogs;
  int? shedding;
  int? grooming;
  int? drooling;
  int? coatLength;
  int? goodWithStrangers;
  int? playfulness;
  int? protectiveness;
  int? trainability;
  int? energy;
  int? barking;
  double? minLifeExpectancy;
  double? maxLifeExpectancy;
  double? maxHeightMale;
  double? maxHeightFemale;
  double? maxWeightMale;
  double? maxWeightFemale;
  double? minHeightMale;
  double? minHeightFemale;
  double? minWeightMale;
  double? minWeightFemale;
  String? name;

  DogModel({
    this.imageLink,
    this.goodWithChildren,
    this.goodWithOtherDogs,
    this.shedding,
    this.grooming,
    this.drooling,
    this.coatLength,
    this.goodWithStrangers,
    this.playfulness,
    this.protectiveness,
    this.trainability,
    this.energy,
    this.barking,
    this.minLifeExpectancy,
    this.maxLifeExpectancy,
    this.maxHeightMale,
    this.maxHeightFemale,
    this.maxWeightMale,
    this.maxWeightFemale,
    this.minHeightMale,
    this.minHeightFemale,
    this.minWeightMale,
    this.minWeightFemale,
    this.name,
  });

  factory DogModel.fromJson(Map<String, dynamic> json) {
    return DogModel(
      imageLink: json['image_link'],
      goodWithChildren: json['good_with_children'],
      goodWithOtherDogs: json['good_with_other_dogs'],
      shedding: json['shedding'],
      grooming: json['grooming'],
      drooling: json['drooling'],
      coatLength: json['coat_length'],
      goodWithStrangers: json['good_with_strangers'],
      playfulness: json['playfulness'],
      protectiveness: json['protectiveness'],
      trainability: json['trainability'],
      energy: json['energy'],
      barking: json['barking'],
      minLifeExpectancy: (json['min_life_expectancy'] as num?)?.toDouble(),
      maxLifeExpectancy: (json['max_life_expectancy'] as num?)?.toDouble(),
      maxHeightMale: (json['max_height_male'] as num?)?.toDouble(),
      maxHeightFemale: (json['max_height_female'] as num?)?.toDouble(),
      maxWeightMale: (json['max_weight_male'] as num?)?.toDouble(),
      maxWeightFemale: (json['max_weight_female'] as num?)?.toDouble(),
      minHeightMale: (json['min_height_male'] as num?)?.toDouble(),
      minHeightFemale: (json['min_height_female'] as num?)?.toDouble(),
      minWeightMale: (json['min_weight_male'] as num?)?.toDouble(),
      minWeightFemale: (json['min_weight_female'] as num?)?.toDouble(),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image_link': imageLink,
      'good_with_children': goodWithChildren,
      'good_with_other_dogs': goodWithOtherDogs,
      'shedding': shedding,
      'grooming': grooming,
      'drooling': drooling,
      'coat_length': coatLength,
      'good_with_strangers': goodWithStrangers,
      'playfulness': playfulness,
      'protectiveness': protectiveness,
      'trainability': trainability,
      'energy': energy,
      'barking': barking,
      'min_life_expectancy': minLifeExpectancy,
      'max_life_expectancy': maxLifeExpectancy,
      'max_height_male': maxHeightMale,
      'max_height_female': maxHeightFemale,
      'max_weight_male': maxWeightMale,
      'max_weight_female': maxWeightFemale,
      'min_height_male': minHeightMale,
      'min_height_female': minHeightFemale,
      'min_weight_male': minWeightMale,
      'min_weight_female': minWeightFemale,
      'name': name,
    };
  }
}
