import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:lyra/service/firestore_service.dart';

const htmlDataAfafi = """
<p>A.FA.FI Antoko mpihira FAnasin'ny FIfohazana FPVM Antaninanandrano</p>
""";

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
    return Scaffold(
        appBar: AppBar(
          title: const Text('LYRA?'),
        ),
        body: ListView(
          children: <Widget>[
            Card(
                child: Column(children: <Widget>[
              Image.asset(
                'assets/afafi_official_little.jpg',
                height: 200,
                scale: 0.9,
                fit: BoxFit.contain,
              ),
              SingleChildScrollView(
                child: HtmlWidget(htmlDataAfafi),
              )
            ])),
            Card(
                child: Column(children: <Widget>[
              Image.asset(
                'assets/icon.png',
                height: 100,
                scale: 0.9,
                fit: BoxFit.contain,
              ),
              SingleChildScrollView(
                child: HtmlWidget(htmlDataLyra),
              )
            ]))
          ],
        ),
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
            });
          },
          backgroundColor: Colors.red,
          tooltip: "Fangalana tononkira vaovao",
          child: loading
              ? const CircularProgressIndicator()
              : const Icon(Icons.download),
        ));
  }
}
