import 'package:floodfill_image/floodfill_image.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class ColoringPage extends StatefulWidget {
  final AssetImage image;
  const ColoringPage({super.key, required this.image});

  @override

  State<ColoringPage> createState() => _ColoringPageState();
}

class _ColoringPageState extends State<ColoringPage> {

  AudioPlayer player = AudioPlayer();
  void startAudio(String url) {
    player.setAsset(url);
    player.play();
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  Color _fillColor = Colors.amber;
  List<String>colorSound = [
    "assets/musics/axzar_qongiroq tovushi.m4a",
    "assets/musics/azroq_qongiroq tovushi.m4a",
    "assets/musics/bunni_qongiroq tovushi.m4a",
    "assets/musics/vardi_qongiroq tovushi.m4a",
    "assets/musics/axmar_qongiroq tovushi.m4a",
    "assets/musics/asfar_qongiroq tovushi.m4a"

  ];
  List<Color>colors = [
    Colors.green,
    Colors.blue,
    Colors.brown,
    Colors.pink,
    Colors.red,
    Colors.yellow,
    Colors.white,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 500,
                  child: FloodFillImage(
                    imageProvider: widget.image,
                    fillColor: _fillColor,
                    avoidColor: const [Colors.black],
                    tolerance: 1000000,
                  ),
                ),
                const SizedBox(height: 8,),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    for(int i = 0; i < colors.length; i++)
                    Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(width: 8,),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _fillColor = colors[i];
                              startAudio(colorSound[i]);
                            });
                          },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(colors[i]), side: const MaterialStatePropertyAll(BorderSide(width: 1, color: Colors.black))),
                          child:const SizedBox(height: 50,width: 0,)
                        ),
                        const SizedBox(width: 8,),

                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
