// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentPoint {
  final String? attribution;
  final String? pressPosition;
  final String? beats;
  final int? noise;
  final int? takeGood;
  final String? note;
  final String? createAt;
  final String? updateAt;
  StudentPoint({
    this.attribution,
    this.pressPosition,
    this.beats,
    this.noise,
    this.takeGood,
    this.note,
    this.createAt,
    this.updateAt,
  });

  StudentPoint copyWith({
    String? attribution,
    String? pressPosition,
    String? beats,
    int? noise,
    int? takeGood,
    String? note,
    String? createAt,
    String? updateAt,
  }) {
    return StudentPoint(
      attribution: attribution ?? this.attribution,
      pressPosition: pressPosition ?? this.pressPosition,
      beats: beats ?? this.beats,
      noise: noise ?? this.noise,
      takeGood: takeGood ?? this.takeGood,
      note: note ?? this.note,
      createAt: createAt ?? this.createAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'attribution': attribution,
      'pressPosition': pressPosition,
      'beats': beats,
      'noise': noise,
      'takeGood': takeGood,
      'note': note,
      'createAt': createAt,
      'updateAt': updateAt,
    };
  }

  factory StudentPoint.fromMap(Map<String, dynamic> map) {
    return StudentPoint(
      attribution:
          map['attribution'] != null ? map['attribution'] as String : null,
      pressPosition:
          map['pressPosition'] != null ? map['pressPosition'] as String : null,
      beats: map['beats'] != null ? map['beats'] as String : null,
      noise: map['noise'] != null ? map['noise'] as int : null,
      takeGood: map['takeGood'] != null ? map['takeGood'] as int : null,
      note: map['note'] != null ? map['note'] as String : null,
      createAt: map['createAt'] != null ? map['createAt'] as String : null,
      updateAt: map['updateAt'] != null ? map['updateAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentPoint.fromJson(String source) =>
      StudentPoint.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Point(attribution: $attribution, pressPosition: $pressPosition, beats: $beats, noise: $noise, takeGood: $takeGood, note: $note, createAt: $createAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(covariant StudentPoint other) {
    if (identical(this, other)) return true;

    return other.attribution == attribution &&
        other.pressPosition == pressPosition &&
        other.beats == beats &&
        other.noise == noise &&
        other.takeGood == takeGood &&
        other.note == note &&
        other.createAt == createAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return attribution.hashCode ^
        pressPosition.hashCode ^
        beats.hashCode ^
        noise.hashCode ^
        takeGood.hashCode ^
        note.hashCode ^
        createAt.hashCode ^
        updateAt.hashCode;
  }
}
