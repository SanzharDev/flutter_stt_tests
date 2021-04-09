import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final kRecordCardBoxDecoration = BoxDecoration(
  color: Colors.grey.shade200,
  borderRadius: BorderRadius.circular(20.0),
  boxShadow: [
    BoxShadow(
      offset: Offset(0.0, 2.5),
      blurRadius: 5.0,
      spreadRadius: 2.0,
      color: Colors.grey.shade400,
    ),
  ],
);

final kRecordTitleCardTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16.0,
);
