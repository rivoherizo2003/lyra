import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lyra/models/lyric.dart';
import 'package:lyra/service/lyric_service.dart';
import 'package:lyra/shared/lyric_param.dart';

class ViewSongDetail extends StatefulWidget {
  const ViewSongDetail({Key? key}) : super(key: key);
  @override
  State<ViewSongDetail> createState() => _ViewSongDetail();
}

class _ViewSongDetail extends State<ViewSongDetail> {
  double _fontSize = 16.0;
  @override
  Widget build(BuildContext context) {
    final lyricParam = ModalRoute.of(context)?.settings.arguments as LyricParam;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              lyricParam.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.brown,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.remove,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _fontSize = (_fontSize - 1).clamp(12.0, 32.0);
                  });
                },
                tooltip: "Mampihena ny haben'ny lahatsoratra",
              ),
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _fontSize = (_fontSize + 1).clamp(12.0, 32.0);
                  });
                },
                tooltip: "Ampitomboy ny haben'ny lahatsoratra",
              ),
            ],
          ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/fond_lyric.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.2),
            ),
            height: double.infinity,
            child: FutureBuilder<Lyric>(
              future: LyricService.instance.findOneBy(lyricParam.id),
              builder: (BuildContext context, AsyncSnapshot<Lyric> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                Lyric lyric = snapshot.data!;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: HtmlWidget(
                          "${lyric.lyric}<p>Clé: ${lyric.key}<br>${lyric.author}</p>",
                          customStylesBuilder: (element) {
                            switch (element.localName) {
                              case 'div':
                                return {
                                  'font-family': 'Roboto',
                                  'font-size': '${_fontSize}px',
                                  'line-height': '1.5',
                                  'margin-bottom': '16px',
                                  'color': '#333333',
                                };
                              case 'p':
                                return {
                                  'font-size': '${_fontSize}px',
                                  'line-height': '1.8',
                                  'margin-bottom': '12px',
                                };
                              case 'br':
                                return {
                                  'margin-bottom': '8px',
                                };
                              default:
                                return null;
                            }
                          },
                          textStyle: TextStyle(
                            height: 1.5,
                            fontSize: _fontSize,
                            color: Colors.black87,
                          ),
                          onLoadingBuilder:
                              (context, element, loadingProgress) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
