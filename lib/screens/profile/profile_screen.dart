import 'package:intl/intl.dart';
import 'package:my_care_archives/model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_archives/model/user_model/client_model.dart';
import 'package:my_care_archives/screens/registration/show_registration_screen.dart';
import 'package:my_care_archives/utils/const.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  //final BaseController c = Get.find();
  List<dynamic> reportList = [];
  int? currentPatientId = patients[0].id;
  late ClientModel currentPatient = patients[0];
  bool isVisible = false;

  LoginViewModel _viewModel = Get.put(LoginViewModel());
  final f = new DateFormat('MM-dd hh:mm');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      reportList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff99CCCC),
        appBar: // here the desired height
            AppBar(
          backgroundColor: Color(0xff99CCCC),
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            'PERFIL DEL CLIENTE',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                )),
          ],
          //_foProfileScreenType == FormType.login ? Text('Login') : Text('Register'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 100.0,
                child: Scrollbar(
                  controller: _scrollController,
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    padding: const EdgeInsets.all(8),
                    itemCount: patients.length,
                    itemBuilder: (BuildContext context, int index) {
                      ClientModel patient = patients[index];
                      return GestureDetector(
                        onTap: () {
                          //c.addNewActivity(index);
                          //Get.toNamed('/home');
                          //Get.toNamed('show_registration');
                          setState(() {
                            currentPatientId = patient.id;
                            currentPatient = patient;
                          });
                        },
                        child: Container(
                          height: 30.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.0),
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  color: currentPatientId == patient.id
                                      ? Color(0xffFFDE58)
                                      : Colors.white,
                                ),
                                child: Text(
                                  '${patient.name?[0]}  ${patient.surname?[0]}  ${patient.id}',
                                  style: TextStyle(fontSize: 10.0),
                                ),
                              ),
                              Visibility(
                                visible: currentPatientId == patient.id,
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        shape: BoxShape.circle,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 10.0,
                                              offset: Offset(0.0, 0.75))
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        size: 15.0,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    Container(
                                      width: 30.0,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow,
                                        shape: BoxShape.circle,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Colors.black54,
                                              blurRadius: 10.0,
                                              offset: Offset(0.0, 0.75))
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.delete_forever,
                                        size: 15.0,
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: !isVisible,
                child: TextFormField(
                  validator: (value) {
                    return (value == null || value.isEmpty)
                        ? 'Please Enter Password'
                        : null;
                  },
                  decoration: inputDecoration('Password', Icons.lock),
                ),
              ),
              Visibility(
                visible: !isVisible,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      isVisible = true;
                    });
                  },
                  child: Text(
                    'Mostrar detalles',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              Visibility(
                visible: isVisible,
                child: ShowRegistrationScreen(currentPatient: currentPatient),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
