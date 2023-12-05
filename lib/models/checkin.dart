// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CheckIn {
  final String? id;
  final String? studentId;
  final String? classId;
  final String? checkinTime;
  final String? createdAt;
  final String? updateAt;
  CheckIn({
    this.id,
    this.studentId,
    this.classId,
    this.checkinTime,
    this.createdAt,
    this.updateAt,
  });

  CheckIn copyWith({
    String? id,
    String? studentId,
    String? classId,
    String? checkinTime,
    String? createdAt,
    String? updateAt,
  }) {
    return CheckIn(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      classId: classId ?? this.classId,
      checkinTime: checkinTime ?? this.checkinTime,
      createdAt: createdAt ?? this.createdAt,
      updateAt: updateAt ?? this.updateAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'studentId': studentId,
      'classId': classId,
      'checkinTime': checkinTime,
      'createdAt': createdAt,
      'updateAt': updateAt,
    };
  }

  factory CheckIn.fromMap(Map<String, dynamic> map) {
    return CheckIn(
      id: map['id'] != null ? map['id'].toString() : '',
      studentId: map['student_id'] != null ? map['student_id'].toString() : '',
      classId: map['class_id'] != null ? map['class_id'].toString() : '',
      checkinTime:
          map['checkin_time'] != null ? map['checkin_time'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updateAt: map['created_at'] != null ? map['created_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CheckIn.fromJson(String source) =>
      CheckIn.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CheckIn(id: $id, studentId: $studentId, classId: $classId, checkinTime: $checkinTime, createdAt: $createdAt, updateAt: $updateAt)';
  }

  @override
  bool operator ==(covariant CheckIn other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.studentId == studentId &&
        other.classId == classId &&
        other.checkinTime == checkinTime &&
        other.createdAt == createdAt &&
        other.updateAt == updateAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        studentId.hashCode ^
        classId.hashCode ^
        checkinTime.hashCode ^
        createdAt.hashCode ^
        updateAt.hashCode;
  }
}
