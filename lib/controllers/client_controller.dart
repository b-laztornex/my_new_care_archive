import 'package:get/get.dart';
import 'package:my_care_archives/controllers/base_controller.dart';
import 'package:my_care_archives/model/user_model/user_model.dart';

class ClientController extends BaseController {
  // Create a reactive UserModel instance
  late UserModel? user;

  Future<UserModel?> getClient(String username, String password) async {
    try {
      user = await dbHelper.authUser(username, password);
      return user;
    } catch (e) {
      Get.snackbar('Error', 'Error while getting client is $e');
      return null;
    }
  }

  Future<void> addClient(UserModel user) async {
    try {
      await dbHelper.insertUser(user);
    } catch (e) {
      Get.snackbar('Error', 'Error while getting client is $e');
    }
  }
}