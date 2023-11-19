// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Class {
  final String? id;
  final String? className;
  final int? number;
  final String? updateAt;
  final String? hashColor;
  Class({
    this.id,
    this.className,
    this.number,
    this.updateAt,
    this.hashColor,
  });

  Class copyWith({
    String? id,
    String? className,
    int? number,
    String? updateAt,
    String? hashColor,
  }) {
    return Class(
      id: id ?? this.id,
      className: className ?? this.className,
      number: number ?? this.number,
      updateAt: updateAt ?? this.updateAt,
      hashColor: hashColor ?? this.hashColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'className': className,
      'number': number,
      'updateAt': updateAt,
      'hashColor': hashColor,
    };
  }

  factory Class.fromMap(Map<String, dynamic> map) {
    return Class(
      id: map['id'] != null ? map['id'] as String : null,
      className: map['className'] != null ? map['className'] as String : null,
      number: map['number'] != null ? map['number'] as int : null,
      updateAt: map['updateAt'] != null ? map['updateAt'] as String : null,
      hashColor: map['hashColor'] != null ? map['hashColor'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Class.fromJson(String source) =>
      Class.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Class(id: $id, className: $className, number: $number, updateAt: $updateAt, hashColor: $hashColor)';
  }

  @override
  bool operator ==(covariant Class other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.className == className &&
        other.number == number &&
        other.updateAt == updateAt &&
        other.hashColor == hashColor;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        className.hashCode ^
        number.hashCode ^
        updateAt.hashCode ^
        hashColor.hashCode;
  }
}

List<Class> classesDumpy = [
  Class(
      id: "1",
      className: "Math",
      number: 10,
      updateAt: "2023-01-01",
      hashColor: "#FF5733"),
  Class(
      id: "2",
      className: "Science",
      number: 20,
      updateAt: "2023-01-02",
      hashColor: "#33FF57"),
  Class(
      id: "3",
      className: "History",
      number: 25,
      updateAt: "2023-01-03",
      hashColor: "#5733FF"),
  Class(
      id: "4",
      className: "English",
      number: 21,
      updateAt: "2023-01-04",
      hashColor: "#FF3366"),
  Class(
      id: "5",
      className: "Physics",
      number: 32,
      updateAt: "2023-01-05",
      hashColor: "#33FF66"),
  Class(
      id: "6",
      className: "Chemistry",
      number: 19,
      updateAt: "2023-01-06",
      hashColor: "#6633FF"),
];
