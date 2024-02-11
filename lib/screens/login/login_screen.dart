import 'package:my_care_archives/components/global/input_custom_text.dart';
import 'package:my_care_archives/model/input/input_form_model.dart';
import 'package:my_care_archives/model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final LoginViewModel _viewModel = Get.put(LoginViewModel());

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff99CCCC),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: _formType == FormType.login ? loginForm() : registerForm(),
        ),
      ),
    );
  }

  Form loginForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(height: 100.0),
        Image.asset(
          'assets/images/logo.png',
          height: 120,
        ),
        const SizedBox(height: 160.0),
        InputCustomText(
          ctrl: emailCtr,
          text: 'Email',
          type: FormInputType.email,
        ),
        const SizedBox(
          height: 10,
        ),
        InputCustomText(
          ctrl: passwordCtr,
          text: 'Password',
          type: FormInputType.password,
        ),
        const SizedBox(height: 50.0),
        TextButton(
          onPressed: () {
            //setState(() {
            //  _formType = FormType.register;
            //});
            Get.toNamed('/account');
          },
          child: const Text(
            'Does not have an account?',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _formType = FormType.register;
            });
          },
          child: const Text(
            'Recover Password',
            style: TextStyle(color: Colors.black),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate() ?? false) {
                    await _viewModel.loginUser(emailCtr.text, passwordCtr.text);
                  }
                },
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Form registerForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InputCustomText(
            ctrl: emailCtr,
            text: 'Email',
            type: FormInputType.email,
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(height: 20.0),
          TextButton(
            onPressed: () {
              setState(() {
                _formType = FormType.login;
              });
            },
            child: Text('Recuperar Cuenta'),
          ),
          SizedBox(height: 20.0),
          TextButton(
            onPressed: () {
              setState(() {
                _formType = FormType.login;
              });
            },
            child: Text('Regresar'),
          )
        ],
      ),
    );
  }
}

enum FormType { login, register }
