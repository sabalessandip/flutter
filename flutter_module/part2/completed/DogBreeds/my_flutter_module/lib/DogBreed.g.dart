// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DogBreed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DogBreed _$DogBreedFromJson(Map<String, dynamic> json) => DogBreed(
      (json['id'] as num).toInt(),
      json['name'] as String,
      SizeMetric.fromJson(json['weight'] as Map<String, dynamic>),
      SizeMetric.fromJson(json['height'] as Map<String, dynamic>),
      json['description'] as String?,
      json['bred_for'] as String?,
      json['breed_group'] as String?,
      json['life_span'] as String,
      json['temperament'] as String?,
      json['reference_image_id'] as String?,
    );

Map<String, dynamic> _$DogBreedToJson(DogBreed instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'weight': instance.weight,
      'height': instance.height,
      'description': instance.description,
      'bred_for': instance.bred_for,
      'breed_group': instance.breed_group,
      'life_span': instance.life_span,
      'temperament': instance.temperament,
      'reference_image_id': instance.reference_image_id,
    };
