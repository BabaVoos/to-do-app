import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension MediaQueryHelper on BuildContext {
  double get screenHeight => MediaQuery.of(
    this,
  ).size.height;

  double get screenWidth => MediaQuery.of(
    this,
  ).size.width;
}

extension NavigatorHelper on BuildContext {
  void pushNamed({
    String? widget,
    Object? arguments,
  }) {
    Navigator.of(
      this,
    ).pushNamed(
      widget!,
      arguments: arguments,
    );
  }

  void pushReplacementNamed(
    String widget,
  ) {
    Navigator.of(
      this,
    ).pushReplacementNamed(
      widget,
    );
  }
}

String timestampFormatter(
  Timestamp date,
) {
  String formattedDate = DateFormat(
    'MMMMEEEEd',
  ).format(date.toDate()).toString();
  return formattedDate;
}

String dateFormatter(
  DateTime dateTime,
) {
  String formattedDate = DateFormat.MMMEd().format(dateTime).toString();
  return formattedDate;
}
