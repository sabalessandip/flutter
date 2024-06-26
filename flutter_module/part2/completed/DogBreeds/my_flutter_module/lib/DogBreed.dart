import 'package:json_annotation/json_annotation.dart';
import 'package:my_flutter_module/SizeMetric.dart';

part 'DogBreed.g.dart';

@JsonSerializable()
class DogBreed {
  int id;
  String name;
  SizeMetric weight;
  SizeMetric height;
  String? description;
  String? bred_for;
  String? breed_group;
  String life_span;
  String? temperament;
  String? reference_image_id;

  DogBreed(
      this.id,
      this.name,
      this.weight,
      this.height,
      this.description,
      this.bred_for,
      this.breed_group,
      this.life_span,
      this.temperament,
      this.reference_image_id);

  factory DogBreed.fromJson(Map<String, dynamic> json) =>
      _$DogBreedFromJson(json);
  Map<String, dynamic> toJson() => _$DogBreedToJson(this);
}
