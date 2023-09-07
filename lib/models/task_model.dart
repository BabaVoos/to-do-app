import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String? taskId;
  String? taskTitle;
  String? taskDescription;
  Timestamp? selectedDate;
  Timestamp? dateCreated;
  bool? isDone;
  String? userId;

  TaskModel({
    this.taskId,
    this.taskTitle,
    this.taskDescription,
    this.selectedDate,
    this.dateCreated,
    this.isDone,
    this.userId,
  });

  factory TaskModel.fromFirestore(Map<String, dynamic> map) {
    return TaskModel(
      taskId: map['taskId'],
      taskTitle: map['taskTitle'],
      taskDescription: map['taskDescription'],
      selectedDate: map['selectedDate'],
      dateCreated: map['dateCreated'],
      isDone: map['isDone'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'taskId': taskId ?? '',
      'taskTitle': taskTitle ?? '',
      'taskDescription': taskDescription ?? '',
      'selectedDate': selectedDate ?? Timestamp.now(),
      'dateCreated': dateCreated ?? Timestamp.now(),
      'isDone': isDone ?? false,
      'userId': userId ?? '',
    };
  }
}
