// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:students/models/class_model.dart';
import 'package:students/models/point.dart';

class StudentDetail {
  final String? id;
  final String? userId;
  final String? name;
  final String? classId;
  final String? classType;
  final String? dob;
  final String? gender;
  final String? address;
  final String? phone;
  final String? email;
  final String? mainContract;
  final String? mainContractPhone;
  final String? mainContractEmail;
  final String? createdAt;
  final String? updatedAt;
  final Class? classInfo;
  final List<StudentPoint>? points;

  StudentDetail({
    this.id,
    this.userId,
    this.name,
    this.classId,
    this.classType,
    this.dob,
    this.gender,
    this.address,
    this.phone,
    this.email,
    this.mainContract,
    this.mainContractPhone,
    this.mainContractEmail,
    this.createdAt,
    this.updatedAt,
    this.classInfo,
    this.points,
  });
  StudentDetail copyWith({
    String? id,
    String? userId,
    String? name,
    String? classId,
    String? classType,
    String? dob,
    String? gender,
    String? address,
    String? phone,
    String? email,
    String? mainContract,
    String? mainContractPhone,
    String? mainContractEmail,
    String? createdAt,
    String? updatedAt,
    Class? classInfo,
    List<StudentPoint>? points,
  }) =>
      StudentDetail(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        name: name ?? this.name,
        classId: classId ?? this.classId,
        classType: classType ?? this.classType,
        dob: dob ?? this.dob,
        gender: gender ?? this.gender,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        mainContract: mainContract ?? this.mainContract,
        mainContractPhone: mainContractPhone ?? this.mainContractPhone,
        mainContractEmail: mainContractEmail ?? this.mainContractEmail,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        classInfo: classInfo ?? this.classInfo,
        points: points ?? this.points,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'name': name,
      'classId': classId,
      'classType': classType,
      'dob': dob,
      'gender': gender,
      'address': address,
      'phone': phone,
      'email': email,
      'mainContract': mainContract,
      'mainContractPhone': mainContractPhone,
      'mainContractEmail': mainContractEmail,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'classInfo': classInfo?.toMap(),
      'points': points?.map((x) => x.toMap()).toList(),
    };
  }

  factory StudentDetail.fromMap(Map<String, dynamic> map) {
    return StudentDetail(
      id: map['id'].toString(),
      userId: map['userId'].toString(),
      name: map['name'] != null ? map['name'] as String : null,
      classId: map['classId'].toString(),
      classType: map['classType'] != null ? map['classType'] as String : null,
      dob: map['dob'],
      gender: map['gender'] != null ? map['gender'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      mainContract:
          map['mainContract'] != null ? map['mainContract'] as String : null,
      mainContractPhone: map['mainContractPhone'] != null
          ? map['mainContractPhone'] as String
          : null,
      mainContractEmail: map['mainContractEmail'] != null
          ? map['mainContractEmail'] as String
          : null,
      createdAt: map['created_at'],
      updatedAt: map['updatedAt'],
      classInfo: map['classInfo'] != null
          ? Class.fromMap(map['classInfo'] as Map<String, dynamic>)
          : null,
      points: map['points'] != null
          ? List<StudentPoint>.from(
              (map['points'] as List<dynamic>).map<StudentPoint?>(
                (x) => StudentPoint.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentDetail.fromJson(String source) =>
      StudentDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'StudentDetail(id: $id, userId: $userId, name: $name, classId: $classId, classType: $classType, dob: $dob, gender: $gender, address: $address, phone: $phone, email: $email, mainContract: $mainContract, mainContractPhone: $mainContractPhone, mainContractEmail: $mainContractEmail, createdAt: $createdAt, updatedAt: $updatedAt, classInfo: $classInfo, points: $points)';
  }

  @override
  bool operator ==(covariant StudentDetail other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.name == name &&
        other.classId == classId &&
        other.classType == classType &&
        other.dob == dob &&
        other.gender == gender &&
        other.address == address &&
        other.phone == phone &&
        other.email == email &&
        other.mainContract == mainContract &&
        other.mainContractPhone == mainContractPhone &&
        other.mainContractEmail == mainContractEmail &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.classInfo == classInfo &&
        listEquals(other.points, points);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        name.hashCode ^
        classId.hashCode ^
        classType.hashCode ^
        dob.hashCode ^
        gender.hashCode ^
        address.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        mainContract.hashCode ^
        mainContractPhone.hashCode ^
        mainContractEmail.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        classInfo.hashCode ^
        points.hashCode;
  }
}
