// views/player_view.dart


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_22/Controller/api_controller.dart';


class HomeScreen extends StatelessWidget {
  final String teamId;

  const HomeScreen({super.key, required this.teamId});

  @override
  Widget build(BuildContext context) {
    final PlayerController controller = Get.put(PlayerController());

    return Scaffold(
      appBar: AppBar(title: const Text('Team Players',
      ),
      automaticallyImplyLeading: false,),
      backgroundColor: Color.fromARGB(255, 232, 188, 121),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.teams.isEmpty) {
          return const Center(child: Text('No teams found'));
        }

        return ListView.builder(
          itemCount: controller.teams.length,
          itemBuilder: (context, index) {
            final teams = controller.teams[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(teams.strBadge),
              ),
              title: Text(teams.strTeam),
              subtitle: Text(teams.strLeague),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.loadPlayers(teamId); 
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
