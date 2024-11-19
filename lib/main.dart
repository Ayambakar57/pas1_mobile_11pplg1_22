import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pas1_mobile_11pplg1_22/Pages/login_page.dart';
import 'package:pas1_mobile_11pplg1_22/Pages/register_page.dart';

void main() async {
  // Ensure all Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GetStorage for local storage
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App PAS',
      
      
      initialRoute: '/register',
      
      
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
      ],
      
     
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
