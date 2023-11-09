import 'dart:convert';

import 'package:students/models/task_category.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Task {
  final String? id;
  final String? title;
  final String? userId;
  final String? taskCategoryId;
  final String? description;
  final bool success;
  final String? iconPath;
  final bool loop;
  final String? expand;
  final TaskCategory? taskCategory;

  Task({
    this.id,
    this.title,
    this.userId,
    this.taskCategoryId,
    this.description,
    this.success = false,
    this.iconPath,
    this.loop = false,
    this.expand,
    this.taskCategory,
  });

  Task copyWith({
    String? id,
    String? title,
    String? userId,
    String? taskCategoryId,
    String? description,
    bool? success,
    String? iconPath,
    bool? loop,
    String? expand,
    TaskCategory? taskCategory,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      userId: userId ?? this.userId,
      taskCategoryId: taskCategoryId ?? this.taskCategoryId,
      description: description ?? this.description,
      success: success ?? this.success,
      iconPath: iconPath ?? this.iconPath,
      loop: loop ?? this.loop,
      expand: expand ?? this.expand,
      taskCategory: taskCategory ?? this.taskCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'userId': userId,
      'task_category_id': taskCategoryId,
      'description': description,
      'success': success,
      'icon_path': iconPath,
      'loop': loop,
      'expand': expand,
      'task_category': taskCategory?.toMap(),
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'].toString(),
      title: map['title'],
      userId: map['userId'].toString(),
      taskCategoryId: map['task_category_id'].toString(),
      description: map['description'],
      success: map['success'] ?? false,
      iconPath: map['icon_path'],
      loop: map['loop'] ?? false,
      expand: map['expand'],
      taskCategory: map['task_category'] != null
          ? TaskCategory.fromMap(map['task_category'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Task(id: $id, title: $title, userId: $userId, taskCategoryId: $taskCategoryId, description: $description, success: $success, iconPath: $iconPath, loop: $loop, expand: $expand, taskCategory: $taskCategory)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Task &&
        other.id == id &&
        other.title == title &&
        other.userId == userId &&
        other.taskCategoryId == taskCategoryId &&
        other.description == description &&
        other.success == success &&
        other.iconPath == iconPath &&
        other.loop == loop &&
        other.expand == expand &&
        other.taskCategory == taskCategory;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        userId.hashCode ^
        taskCategoryId.hashCode ^
        description.hashCode ^
        success.hashCode ^
        iconPath.hashCode ^
        loop.hashCode ^
        expand.hashCode ^
        taskCategory.hashCode;
  }
}
