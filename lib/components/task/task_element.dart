import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_care_archives/components/global/custom_dialog.dart';
import 'package:my_care_archives/components/global/input_tag_selection.dart';
import 'package:my_care_archives/controllers/base_controller.dart';
import 'package:my_care_archives/controllers/task_controller.dart';
import 'package:my_care_archives/model/activity/activity_model.dart';
import 'package:my_care_archives/model/report/report_model.dart';

import 'package:textfield_tags/textfield_tags.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TaskElement extends StatefulWidget {
  final ActivityModel activity;
  const TaskElement({
    super.key,
    required this.activity,
  });
  @override
  State<StatefulWidget> createState() => _TaskElementState();
}

class _TaskElementState extends State<TaskElement> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final BaseController c = Get.put(BaseController());
  final TaskController _taskController = Get.put(TaskController());

  bool showElements = false;

  @override
  void initState() {
    super.initState();
    print(widget.activity);
    // Instead of create one by one each controller for each input
    // we pre generated them and appened to a list
    List<TextEditingController> _tmpController = [
      for (int i = 0; i < 10; i++) TextEditingController()
    ];
  }

  getSettingElement(String title, labelList,
      {List<String> subLabelList = const []}) {
    List<double> upperList = [];
    List<double> downList = [];

    double screenWidth = MediaQuery.of(context).size.width - 60;

    double labelListWidth = 0;
    double downListWidth = 0;

    if (labelList != null) {
      labelListWidth = screenWidth / labelList.length!;
      for (int i = 0; i <= labelList.length!; i++) {
        upperList.add(labelListWidth);
      }
    }
    if (subLabelList.isNotEmpty) {
      downListWidth = screenWidth / subLabelList.length;
      for (int j = 0; j <= subLabelList.length; j++) {
        downList.add(downListWidth);
      }
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ToggleSwitch(
            dividerMargin: 0.0,
            isVertical: true,
            //customWidths: upperList,
            //minWidth: MediaQuery.of(context).size.width / 2,
            animate: false,
            fontSize: 10.0,
            initialLabelIndex: 0,
            totalSwitches: labelList?.length,
            labels: labelList,
            inactiveBgColor: const Color(0xffB5B0B0),
            activeBgColor: const [Color(0xffFFDE58)],
            onToggle: (index) {},
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        subLabelList.isNotEmpty
            ? Container(
                padding: const EdgeInsets.all(3.0),
                width: MediaQuery.of(context).size.width,
                color: Colors.black45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ToggleSwitch(
                  cornerRadius: 50.0,
                  fontSize: 10.0,
                  minWidth: 300,
                  initialLabelIndex: 0,
                  totalSwitches: subLabelList.length,
                  labels: subLabelList,
                  inactiveBgColor: const Color(0xffB5B0B0),
                  activeBgColor: const [Color(0xffFFDE58)],
                  customWidths: downList,
                  onToggle: (index) {
                    //print('switched to: $index');
                  },
                ),
              )
            : Container(),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  displaySubTasksdefault(name, types) {
    //List<String>? tp = types;

    List<String>? myList = [];

    for (int i = 0; i < types.length!; i++) {
      myList.add(types[i]);
    }

    if (types != null) {
      return getSettingElement('Idiomas', myList
          //types as List<String>?,
          );
    } else {
      return Container();
    }
  }

  displaySubTasks() {
    return Visibility(
      visible: showElements,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.activity.types.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              //c.setActivityId(index);
              //Get.toNamed('/activity');
              //Get.toNamed(menuList[index].nameRoute);

              TimeOfDay? pickedDate = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: true),
                    child: child ?? Container(),
                  );
                },
              );

              if (pickedDate != null) {
                final now = DateTime.now();
                DateTime currentDateTime = DateTime(now.year, now.month,
                    now.day, pickedDate.hour, pickedDate.minute);
                _taskController.addReport(ReportModel(
                    task: widget.activity.name,
                    subTask: widget.activity.types[index],
                    ic: widget.activity.ic,
                    createdAt: currentDateTime));
              } else {
                print("Date is not selected");
              }
            },
            child: Container(
              padding: EdgeInsets.only(left: 20.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Container(
                padding: EdgeInsets.all(10.0),
                color: Color(0xffFFDE58),
                child: Text('${widget.activity.types[index]}'),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> dynamicInputs = [];
    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                showElements = !showElements;
              });
            },
            child: Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${widget.activity.name}'),
                  Icon(
                      !showElements ? Icons.arrow_downward : Icons.arrow_upward,
                      color: Colors.grey,
                      size: 12.0),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white54,
              ),
            ),
          ),
          Visibility(
            visible: showElements,
            child: Row(
              children: [
                displaySubTasksdefault(
                    widget.activity.name!, widget.activity.types),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.black45, width: 1.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
