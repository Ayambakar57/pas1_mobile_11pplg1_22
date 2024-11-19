import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pas1_mobile_11pplg1_22/API/ApiService_register.dart';
import 'package:pas1_mobile_11pplg1_22/Pages/home_pages.dart';


class LoginController extends GetxController {
  var isLoading = false.obs;
  final ApiService _apiService = ApiService();
  final storage = GetStorage();

  Future<void> loginUser(String username, String password) async {
    isLoading.value = true;
    try {
      final result = await _apiService.loginUser(username, password);
      isLoading.value = false;

      if (result['token'] != null) {
        String token = result['token'];
        storage.write('authToken', token);
        Get.snackbar('Success', 'Login successful');
        Get.to(MainPage());
      } else {
        Get.snackbar('Error', result['message'] ?? 'Login failed');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Login failed: $e');
    }
  }
}
