import 'package:my_care_archives/components/global/app_bar_custom.dart';
import 'package:my_care_archives/components/registration/progress_bar.dart';
import 'package:my_care_archives/model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_archives/utils/const.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginViewModel _viewModel = Get.put(LoginViewModel());
  List<TextEditingController> _controller = [];
  TextEditingController passwordCtr = TextEditingController();
  int step = 0;

  getFormInputs() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: inputsFormAccount.length,
        itemBuilder: (_, index) {
          return Column(
            children: [
              SizedBox(height: 10.0),
              TextFormField(
                controller: _controller[index],
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Please Enter Email'
                      : null;
                },
                decoration:
                    inputDecoration(inputsFormAccount[index], Icons.person),
              ),
              SizedBox(height: 5.0),
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff99CCCC),
        appBar: customAppBar('Crear Cuenta', true, false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Form(
            //autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0),
                  getFormInputs(),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: () async {
                      int currentStep = step + 1;
                      if (currentStep > 2) {
                        Get.toNamed('login');
                      } else {
                        setState(() {
                          step = currentStep;
                        });
                      }

                      if (formKey.currentState?.validate() ?? false) {
                        //await _viewModel.loginUser(emailCtr.text, passwordCtr.text);
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          'Next',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration inputDecoration(String labelText, IconData iconData,
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
