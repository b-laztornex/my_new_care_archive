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
}
