import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:pas1_mobile_11pplg1_22/API/ApiService_register.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  final ApiService _apiService = ApiService();
  final storage = GetStorage();

  Future<void> registerUser(String username, String password, String fullName, String email) async {
   
    if (username.isEmpty || password.isEmpty || fullName.isEmpty || email.isEmpty) {
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    isLoading.value = true;
    try {
      final result = await _apiService.registerUser(username, password, fullName, email);
      isLoading.value = false; 

      
      if (result['token'] != null) {
        String token = result['token'];
        storage.write('authToken', token); 
        Get.snackbar('Success', 'Registration successful: Token saved');

        await Future.delayed(Duration(seconds: 1)); 
      } else {
        Get.snackbar('Success', 'Registration successful. Please log in.');
        
        await Future.delayed(Duration(seconds: 1)); 
        Get.toNamed('/login');
      }
    } catch (e) {
      isLoading.value = false; 
      Get.snackbar('Error', 'Registration failed: $e');
    }
  }
}
