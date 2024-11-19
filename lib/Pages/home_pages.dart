import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_22/Controller/bottom_nav_ctr.dart';
import 'package:pas1_mobile_11pplg1_22/Menu/Genre.dart';
import 'package:pas1_mobile_11pplg1_22/Menu/Home.dart';
import 'package:pas1_mobile_11pplg1_22/Menu/Profile.dart';

class MainPage extends StatelessWidget {
  final BottomNavController bottomNavController = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    const String teamId = '133604';
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 232, 188, 121), 
        child: Obx(() {
          return IndexedStack(
            index: bottomNavController.selectedIndex.value,
            children: [
              HomeScreen(teamId: teamId),
              GenrePage(),
              ProfilePage(),
            ],
          );
        }),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndex,
          backgroundColor: Color.fromARGB(255, 232, 188, 121), 
          selectedItemColor: Colors.white, 
          unselectedItemColor: Colors.black, 
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Genre'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        );
      }),
    );
  }
}
