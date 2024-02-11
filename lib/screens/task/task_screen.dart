import 'package:my_care_archives/components/task/task_element.dart';
import 'package:my_care_archives/controllers/base_controller.dart';
import 'package:my_care_archives/model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_archives/utils/const.dart';

import '../../controllers/task_controller.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  LoginViewModel _viewModel = Get.put(LoginViewModel());
  final TaskController _taskController = Get.put(TaskController());

  final BaseController c = Get.put(BaseController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff99CCCC),
        appBar: // here the desired height
            AppBar(
          backgroundColor: Color(0xff99CCCC),
          leading: IconButton(
            onPressed: () {
              Get.toNamed('/home');
            },
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            //replace with our own icon data.
          ),
          title: Text(
            'Tasks',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(30, (int index) {
                    return ElevatedButton(
                      onPressed: () {
                        _taskController.setClient("Clien $index");
                      },
                      child: Container(
                        height: 20.0,
                        child: Center(
                          child: Text("Clien $index"),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: activitiesList.length,
                  itemBuilder: (BuildContext context, var index) {
                    return TaskElement(activity: activitiesList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
