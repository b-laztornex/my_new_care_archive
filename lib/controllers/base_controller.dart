import 'package:get/get.dart';
import 'package:my_care_archives/model/report/report_model.dart';
import 'package:my_care_archives/core/db_helper.dart';

class BaseController extends GetxController {
  DBHelper dbHelper = DBHelper();
  var idx = 0.obs;
  //var reportList = [].obs;
  setActivityId(id) => idx.value = id;

  @override
  Future<void> onInit() async {
    await dbHelper.initDatabase();
    super.onInit();
  }
}
