import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_archives/model/activity/activity_model.dart';
import 'package:my_care_archives/model/user_model/client_model.dart';
import 'package:my_care_archives/model/user_model/user_model.dart';
import 'package:my_care_archives/model/input/input_form_model.dart';

List<ClientModel> patients = [
  ClientModel(
    id: 0,
    name: 'testMarco',
    surname: 'testMarco',
    birthday: DateTime.now(),
    telephone: 'testMarco',
    address: 'testMarco',
    diagnosed: 'testMarco',
    allergies: 'testMarco',
    otherAllergies: 'testMarco',
    lastVaccines: 'testMarco',
    healthService: 'testMarco',
    doctorName: 'testMarco',
    addressService: 'testMarco',
    subscriptionNumber: 'testMarco',
    serviceAddress: 'testMarco',
    representativeName: 'testMarco',
    representativeRelationship: 'testMarco',
    representativeEmail: 'testMarco',
    representativeTel: 'testMarco',
    representativeAddress: 'testMarco',
  ),
  ClientModel(
    id: 1,
    name: 'testAnais',
    surname: 'testAnais',
    birthday: DateTime.now(),
    telephone: 'testAnais',
    address: 'testAnais',
    diagnosed: 'testAnais',
    allergies: 'testAnais',
    otherAllergies: 'testAnais',
    lastVaccines: 'testAnais',
    healthService: 'testAnais',
    doctorName: 'testAnais',
    addressService: 'testAnais',
    subscriptionNumber: 'testAnais',
    serviceAddress: 'testAnais',
    representativeName: 'testAnais',
    representativeRelationship: 'testAnais',
    representativeEmail: 'testAnais',
    representativeTel: 'testAnais',
    representativeAddress: 'testAnais',
  ),
  ClientModel(
    id: 2,
    name: 'cliente2',
    surname: 'testMarco',
    birthday: DateTime.now(),
    telephone: 'testMarco',
    address: 'testMarco',
    diagnosed: 'testMarco',
    allergies: 'testMarco',
    otherAllergies: 'testMarco',
    lastVaccines: 'testMarco',
    healthService: 'testMarco',
    doctorName: 'testMarco',
    addressService: 'testMarco',
    subscriptionNumber: 'testMarco',
    serviceAddress: 'testMarco',
    representativeName: 'testMarco',
    representativeRelationship: 'testMarco',
    representativeEmail: 'testMarco',
    representativeTel: 'testMarco',
    representativeAddress: 'testMarco',
  ),
  ClientModel(
    id: 3,
    name: 'cliente2',
    surname: 'testMarco',
    birthday: DateTime.now(),
    telephone: 'testMarco',
    address: 'testMarco',
    diagnosed: 'testMarco',
    allergies: 'testMarco',
    otherAllergies: 'testMarco',
    lastVaccines: 'testMarco',
    healthService: 'testMarco',
    doctorName: 'testMarco',
    addressService: 'testMarco',
    subscriptionNumber: 'testMarco',
    serviceAddress: 'testMarco',
    representativeName: 'testMarco',
    representativeRelationship: 'testMarco',
    representativeEmail: 'testMarco',
    representativeTel: 'testMarco',
    representativeAddress: 'testMarco',
  ),
];

List<UserModel> clients = [];

List<String> inputsFormAccount = [
  'NAME',
  'SURNAME',
  'Birthday',
  'Telefon',
  'Email',
  'PASSWORD',
  'REPASSWORD'
];

List<InputFormModel> inputsFormFirstStep = [
  InputFormModel(inputText: 'NOMBRE DEL CLIENTE', type: FormInputType.text),
  InputFormModel(inputText: 'APELLIDOS DEL CLIENTE', type: FormInputType.text),
  InputFormModel(inputText: 'FECHA DE NACIMIENTO', type: FormInputType.date),
  InputFormModel(inputText: 'TELEFONO', type: FormInputType.phone),
  InputFormModel(inputText: 'DIRECCION', type: FormInputType.text),
];

