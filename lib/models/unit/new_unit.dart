// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'new_unit.g.dart';

@HiveType(typeId: 0)
class Unit extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String? symbol;

  @HiveField(2)
  final String? formalName;

  @HiveField(3)
  final int? unitNo;

  @HiveField(4)
  final DateTime createdAt;

  @HiveField(5)
  final DateTime? updatedAt;

  Unit({
    required this.id,
    this.symbol,
    this.formalName,
    this.unitNo,
    required this.createdAt,
    this.updatedAt,
  });

  Unit copyWith({
    String? id,
    String? symbol,
    String? formalName,
    int? unitNo,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Unit(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      formalName: formalName ?? this.formalName,
      unitNo: unitNo ?? this.unitNo,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  String toString() {
    return 'Unit(id: $id, symbol: $symbol, formalName: $formalName, unitNo: $unitNo, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'symbol': symbol,
      'formalName': formalName,
      'unitNo': unitNo,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
    };
  }

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(
      id: map['id'] as String,
      symbol: map['symbol'] != null ? map['symbol'] as String : null,
      formalName:
          map['formalName'] != null ? map['formalName'] as String : null,
      unitNo: map['unitNo'] != null ? map['unitNo'] as int : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: map['updatedAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Unit.fromJson(String source) =>
      Unit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Unit other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.symbol == symbol &&
        other.formalName == formalName &&
        other.unitNo == unitNo &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        symbol.hashCode ^
        formalName.hashCode ^
        unitNo.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
