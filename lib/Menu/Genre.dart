import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pas1_mobile_11pplg1_22/Widgets/genre_card.dart';


class GenrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final genres = [
      {'title': 'Stats', 'icon': Icons.science},  
      {'title': 'Records', 'icon': Icons.book},
    
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Genres'),
        backgroundColor: Color.fromARGB(255, 232, 188, 121),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: genres.length,
        itemBuilder: (context, index) {
          final genre = genres[index];
          return GenreCard(
            title: genre['title'] as String,
            icon: genre['icon'] as IconData,
            onTap: () {
              Get.snackbar('Genre Selected', 'You selected ${genre['title']}');
            },
          );
        },
      ),
    );
  }
}
