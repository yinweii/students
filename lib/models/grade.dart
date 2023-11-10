import 'dart:convert';

class Grade {
  Grade({
    this.id,
    this.name,
  });
  final String? id;
  final String? name;

  Grade copyWith({
    String? id,
    String? name,
  }) {
    return Grade(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Grade.fromMap(Map<String, dynamic> map) {
    return Grade(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Grade.fromJson(String source) =>
      Grade.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Grade(id: $id, name: $name)';

  @override
  bool operator ==(covariant Grade other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
