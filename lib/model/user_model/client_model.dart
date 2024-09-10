import 'package:flutter/material.dart';

class ClientModel {
  int? id;

  String? name;
  String? surname;
  DateTime? birthday;
  String? telephone;
  String? address;
  String? diagnosed;
  String? allergies;
  String? otherAllergies;
  String? lastVaccines;
  String? healthService;
  String? doctorName;
  String? addressService;
  String? subscriptionNumber;
  String? serviceAddress;
  String? representativeName;
  String? representativeRelationship;
  String? representativeEmail;
  String? representativeTel;
  String? representativeAddress;

  ClientModel({
    this.id,
    this.name,
    this.surname,
    this.birthday,
    this.telephone,
    this.address,
    this.diagnosed,
    this.allergies,
    this.otherAllergies,
    this.lastVaccines,
    this.healthService,
    this.doctorName,
    this.addressService,
    this.subscriptionNumber,
    this.serviceAddress,
    this.representativeName,
    this.representativeRelationship,
    this.representativeEmail,
    this.representativeTel,
    this.representativeAddress,
  });

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'].obs,
      name: map['name'].obs,
      surname: map['surname'].obs,
      birthday: map['birthday'].obs,
      telephone: map['telephone'].obs,
      address: map['address'].obs,
      diagnosed: map['diagnosed'].obs,
      allergies: map['allergies'].obs,
      otherAllergies: map['otherAllergies'].obs,
      lastVaccines: map['lastVaccines'].obs,
      healthService: map['healthService'].obs,
      doctorName: map['doctorName'].obs,
      addressService: map['addressService'].obs,
      subscriptionNumber: map['subscriptionNumber'].obs,
      serviceAddress: map['serviceAddress'].obs,
      representativeName: map['representativeName'].obs,
      representativeRelationship: map['representativeRelationship'].obs,
      representativeEmail: map['representativeEmail'].obs,
      representativeTel: map['representativeTel'].obs,
      representativeAddress: map['representativeAddress'].obs,
    );
  }
}
