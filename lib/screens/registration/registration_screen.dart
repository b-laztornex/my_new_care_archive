import 'package:my_care_archives/components/global/custom_alert.dart';
import 'package:my_care_archives/components/global/input_custom_text.dart';
import 'package:my_care_archives/components/registration/progress_bar.dart';
import 'package:my_care_archives/model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_archives/utils/const.dart';
import 'package:my_care_archives/model/input/input_form_model.dart';
import 'package:email_validator/email_validator.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginViewModel _viewModel = Get.put(LoginViewModel());
  List<List<TextEditingController>> _controller = [];
  TextEditingController passwordCtr = TextEditingController();
  int step = 0;

  var formInputs = [
    inputsFormFirstStep,
    inputsFormSecondStep,
    inputsFormThirdStep
  ];

  getFormInputs(currentStep) {
    return Visibility(
        visible: currentStep == step,
        child: Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: formInputs[currentStep].length,
            itemBuilder: (_, index) {
              return Column(
                children: [
                  const SizedBox(height: 10.0),
                  InputCustomText(
                    ctrl: _controller[currentStep][index],
                    text: formInputs[currentStep][index].inputText,
                    type: formInputs[currentStep][index].type,
                  ),
                  const SizedBox(height: 5.0),
                ],
              );
            },
          ),
        ));
  }

  @override
  void initState() {
    List<List<TextEditingController>> tmpController = [[], [], []];

    for (var i = 0; i <= 2; i++) {
      tmpController[i] = [
        for (int j = 0; j <= formInputs[i].length; j++) TextEditingController()
      ];
    }

    setState(() {
      _controller = tmpController;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff99CCCC),
        appBar: // here the desired height
            AppBar(
          backgroundColor: Colors.white.withOpacity(0.6),
          leading: InkWell(
            onTap: () {
              Get.toNamed('/home');
            },
            child: Image.asset(
              'assets/images/logo.png',
              height: 50,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.search,
                    size: 26.0,
                    color: Colors.black45,
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.black45,
                  ),
                )),
          ],
          //_formType == FormType.login ? Text('Login') : Text('Register'),
        ),
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
                  Text(
                    'Registro de Clientes'.toUpperCase(),
                    style: const TextStyle(color: Colors.black45),
                  ),
                  const SizedBox(height: 30.0),
                  ProgressBar(
                    step: step,
                  ),
                  const SizedBox(height: 20.0),
                  getFormInputs(0),
                  getFormInputs(1),
                  getFormInputs(2),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: step > 0,
                        child: ElevatedButton(
                            onPressed: () async {
                              int currentStep = step - 1;
                              setState(() {
                                step = currentStep;
                              });
                            },
                            child: const Icon(Icons.keyboard_arrow_left_rounded,
                                color: Colors.black)),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xffFFDE58), // Background color
                        ),
                        onPressed: () async {
                          int currentStep = step + 1;
                          if (formKey.currentState?.validate() ?? false) {
                            //await _viewModel.loginUser(emailCtr.text, passwordCtr.text);
                            if (currentStep > 2) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Los Datos del cliente se han guardado Correctamente.')),
                              );
                              Get.toNamed('home');
                            } else {
                              setState(() {
                                step = currentStep;
                              });
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Hay errores en su formulario.')),
                            );
                          }
                        },
                        child: step >= 2
                            ? Text(
                                'Guardar Cambios'.toUpperCase(),
                                style: const TextStyle(color: Colors.black),
                              )
                            : const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Colors.black,
                              ),
                      ),
                    ],
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

InputDecoration inputDecoration(String? labelText, IconData iconData,
    {String? prefix, String? helperText}) {
  return InputDecoration(
    contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    helperText: helperText,
    labelText: labelText,
    labelStyle: const TextStyle(color: Colors.grey),
    fillColor: Colors.grey.shade200,
    filled: true,
    prefixText: prefix,
    prefixIconConstraints: const BoxConstraints(minWidth: 60),
    focusedBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
    errorBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  );
}

bool _isNumeric(String result) {
  if (result == null) {
    return false;
  }
  return double.tryParse(result) != null;
}
