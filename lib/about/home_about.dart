import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lyra/service/firestore_service.dart';
import 'package:lyra/shared/widget/image_section.dart';
import 'package:lyra/widgets/version_display.dart';

const htmlDataLyra = """
<p>LYRA: LYrics A.FA.FI</p>
<p>Hahitana ireo lisitry ny hiran'ny Antoko mpihira FAnasin'ny FIfohazana FPVM Antaninanandrano</p>
<p>Hahitana ihany koa lesona momban'ny famakiana Solfa</p>
""";

class AboutHome extends StatefulWidget {
  const AboutHome({Key? key}) : super(key: key);

  @override
  State<AboutHome> createState() => _AboutHomeState();
}

class _AboutHomeState extends State<AboutHome> {
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "LYRA?",
        home: Scaffold(
            appBar: AppBar(
              title: const Text("LYRA?"),
            ),
            body: const SingleChildScrollView(
                child: Column(
              children: [
                ImageSection(image: "assets/afafi_official_little.jpg"),
                Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        ImageSection(image: "assets/icon.png", maxHeight: 100),
                        Positioned(
                            bottom: -2, right: 15, child: VersionDisplay())
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "LYRA: LYrics A.FA.FI\nHahitana ireo lisitry ny hiran'ny Antoko mpihira FAnasin'ny FIfohazana FPVM Antaninanandrano.\nHahitana ihany koa lesona momban'ny famakiana Solfa.",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            )),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                setState(() {
                  loading = true;
                });
                await FireStoreService().getLyrics();
                Future.delayed(const Duration(milliseconds: 5000), () {
                  setState(() {
                    loading = false;
                  });
                  exit(0);
                });
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              tooltip: "Fangalana tononkira vaovao",
              child: loading
                  ? const CircularProgressIndicator()
                  : const Icon(Icons.download),
            )));
  }
}
