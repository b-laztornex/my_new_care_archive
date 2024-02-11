import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar customAppBar(String title, bool showBackButton, bool enableSearch) {
  return AppBar(
    backgroundColor: Color(0xff99CCCC),
    automaticallyImplyLeading: showBackButton,
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
    title: Text(
      title,
      style: const TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    elevation: 0,
    actions: <Widget>[
      Visibility(
        visible: enableSearch,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {},
            child: const Icon(
              Icons.search,
              size: 25.0,
              color: Colors.black,
            ),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
            onTap: () {
              Get.toNamed('/settings');
            },
            child: const Icon(
              Icons.settings,
              size: 25.0,
              color: Colors.black,
            ),
          )),
    ],
    //_formType == FormType.login ? Text('Login') : Text('Register'),
  );
}
