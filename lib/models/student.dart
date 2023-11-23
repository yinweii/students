import 'dart:convert';

class Student {
  final String? id;
  final String? classId;
  final String? name;
  final String? gender;
  final String? classType;
  final String? phone;
  final String? dob;
  final String? address;
  final String? email;
  final String? mainContract;
  final String? mainContractPhone;
  final String? mainContractEmail;
  Student({
    this.id,
    this.classId,
    this.name,
    this.gender,
    this.classType,
    this.phone,
    this.dob,
    this.address,
    this.email,
    this.mainContract,
    this.mainContractPhone,
    this.mainContractEmail,
  });

  Student copyWith({
    String? id,
    String? classId,
    String? name,
    String? gender,
    String? classType,
    String? phone,
    String? dob,
    String? address,
    String? email,
    String? mainContract,
    String? mainContractPhone,
    String? mainContractEmail,
  }) {
    return Student(
      id: id ?? this.id,
      classId: classId ?? this.classId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      classType: classType ?? this.classType,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      address: address ?? this.address,
      email: email ?? this.email,
      mainContract: mainContract ?? this.mainContract,
      mainContractPhone: mainContractPhone ?? this.mainContractPhone,
      mainContractEmail: mainContractEmail ?? this.mainContractEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classId': classId,
      'name': name,
      'gender': gender,
      'classType': classType,
      'phone': phone,
      'dob': dob,
      'address': address,
      'email': email,
      'mainContract': mainContract,
      'mainContractPhone': mainContractPhone,
      'mainContractEmail': mainContractEmail,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id']?.toString(),
      classId: map['classId']?.toString(),
      name: map['name'] != null ? map['name'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      classType: map['classType'] != null ? map['classType'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      dob: map['dob'] != null ? map['dob'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      mainContract:
          map['mainContract'] != null ? map['mainContract'] as String : null,
      mainContractPhone: map['mainContractPhone'] != null
          ? map['mainContractPhone'] as String
          : null,
      mainContractEmail: map['mainContractEmail'] != null
          ? map['mainContractEmail'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) =>
      Student.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Student(id: $id, classId: $classId, name: $name, gender: $gender, classType: $classType, phone: $phone, dob: $dob, address: $address, email: $email, mainContract: $mainContract, mainContractPhone: $mainContractPhone, mainContractEmail: $mainContractEmail)';
  }

  @override
  bool operator ==(covariant Student other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.classId == classId &&
        other.name == name &&
        other.gender == gender &&
        other.classType == classType &&
        other.phone == phone &&
        other.dob == dob &&
        other.address == address &&
        other.email == email &&
        other.mainContract == mainContract &&
        other.mainContractPhone == mainContractPhone &&
        other.mainContractEmail == mainContractEmail;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        classId.hashCode ^
        name.hashCode ^
        gender.hashCode ^
        classType.hashCode ^
        phone.hashCode ^
        dob.hashCode ^
        address.hashCode ^
        email.hashCode ^
        mainContract.hashCode ^
        mainContractPhone.hashCode ^
        mainContractEmail.hashCode;
  }
}
