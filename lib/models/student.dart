// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:students/models/class_model.dart';
import 'package:students/models/point.dart';

class Student {
  final String? id;
  final String? classId;
  final String? otherClassId;
  final String? name;
  final String? gender;
  final int? percent;
  final String? phoneNumber;
  final String? dob;
  final String? contractPerson;
  final String? phoneOfContractPerson;
  final String? address;
  final List<StudentPoint>? points;
  final Class classInfo;
  Student({
    this.id,
    this.classId,
    this.otherClassId,
    this.name,
    this.gender,
    this.percent,
    this.phoneNumber,
    this.dob,
    this.contractPerson,
    this.phoneOfContractPerson,
    this.address,
    this.points,
    required this.classInfo,
  });

  Student copyWith({
    String? id,
    String? classId,
    String? otherClassId,
    String? name,
    String? gender,
    int? percent,
    String? phoneNumber,
    String? dob,
    String? contractPerson,
    String? phoneOfContractPerson,
    String? address,
    List<StudentPoint>? points,
    Class? classInfo,
  }) {
    return Student(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      otherClassId: otherClassId ?? this.otherClassId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      percent: percent ?? this.percent,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dob: dob ?? this.dob,
      contractPerson: contractPerson ?? this.contractPerson,
      phoneOfContractPerson:
          phoneOfContractPerson ?? this.phoneOfContractPerson,
      address: address ?? this.address,
      points: points ?? this.points,
      classInfo: classInfo ?? this.classInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classId': classId,
      'otherClassId': otherClassId,
      'name': name,
      'gender': gender,
      'percent': percent,
      'phoneNumber': phoneNumber,
      'dob': dob,
      'contractPerson': contractPerson,
      'phoneOfContractPerson': phoneOfContractPerson,
      'address': address,
      'points': points?.map((x) => x.toMap()).toList(),
      'classInfo': classInfo.toMap(),
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'] != null ? map['id'] as String : null,
      classId: map['classId'] != null ? map['classId'] as String : null,
      otherClassId:
          map['otherClassId'] != null ? map['otherClassId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      percent: map['percent'] != null ? map['percent'] as int : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      contractPerson: map['contractPerson'] != null
          ? map['contractPerson'] as String
          : null,
      phoneOfContractPerson: map['phoneOfContractPerson'] != null
          ? map['phoneOfContractPerson'] as String
          : null,
      address: map['address'] != null ? map['address'] as String : null,
      points: map['points'] != null
          ? List<StudentPoint>.from(
              (map['points'] as List<int>).map<StudentPoint?>(
                (x) => StudentPoint.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      classInfo: Class.fromMap(map['classInfo'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(id: $id, classId: $classId, otherClassId: $otherClassId, name: $name, gender: $gender, percent: $percent, phoneNumber: $phoneNumber, dob: $dob, contractPerson: $contractPerson, phoneOfContractPerson: $phoneOfContractPerson, address: $address, points: $points, classInfo: $classInfo)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.classId == classId &&
        other.otherClassId == otherClassId &&
        other.name == name &&
        other.gender == gender &&
        other.percent == percent &&
        other.phoneNumber == phoneNumber &&
        other.dob == dob &&
        other.contractPerson == contractPerson &&
        other.phoneOfContractPerson == phoneOfContractPerson &&
        other.address == address &&
        listEquals(other.points, points) &&
        other.classInfo == classInfo;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        classId.hashCode ^
        otherClassId.hashCode ^
        name.hashCode ^
        gender.hashCode ^
        percent.hashCode ^
        phoneNumber.hashCode ^
        dob.hashCode ^
        contractPerson.hashCode ^
        phoneOfContractPerson.hashCode ^
        address.hashCode ^
        points.hashCode ^
        classInfo.hashCode;
  }
}

List<Student> studentsData = List.generate(
  15,
  (index) {
    return Student(
      id: (index + 1).toString(),
      classId: "ClassA",
      otherClassId: "ClassB",
      name: "Student ${index + 1}",
      gender: (index % 2 == 0) ? "Male" : "Female",
      percent: (index + 1) * 10,
      phoneNumber: "123456789${index + 1}",
      dob: "2000-0$index-01",
      contractPerson: "Parent",
      phoneOfContractPerson: "987654321",
      address: "Address ${index + 1} Street ${index + 1} , City ${index + 1}",
      classInfo: classesDumpy[index % 2],
    );
  },
);
