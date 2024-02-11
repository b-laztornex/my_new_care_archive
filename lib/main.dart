import 'package:flutter/material.dart';
import 'package:my_care_archives/routes.dart';
import 'package:my_care_archives/splash_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Care Archives',
      initialRoute: '/',
      getPages: Routes.getRoutes(),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        timePickerTheme: TimePickerThemeData(
          backgroundColor: Colors.blueGrey,
          hourMinuteShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(color: Colors.orange, width: 4),
          ),
          dayPeriodBorderSide: const BorderSide(color: Colors.orange, width: 4),
          dayPeriodColor: Colors.blueGrey.shade600,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(color: Colors.orange, width: 4),
          ),
          dayPeriodTextColor: Colors.white,
          dayPeriodShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(color: Colors.orange, width: 4),
          ),
          hourMinuteColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? Colors.orange
                  : Colors.blueGrey.shade800),
          hourMinuteTextColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? Colors.white
                  : Colors.orange),
          dialHandColor: Colors.blueGrey.shade700,
          dialBackgroundColor: Colors.blueGrey.shade800,
          hourMinuteTextStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          dayPeriodTextStyle:
              const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          helpTextStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(0),
          ),
          dialTextColor: MaterialStateColor.resolveWith((states) =>
              states.contains(MaterialState.selected)
                  ? Colors.orange
                  : Colors.white),
          entryModeIconColor: Colors.orange,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Colors.yellow, //  <-- light color
          textTheme:
              ButtonTextTheme.primary, //  <-- dark text for light background
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xffFFDE58))),
        ),
      ),
      home: SplashView(),
    );
  }
}
