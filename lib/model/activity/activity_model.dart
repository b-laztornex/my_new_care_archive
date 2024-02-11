import 'package:flutter/material.dart';

class ActivityModel {
  String? name;
  String nameRoute;
  List<String?> types;
  IconData ic;
  ActivityModel(
      {this.name,
      required this.nameRoute,
      required this.types,
      required this.ic});
}
