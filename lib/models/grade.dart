import 'dart:convert';

class Grade {
  Grade({
    this.id,
    this.name,
    this.totalClass,
  });
  final String? id;
  final String? name;
  final int? totalClass;

  Grade copyWith({
    String? id,
    String? name,
    int? totalClass,
  }) {
    return Grade(
      id: id ?? this.id,
      name: name ?? this.name,
      totalClass: totalClass ?? this.totalClass,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'totalClass': totalClass,
    };
  }

  factory Grade.fromMap(Map<String, dynamic> map) {
    return Grade(
      id: map['id'],
      name: map['name'],
      totalClass: map['totalClass']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Grade.fromJson(String source) => Grade.fromMap(json.decode(source));

  @override
  String toString() => 'Grade(id: $id, name: $name, totalClass: $totalClass)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Grade &&
        other.id == id &&
        other.name == name &&
        other.totalClass == totalClass;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ totalClass.hashCode;
}
