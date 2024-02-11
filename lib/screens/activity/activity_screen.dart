import 'package:my_care_archives/components/icon_selection.dart';
import 'package:my_care_archives/controllers/base_controller.dart';
import 'package:my_care_archives/controllers/task_controller.dart';
import 'package:my_care_archives/model/activity/activity_model.dart';
import 'package:my_care_archives/model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_archives/model/report/report_model.dart';
import 'package:my_care_archives/utils/const.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final BaseController c = Get.find();
  final TaskController _taskController = Get.put(TaskController());

  late final ActivityModel am;

  LoginViewModel _viewModel = Get.put(LoginViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      am = activitiesList[c.idx.value];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff99CCCC),
        appBar: // here the desired height
            AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: Text(
            '${am.name}',
            style: TextStyle(color: Colors.black45),
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
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black26,
                    ),
                padding: const EdgeInsets.all(8),
                itemCount: am.types.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _taskController.addReport(ReportModel(
                          task: am.name,
                          subTask: am.types[index],
                          ic: am.ic,
                          createdAt: DateTime.now()));
                      Get.toNamed('/home');
                    },
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.amber,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black54,
                              blurRadius: 5.0,
                              offset: Offset(0.0, 0.75))
                        ],
                      ),
                      child: Text(
                        '${am.types[index]}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black54),
                      ),
                    ),
                  );
                })),
      ),
    );
  }
}
