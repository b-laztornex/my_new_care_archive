import 'package:get/get.dart';
import 'package:my_care_archives/screens/activity/activity_screen.dart';
import 'package:my_care_archives/screens/login/login_screen.dart';
import 'package:my_care_archives/screens/home/home_screen.dart';
import 'package:my_care_archives/screens/profile/profile_screen.dart';
import 'package:my_care_archives/screens/registration/account_screen.dart';
import 'package:my_care_archives/screens/registration/registration_screen.dart';
import 'package:my_care_archives/screens/registration/show_registration_screen.dart';
import 'package:my_care_archives/screens/report/report_screen.dart';
import 'package:my_care_archives/screens/settings/settings_screen.dart';
import 'package:my_care_archives/screens/task/task_screen.dart';
import 'package:my_care_archives/splash_view.dart';

class Routes {
  static List<GetPage<dynamic>>? getRoutes() {
    return [
      GetPage(name: '/', page: () => SplashView()),
      GetPage(name: '/home', page: () => const HomeScreen()),
      GetPage(name: '/login', page: () => const LoginScreen()),
      GetPage(name: '/activity', page: () => const ActivityScreen()),
      GetPage(name: '/report', page: () => const ReportScreen()),
      GetPage(name: '/tasks', page: () => const TaskScreen()),
      GetPage(name: '/profile', page: () => const ProfileScreen()),
      GetPage(name: '/registration', page: () => const RegistrationScreen()),
      GetPage(name: '/account', page: () => const AccountScreen()),
      GetPage(name: '/settings', page: () => const SettingsScreen()),
    ];
  }
}
