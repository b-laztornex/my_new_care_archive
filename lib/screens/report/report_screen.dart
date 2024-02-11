import 'package:intl/intl.dart';
import 'package:my_care_archives/components/global/app_bar_custom.dart';
import 'package:my_care_archives/components/icon_selection.dart';
import 'package:my_care_archives/controllers/base_controller.dart';
import 'package:my_care_archives/controllers/task_controller.dart';
import 'package:my_care_archives/model/activity/activity_model.dart';
import 'package:my_care_archives/model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_archives/model/report/report_model.dart';
import 'package:my_care_archives/utils/const.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  //final TaskController _taskController = Get.find();
  final TaskController _taskController = Get.put(TaskController());
  final f = new DateFormat('MM-dd hh:mm');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var p = _taskController.reportList;
    print(p);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff99CCCC),
        appBar: customAppBar('REPORTES', true, false),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() {
            print(_taskController.reportList);
            print(_taskController.clientName);
            return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                      color: Colors.transparent,
                    ),
                itemCount: _taskController.reportList.length,
                itemBuilder: (BuildContext context, int index) {
                  ReportModel rm = _taskController.reportList[index];
                  return GestureDetector(
                    onTap: () {
                      //c.addNewActivity(index);
                      Get.toNamed('/home');
                    },
                    child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.black54,
                                blurRadius: 1.0,
                                offset: Offset(0.0, 0.2))
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${rm.clientName}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54),
                            ),
                            Text(
                              '${rm.task}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black54),
                            ),
                            Text(
                              '${rm.subTask}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black54),
                            ),
                            Text(
                              f.format(rm.createdAt as DateTime),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black54),
                            ),
                          ],
                        )),
                  );
                });
          }),
        ),
      ),
    );
  }
}
