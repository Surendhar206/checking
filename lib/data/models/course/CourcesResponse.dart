import 'package:json_annotation/json_annotation.dart';
import 'package:masterstudy_app/data/models/category.dart';

part 'CourcesResponse.g.dart';

@JsonSerializable()
class CourcesResponse {
  num page;
  List<CoursesBean?> courses;
  num total_pages;

  CourcesResponse({required this.page, required this.courses, required this.total_pages});

  factory CourcesResponse.fromJson(Map<String, dynamic> json) => _$CourcesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CourcesResponseToJson(this);
}

@JsonSerializable()
class CoursesBean {
  dynamic id;
  String? title;
  ImagesBean? images;
  List<String?> categories;

  PriceBean? price;

  RatingBean? rating;
  String? featured;
  StatusBean? status;
  List<Category?> categories_object;

  CoursesBean(
      {required this.id,
      required this.title,
      required this.images,
      required this.categories,
      required this.price,
      required this.rating,
      required this.featured,
      required this.status,
      required this.categories_object});

  factory CoursesBean.fromJson(Map<String, dynamic> json) => _$CoursesBeanFromJson(json);


  Map<String, dynamic> toJson() => _$CoursesBeanToJson(this);
}

@JsonSerializable()
class PriceBean {
  bool free;
  String price;
  late String old_price;

  PriceBean({
    required this.free,
    required this.price,
    required this.old_price,
  });

  factory PriceBean.fromJson(Map<String, dynamic> json) => _$PriceBeanFromJson(json);

  Map<String, dynamic> toJson() => _$PriceBeanToJson(this);
}

@JsonSerializable()
class StatusBean {
  String status;
  String label;

  StatusBean({required this.status, required this.label});

  factory StatusBean.fromJson(Map<String, dynamic> json) => _$StatusBeanFromJson(json);

  Map<String, dynamic> toJson() => _$StatusBeanToJson(this);
}

@JsonSerializable()
class RatingBean {
  num average;
  late num total;
  num percent;

  RatingBean({required this.average, required this.total, required this.percent});

  factory RatingBean.fromJson(Map<String, dynamic> json) => _$RatingBeanFromJson(json);

  Map<String, dynamic> toJson() => _$RatingBeanToJson(this);
}

@JsonSerializable()
class ImagesBean {
  String full;
  String small;

  ImagesBean({required this.full, required this.small});

  factory ImagesBean.fromJson(Map<String, dynamic> json) => _$ImagesBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ImagesBeanToJson(this);
}
