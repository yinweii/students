import 'dart:convert';

class Class {
  final String? id;
  final String? className;
  final int? number;
  final String? updateAt;
  Class({
    this.id,
    this.className,
    this.number,
    this.updateAt,
  });

  Class copyWith({
    String? id,
    String? className,
    int? number,
    String? updateAt,
  }) {
    return Class(
      id: id ?? this.id,
      className: className ?? this.className,
      number: number ?? this.number,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'className': className,
      'number': number,
      'updateAt': updateAt,
    };
  }

  factory Class.fromMap(Map<String, dynamic> map) {
    return Class(
      id: map['id'],
      className: map['className'],
      number: map['number']?.toInt(),
      updateAt: map['updateAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Class.fromJson(String source) => Class.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Class(id: $id, className: $className, number: $number, updateAt: $updateAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Class &&
        other.id == id &&
        other.className == className &&
        other.number == number &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        className.hashCode ^
        number.hashCode ^
        updateAt.hashCode;
  }
}
