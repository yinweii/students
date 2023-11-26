// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StudentPoint {
  final String? id;
  final String? studentId;
  final String? subjectId;
  final String? speech;
  final String? pressPosition;
  final String? noise;
  final String? goodTake;
  final String? beats;
  final String? date;
  final String? note;
  final String? createdAt;
  final String? updatedAt;
  StudentPoint({
    this.id,
    this.studentId,
    this.subjectId,
    this.speech,
    this.pressPosition,
    this.noise,
    this.goodTake,
    this.beats,
    this.date,
    this.note,
    this.createdAt,
    this.updatedAt,
  });

  StudentPoint copyWith({
    String? id,
    String? studentId,
    String? subjectId,
    String? speech,
    String? pressPosition,
    String? noise,
    String? goodTake,
    String? beats,
    String? date,
    String? note,
    String? createdAt,
    String? updatedAt,
  }) {
    return StudentPoint(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      subjectId: subjectId ?? this.subjectId,
      speech: speech ?? this.speech,
      pressPosition: pressPosition ?? this.pressPosition,
      noise: noise ?? this.noise,
      goodTake: goodTake ?? this.goodTake,
      beats: beats ?? this.beats,
      date: date ?? this.date,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'student_id': studentId,
      'subject_id': subjectId,
      'speech': speech,
      'press_position': pressPosition,
      'noise': noise,
      'good_take': goodTake,
      'beats': beats,
      'date': date,
      'note': note,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory StudentPoint.fromMap(Map<String, dynamic> map) {
    return StudentPoint(
      id: map['id'].toString(),
      studentId: map['student_id'].toString(),
      subjectId: map['subject_id'] != null ? map['subject_id'].toString() : '',
      speech: map['speech'] != null ? map['speech'] as String : null,
      pressPosition: map['press_position'] ?? map['press_position'].toString(),
      noise: map['noise'].toString(),
      goodTake: map['good_take'].toString(),
      beats: map['beats'] ?? map['beats'].toString(),
      date: map['date'] != null ? map['date'] as String : null,
      note: map['note'] != null ? map['note'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentPoint.fromJson(String source) =>
      StudentPoint.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentPoint(id: $id, studentId: $studentId, subjectId: $subjectId, speech: $speech, pressPosition: $pressPosition, noise: $noise, goodTake: $goodTake, beats: $beats, date: $date, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant StudentPoint other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.studentId == studentId &&
        other.subjectId == subjectId &&
        other.speech == speech &&
        other.pressPosition == pressPosition &&
        other.noise == noise &&
        other.goodTake == goodTake &&
        other.beats == beats &&
        other.date == date &&
        other.note == note &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        studentId.hashCode ^
        subjectId.hashCode ^
        speech.hashCode ^
        pressPosition.hashCode ^
        noise.hashCode ^
        goodTake.hashCode ^
        beats.hashCode ^
        date.hashCode ^
        note.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
