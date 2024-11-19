// controllers/player_controller.dart


import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_22/API/ApiService.dart';
import 'package:pas1_mobile_11pplg1_22/Widgets/PostModel.dart';


class PlayerController extends GetxController {
  final ApiService _apiService = ApiService();

  var teams= <PlayerModel>[].obs; 
  var isLoading = false.obs;        

  @override
  void onInit() {
    super.onInit();
    loadPlayers('133604'); 
  }

  Future<void> loadPlayers(String teamId) async {
    isLoading.value = true;

    try {
      final fetchedPlayers = await _apiService.fetchPlayers(teamId);
      teams.value = fetchedPlayers;
    } catch (e) {
      Get.snackbar('Error', 'Failed to load players');
    } finally {
      isLoading.value = false;
    }
  }
}
