import 'package:flutter/material.dart';

class ReportModel {
  String? clientName;
  String? task;
  String? subTask;
  IconData? ic;
  DateTime? createdAt;
  ReportModel(
      {this.clientName, this.task, this.subTask, this.ic, this.createdAt});
}
