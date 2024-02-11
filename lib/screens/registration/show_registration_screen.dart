import 'package:my_care_archives/components/registration/progress_bar.dart';
import 'package:my_care_archives/model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_archives/model/user_model/client_model.dart';
import 'package:my_care_archives/utils/const.dart';

class ShowRegistrationScreen extends StatefulWidget {
  final ClientModel currentPatient;
  const ShowRegistrationScreen({Key? key, required this.currentPatient})
      : super(key: key);

  @override
  _ShowRegistrationScreenState createState() => _ShowRegistrationScreenState();
}

class _ShowRegistrationScreenState extends State<ShowRegistrationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginViewModel _viewModel = Get.put(LoginViewModel());
  List<TextEditingController> _controller = [];
  TextEditingController passwordCtr = TextEditingController();

  var formInputs =
      inputsFormFirstStep + inputsFormSecondStep + inputsFormThirdStep;

  getPatientInfo(idx) {
    switch (idx) {
      case 0:
        return widget.currentPatient.name;
      case 1:
        return widget.currentPatient.surname;
      case 2:
        return widget.currentPatient.birthday.toString();
      case 3:
        return widget.currentPatient.telephone;
      case 4:
        return widget.currentPatient.address;
      case 5:
        return widget.currentPatient.diagnosed;
      case 6:
        return widget.currentPatient.allergies;
      case 7:
        return widget.currentPatient.otherAllergies;
      case 8:
        return widget.currentPatient.lastVaccines;
      case 9:
        return widget.currentPatient.healthService;
      case 10:
        return widget.currentPatient.doctorName;
      case 11:
        return widget.currentPatient.addressService;
      case 12:
        return widget.currentPatient.subscriptionNumber;
      case 13:
        return widget.currentPatient.serviceAddress;
      case 14:
        return widget.currentPatient.representativeName;
      case 15:
        return widget.currentPatient.representativeRelationship;
      case 16:
        return widget.currentPatient.representativeEmail;
      case 17:
        return widget.currentPatient.representativeTel;
      case 18:
        return widget.currentPatient.representativeAddress;
      default:
        return 0;
    }
  }

  getFormInputs() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: formInputs.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              const SizedBox(height: 10.0),
              TextFormField(
                //controller: _controller[index],
                initialValue: getPatientInfo(index),
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Please Enter Email'
                      : null;
                },
                decoration:
                    inputDecoration(formInputs[index].inputText, Icons.person),
              ),
              const SizedBox(height: 5.0),
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    List<TextEditingController> _tmpController = [
      for (int i = 0; i <= 10; i++) TextEditingController()
    ];

    setState(() {
      _controller = _tmpController;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('keyList${widget.currentPatient.id}'),
      child: getFormInputs(),
    );
  }
}

InputDecoration inputDecoration(String? labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIcon: Icon(
      iconData,
      size: 20,
    ),
    prefixIconConstraints: BoxConstraints(minWidth: 60),
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    errorBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    border:
        OutlineInputBorder(borderSide: BorderSide(color: Color(0xffFFDE58))),
  );
}
