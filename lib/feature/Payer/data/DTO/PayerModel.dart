

import '../../domain/entity/PayerEntity.dart';

class PayerModel extends PayerEntity{
  PayerModel({required super.data});

  factory PayerModel.fromJson(Map<String, dynamic> json) => PayerModel(
      data: Data.fromJson(json["data"]),

  );
}