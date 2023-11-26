import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/api/api_client.dart';
import 'package:students/api/api_endpoints.dart';
import 'package:students/api/api_response/api_response.dart';
import 'package:students/models/class_model.dart';
import 'package:students/models/student.dart';
import 'package:students/models/student_detail.dart';
import 'package:students/screens/create_student/create_student_state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

enum Gender { male, female }

final createStudentProvider = StateNotifierProvider.family.autoDispose<
    CreateStudentStateNotifier,
    CreateStudentState,
    StudentDetail?>((ref, student) {
  return CreateStudentStateNotifier(ref, student);
});

class CreateStudentStateNotifier extends StateNotifier<CreateStudentState> {
  CreateStudentStateNotifier(this.ref, this.student)
      : super(CreateStudentState()) {
    _getAllClass();
  }
  Ref ref;
  final StudentDetail? student; 

  void _init() {
    if (student == null) {
      return;
    }
    state = state.copyWith(
      selectDatetime:
          student?.dob != null ? DateTime.parse(student?.dob ?? '') : null,
      selectGender: student?.gender != null
          ? Gender.values.byName(student!.gender!)
          : state.selectGender,
      classType: student?.classType != null
          ? _classTypeByName(student!.classType!)
          : state.classType,
      onSelectClass: _class(student?.classInfo?.id),
    );
  }

  Future<void> _getAllClass() async {
    try {
      state = state.copyWith(showLoadingIndicator: true);
      final result = await apiClient(ref)
          .getRequest(ApiEndpoints.classApi, isAuthorized: true);
      if (result is! ApiResponse || !result.success) {
        return;
      }
      final classes = (result.data as List)
          .map((e) => Class.fromMap(e as Map<String, dynamic>))
          .toList();
      state = state.copyWith(classes: classes);
      _init();
    } catch (e) {
      log(e.toString());
      state = state.copyWith(classes: []);
    }
  }

  Future<bool> createStudent({
    bool isUpdate = false,
    String? name,
    String? dob,
    String? phone,
    String? email,
    String? address,
    String? mainContract,
    String? mainContractPhone,
    String? mainContractEmail,
  }) async {
    final newStudent = Student(
      classId: state.onSelectClass?.id,
      classType: state.classType?.value,
      name: name,
      dob: dob,
      phone: phone,
      email: email,
      gender: state.selectGender.name,
      address: address,
      mainContract: mainContract,
      mainContractPhone: mainContractPhone,
      mainContractEmail: mainContractEmail,
    );
    if (isUpdate) {
      try {
        final result = await apiClient(ref).patchRequest(
          '${ApiEndpoints.student}/${student?.id}',
          params: newStudent.toMap(),
          isAuthorized: true,
        );
        if (result is! ApiResponse || !result.success) {
          EasyLoading.showError('something wrong :(');
          return false;
        }
        EasyLoading.showSuccess('Success!');
        return true;
      } catch (e) {
        EasyLoading.showError(e.toString());
        return false;
      }
    }

    try {
      final result = await apiClient(ref).postRequest(
        ApiEndpoints.student,
        params: newStudent.toMap(),
        isAuthorized: true,
      );
      if (result is! ApiResponse || !result.success) {
        return false;
      }
      EasyLoading.showSuccess('Success!');
      return true;
    } catch (e) {
      EasyLoading.showError(e.toString());
      return false;
    }
  }

  void onSelectClassType(ClassType? classType) {
    state = state.copyWith(classType: classType);
  }

  void onSelectClass(Class? classData) {
    state = state.copyWith(onSelectClass: classData);
  }

  void onSelectGender(Gender? gender) {
    state = state.copyWith(selectGender: gender ?? state.selectGender);
  }

  void onSelectDatetime(DateTime? datetime) {
    state = state.copyWith(selectDatetime: datetime);
  }

  ClassType _classTypeByName(String name) {
    return classTypeDumy.firstWhere((element) => element.value == name);
  }

  Class _class(String? id) {
    return state.classes.firstWhere((element) => element.id == id);
  }
}

class ClassType {
  final String name;
  final String value;
  ClassType({required this.name, required this.value});
}

List<ClassType> classTypeDumy = [
  ClassType(name: 'Chính quy', value: 'official'),
  ClassType(name: 'Dạy thêm', value: 'other'),
];
