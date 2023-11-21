// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Class {
  final String? id;
  final String? name;
  final int? total;
  final String? hashColor;
  final String? updateAt;
  Class({this.id, this.name, this.total, this.hashColor, this.updateAt});

  Class copyWith({
    String? id,
    String? name,
    int? total,
    String? hashColor,
  }) {
    return Class(
      id: id ?? this.id,
      name: name ?? this.name,
      total: total ?? this.total,
      hashColor: hashColor ?? this.hashColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'total': total,
      'hashColor': hashColor,
    };
  }

  factory Class.fromMap(Map<String, dynamic> map) {
    final color = colors..shuffle();
    return Class(
      id: map['id'].toString(),
      name: map['name'] != null ? map['name'] as String : null,
      total: map['total'] != null ? int.parse(map['total'].toString()) : null,
      hashColor:
          map['hashColor'] != null ? map['hashColor'] as String : color.first,
      updateAt: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Class.fromJson(String source) =>
      Class.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Class(id: $id, name: $name, total: $total, hashColor: $hashColor)';
  }

  @override
  bool operator ==(covariant Class other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.total == total &&
        other.hashColor == hashColor;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ total.hashCode ^ hashColor.hashCode;
  }
}

var colors = [
  '#FF0000',
  '#FFA500',
  '#FFFF00',
  '#008000',
  '#0000FF',
  '#4B0082',
  '#EE82EE',
];
