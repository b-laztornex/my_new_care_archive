import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_care_archives/core/db_helper.dart';
import 'package:my_care_archives/model/user_model/client_model.dart';
import 'package:my_care_archives/model/user_model/user_model.dart';
import '../model/report/report_model.dart';

class TaskController extends GetxController {
  late final DBHelper databaseHelper;
  var loading = true.obs;
  RxList<ClientModel> clients = <ClientModel>[].obs;

  var reportList = [].obs;
  var clientName = ''.obs;

  @override
  Future<void> onInit() async {
    databaseHelper = DBHelper();
    super.onInit();

    //_authManager = Get.put(AuthenticationManager());
  }

  Future<void> initialize() async {
    await databaseHelper.initDatabase();
  }

  Future<void> setClient(String cl) async {
    try {
      clientName.value = cl;
      print(clientName);
      //Get.snackbar(cl, 'Client was added correctly.');
    } catch (e) {
      Get.snackbar('Error', 'Error while getting client is $e');
    }
  }

  Future<void> addReport(ReportModel report) async {
    try {
      report.clientName = clientName.value;
      reportList.add(report);
      reportList.refresh();

      print(reportList.length);
      //Get.snackbar('Report', 'Report was added correctly.');
    } catch (e) {
      Get.snackbar('Error', 'Error while getting data is $e');
    }
  }
}
