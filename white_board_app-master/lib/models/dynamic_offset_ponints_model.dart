// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DynamicOffsetPointsModel {
  Offset offset;
  DynamicOffsetPointsModel({
    required this.offset,
  });

  DynamicOffsetPointsModel copyWith({
    Offset? offset,
  }) {
    return DynamicOffsetPointsModel(
      offset: offset ?? this.offset,
    );
  }

  @override
  String toString() => 'DynamicOffsetPointsMOdel(offset: $offset)';

  @override
  bool operator ==(covariant DynamicOffsetPointsModel other) {
    if (identical(this, other)) return true;

    return other.offset == offset;
  }

  @override
  int get hashCode => offset.hashCode;
}