List<InputFormModel> inputsFormSecondStep = [
  InputFormModel(
      inputText: 'CONDICIONES DIAGNOSTICADAS', type: FormInputType.text),
  InputFormModel(
      inputText: 'ALERGIAS A MEDICAMENTOS', type: FormInputType.text),
  InputFormModel(
      inputText: 'OTRAS ALERGIAS (ALIMENTOS, PICADURAS DE INSECTOS, OTROS)',
      type: FormInputType.text),
  InputFormModel(inputText: 'ULTIMAS VACUNAS', type: FormInputType.text),
  InputFormModel(
      inputText: 'SERVICIO DE SALUD/Nro SUBSCRIPCIÓN',
      type: FormInputType.text),
  InputFormModel(inputText: 'NOMBRE DEL MÉDICO', type: FormInputType.text),
  InputFormModel(
      inputText: 'DIRECCIÓN Y TELÉFONO DEL SERVICIO DE SALUD',
      type: FormInputType.text),
  InputFormModel(
      inputText: 'SERVICIO PRIVADO DE EMERGENCIAS/Nro SUBSCRIPCIÓN',
      type: FormInputType.text),
  InputFormModel(
      inputText: 'DIRECCIÓN Y TELÉFONO DEL SERVICIO DE EMERGENCIAS',
      type: FormInputType.text)
];

List<InputFormModel> inputsFormThirdStep = [
  InputFormModel(
      inputText: 'NOMBRE Y APELLIDO DE LA PERSONA AUTORIZADA POR EL CLIENTE 1',
      type: FormInputType.text),
  InputFormModel(
      inputText: 'PARENTESCO CON EL CLIENTE', type: FormInputType.text),
  InputFormModel(
      inputText: 'EMAIL DE LA PERSONA AUTORIZADA POR EL CLIENTE',
      type: FormInputType.text),
  InputFormModel(inputText: 'TELÉFONO', type: FormInputType.text),
  InputFormModel(inputText: 'DIRECCIÓN', type: FormInputType.text),
];

List<ActivityModel> menuList = [
  ActivityModel(
      name: "Register Client",
      nameRoute: "/registration",
      types: [],
      ic: Icons.verified_user),
  ActivityModel(name: "Tasks", nameRoute: "/tasks", types: [], ic: Icons.task),
  ActivityModel(
      name: "Profile",
      nameRoute: "/profile",
      types: [],
      ic: Icons.supervised_user_circle_sharp),
  ActivityModel(
      name: "Report", nameRoute: "/report", types: [], ic: Icons.cases),
  ActivityModel(
      name: "Tutorial", nameRoute: "/tutorial", types: [], ic: Icons.cases),
  ActivityModel(
      name: "Salir", nameRoute: "/logout", types: [], ic: Icons.cases),
];

List<ActivityModel> activitiesList = [
  ActivityModel(
      name: "Sleep",
      nameRoute: "",
      types: ['To Beed', 'Wake Up'],
      ic: Icons.supervisor_account),
  ActivityModel(
      name: "Hydration (ml)",
      nameRoute: "",
      types: ['500', '300', '200', '100', '75', '50'],
      ic: Icons.supervisor_account),
  ActivityModel(
      name: "Nutrition",
      nameRoute: "",
      types: ['Snack', 'Meal', 'Main', 'Pudding'],
      ic: Icons.supervisor_account),
  ActivityModel(
      name: "Mobility",
      nameRoute: "",
      types: ['Independent', 'Aided'],
      ic: Icons.supervisor_account),
  ActivityModel(
      name: "Personal Care",
      nameRoute: "",
      types: ['Assisted', 'Independent'],
      ic: Icons.supervisor_account),
  ActivityModel(
      name: "Skin Care",
      nameRoute: "",
      types: ['Body lotion', 'Barrier cream', 'Treatment'],
      ic: Icons.supervisor_account),
  ActivityModel(
      name: "Activities",
      nameRoute: "",
      types: ['Individual', 'Social'],
      ic: Icons.supervisor_account),
  ActivityModel(
      name: "Contact",
      nameRoute: "",
      types: ['Family', 'Friends', 'Medical Pro', 'Other'],
      ic: Icons.supervisor_account),
  ActivityModel(
      name: "Mood & Behaviour",
      nameRoute: "",
      types: ['Happy', 'Neutral', 'Sad', 'Anxious', 'Aggressive'],
      ic: Icons.supervisor_account),
  ActivityModel(
      name: "Event",
      nameRoute: "",
      types: [
        'Pain',
        'Trip',
        'Fall',
        'Wound',
        'Allergy',
        'Diarrhea',
        'Incontinence',
        'Bruise',
        'Sore',
        'Infection',
        'Unconsciousness',
        'Other'
      ],
      ic: Icons.supervisor_account),
  ActivityModel(
      name: "Medication",
      nameRoute: "",
      types: ['Assisted', 'Administered', 'Independent', 'Other'],
      ic: Icons.supervisor_account),
];
