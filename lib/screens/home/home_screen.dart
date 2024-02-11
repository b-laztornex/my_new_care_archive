import 'package:my_care_archives/components/global/app_bar_custom.dart';
import 'package:my_care_archives/components/icon_selection.dart';
import 'package:my_care_archives/controllers/base_controller.dart';
import 'package:my_care_archives/model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_archives/utils/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginViewModel _viewModel = Get.put(LoginViewModel());
  final BaseController c = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff99CCCC),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black45,
          onPressed: () {
            Get.toNamed('/report');
          },
          child: Icon(Icons.document_scanner_sharp),
        ),
        appBar: customAppBar('INICIO', false, false),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: menuList.length,
              itemBuilder: (BuildContext context, var index) {
                return GestureDetector(
                    onTap: () {
                      //c.setActivityId(index);
                      //Get.toNamed('/activity');
                      Get.toNamed(menuList[index].nameRoute);
                    },
                    child: IconSelection(
                        width: 70.0,
                        height: 70.0,
                        bg: Colors.amber,
                        singleActivity: menuList[index]));
              }),
        ),
      ),
    );
  }
}
