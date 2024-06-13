import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  final userId;
  final id;
  final title;
  final completed;

  PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
  Map<String, dynamic> json() => _$PostModelToJson(this);
}
