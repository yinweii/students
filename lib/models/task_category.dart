// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskCategory {
  final String id;
  final String label;
  TaskCategory({
    required this.id,
    required this.label,
  });

  TaskCategory copyWith({
    String? id,
    String? name,
  }) {
    return TaskCategory(
      id: id ?? this.id,
      label: name ?? label,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'label': label,
    };
  }

  factory TaskCategory.fromMap(Map<String, dynamic> map) {
    return TaskCategory(
      id: map['id'].toString(),
      label: map['label'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskCategory.fromJson(String source) =>
      TaskCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TaskCategory(id: $id, name: $label)';

  @override
  bool operator ==(covariant TaskCategory other) {
    if (identical(this, other)) return true;

    return other.id == id && other.label == label;
  }

  @override
  int get hashCode => id.hashCode ^ label.hashCode;
}
