import 'dart:convert';

class AnnualCategory {
  final String? id;
  final String? label;
  final String? url;
  final int? type;
  AnnualCategory({
    this.id,
    this.label,
    this.url,
    this.type,
  });

  AnnualCategory copyWith({
    String? id,
    String? label,
    String? url,
    int? type,
  }) {
    return AnnualCategory(
      id: id ?? this.id,
      label: label ?? this.label,
      url: url ?? this.url,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'url': url,
      'type': type,
    };
  }

  factory AnnualCategory.fromMap(Map<String, dynamic> map) {
    return AnnualCategory(
      id: map['id'].toString(),
      label: map['label'],
      url: map['url'],
      type: map['type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnnualCategory.fromJson(String source) =>
      AnnualCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AnnualCategory(id: $id, label: $label, url: $url, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AnnualCategory &&
        other.id == id &&
        other.label == label &&
        other.url == url &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^ label.hashCode ^ url.hashCode ^ type.hashCode;
  }
}
