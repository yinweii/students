import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:students/screens/class_list/class_list_state.dart';

class ClassListStateNotifier extends StateNotifier<ClassListState> {
  ClassListStateNotifier(): super(ClassListState()){
    
  }
  
}