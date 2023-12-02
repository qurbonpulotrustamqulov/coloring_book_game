import 'package:coloring_book/data/constants/images.dart';
import 'package:coloring_book/ppt/coloring_page/coloring_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AssetImage> images = [
    CustomImages.echki,
    CustomImages.horse,
    CustomImages.hippo,
    CustomImages.letter,
    CustomImages.easter,
    CustomImages.bird,
    CustomImages.cat,
    CustomImages.animal,
    CustomImages.duckling,
  ];
  List<String> imageName = [
    "echki",
    "horse",
    "hippo",
    "letters",
    "letters",
    "letters",
    "letters",
    "letters",
    "letters",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BookColoring"),
      ),
      body: ListView(
        children: [
          for (int i = 0; i < images.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ColoringPage(image: images[i]),
                      ));
                },
                leading: Image(
                  image: images[i],
                ),
                title: Text(
                  imageName[i],
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            )
        ],
      ),
    );
  }
}
