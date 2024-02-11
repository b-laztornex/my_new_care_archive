import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserModel {
  RxInt? id = 0.obs;
  RxString? name = ''.obs;
  RxString? surname = ''.obs;
  RxString? email = ''.obs;
  RxString? password = ''.obs;

  UserModel({this.id, this.name, this.surname, this.email, this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'].obs,
      name: map['name'].obs,
      surname: map['surname'].obs,
      email: map['email'].obs,
      password: map['password'].obs,
    );
  }
}
