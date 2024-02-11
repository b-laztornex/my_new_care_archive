import 'package:my_care_archives/core/authentication_manager.dart';
import 'package:my_care_archives/home_view.dart';
import 'package:my_care_archives/screens/home/home_screen.dart';
import 'package:my_care_archives/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return Obx(() {
      return _authManager.isLogged.value ? HomeScreen() : LoginScreen();
    });
  }
}
