import 'package:my_care_archives/components/global/app_bar_custom.dart';
import 'package:my_care_archives/components/global/custom_dialog.dart';
import 'package:my_care_archives/controllers/base_controller.dart';
import 'package:my_care_archives/model/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final LoginViewModel _viewModel = Get.put(LoginViewModel());
  final BaseController c = Get.put(BaseController());

  getSettingElement(String title, List<String> labelList,
      {List<String> subLabelList = const []}) {
    List<double> upperList = [];
    List<double> downList = [];

    double screenWidth = MediaQuery.of(context).size.width - 60;

    double labelListWidth = 0;
    double downListWidth = 0;

    if (labelList.isNotEmpty) {
      labelListWidth = screenWidth / labelList.length;
      for (int i = 0; i <= labelList.length; i++) {
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
        Row(
          children: [
            Text(title),
            const SizedBox(
              width: 10.0,
            ),
            const CustomDialog()
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: ToggleSwitch(
              cornerRadius: 50.0,
              dividerMargin: 0.0,
              customWidths: upperList,
              animate: false,
              fontSize: 10.0,
              initialLabelIndex: 0,
              totalSwitches: labelList.length,
              labels: labelList,
              inactiveBgColor: const Color(0xffB5B0B0),
              activeBgColor: const [Color(0xffFFDE58)],
              onToggle: (index) {},
            ),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        subLabelList.isNotEmpty
            ? Container(
                padding: const EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: ToggleSwitch(
                  cornerRadius: 50.0,
                  fontSize: 10.0,
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff99CCCC),
        appBar: customAppBar('AJUSTES', true, false),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getSettingElement(
                'Seguridad',
                ['20m', '30m', '60m', '90m'],
              ),
              getSettingElement(
                'Idiomas',
                ['Español', 'English', 'Deutsch'],
              ),
              getSettingElement(
                'Sonido',
                ['Activo', 'Inactivo'],
              ),
              getSettingElement(
                'Volumen',
                ['Ml', 'Oz'],
              ),
              getSettingElement(
                'Recordatorio del Reporte',
                ['L', 'M', 'M', 'J', 'V', 'S', 'D'],
                subLabelList: ['10:00', '13:00', '16:00', '19:00'],
              ),
              getSettingElement(
                'Notificaciones',
                ['Activo', 'Inactivo'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
