import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_application/models/user_model.dart';

import '../models/task_model.dart';

class FireStoreDatabase {
  static CollectionReference getCollection() {
    return FirebaseFirestore.instance
        .collection(
          'TODO_APP',
        )
        .withConverter<TaskModel>(
          fromFirestore: (
            snapshot,
            _,
          ) =>
              TaskModel.fromFirestore(
            snapshot.data()!,
          ),
          toFirestore: (
            snapshot,
            _,
          ) =>
              snapshot.toFirestore(),
        );
  }

  static CollectionReference getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(
          'USER',
        )
        .withConverter<UserModel>(
          fromFirestore: (
            snapshot,
            _,
          ) =>
              UserModel.fromFirestore(
            snapshot.data()!,
          ),
          toFirestore: (
            snapshot,
            _,
          ) =>
              snapshot.toFirestore(),
        );
  }

  static Stream<QuerySnapshot> getData({
    Timestamp? selectedDate,
  }) {
    return getCollection()
        .where(
          'userId',
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .where(
          'selectedDate',
          isEqualTo: selectedDate,
        )
        .orderBy(
          'dateCreated',
          descending: true,
        )
        .snapshots();
  }

  static Future<void> addTask({
    required String taskTitle,
    required String taskDescription,
    required Timestamp selectedDate,
  }) async {
    final taskId = getCollection().doc();
    TaskModel task = TaskModel(
      taskId: taskId.id,
      taskTitle: taskTitle,
      taskDescription: taskDescription,
      selectedDate: selectedDate,
      dateCreated: Timestamp.now(),
      isDone: false,
      userId: FirebaseAuth.instance.currentUser!.uid,
    );
    await taskId.set(
      task,
    );
  }

  static Future<void> taskDone({
    required String taskId,
    required bool isDone,
  }) async {
    await getCollection()
        .doc(
      taskId,
    )
        .update(
      {
        'isDone': isDone,
      },
    );
  }

  static Future<void> deleteTask({
    required String taskId,
  }) async {
    await getCollection().doc(taskId).delete();
  }

  static Future<void> updateTask({
    required String taskId,
    required String taskTitle,
    required String taskDescription,
    required Timestamp selectedDate,
  }) async {
    TaskModel taskModel = TaskModel(
      taskTitle: taskTitle,
      taskDescription: taskDescription,
      selectedDate: selectedDate,
    );
    await getCollection()
        .doc(
      taskId,
    )
        .update(
      {
        "taskTitle": taskTitle,
        "taskDescription": taskDescription,
        "selectedDate": selectedDate,
      },
    );
  }

  static Future<void> signUp({
    String? emailAddress,
    String? password,
    String? name,
    String? age,
  }) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      UserModel user = UserModel(
        age: age,
        email: emailAddress,
        name: name,
        id: credential.user!.uid,
      );
      var collection = getUsersCollection();
      var docRef = collection.doc(credential.user!.uid);
      docRef.set(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(
        'wrong email or password',
      );
    }
  }
}
