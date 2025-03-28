import 'package:flutter/material.dart';
import 'package:lyra/models/lyric.dart';
import 'package:lyra/service/lyric_service.dart';
import 'package:lyra/shared/custom_search_bar.dart';
import 'package:lyra/shared/widget/list_tile_lyric.dart';

class RdbPage extends StatefulWidget {
  const RdbPage({Key? key}) : super(key: key);
  @override
  State<RdbPage> createState() => _RdbPageState();
}

class _RdbPageState extends State<RdbPage> {
  List<Lyric> lyrics = [];
  List<Lyric> resultSearch = [];
  bool isLoading = false;

  Future<List<Lyric>> onChangedSearch(String value) async {
    return await LyricService.instance.searchLyric(1, value);
  }

  @override
  void initState() {
    super.initState();
    init();
  }
  

  Future init() async {
    final lyrics_ = await LyricService.instance.getAllLyricsByType(1);
    setState(() {
      resultSearch = lyrics_;
      lyrics = lyrics_;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xff6750a4)),
      home: Scaffold(
        body: SafeArea(
            child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              clipBehavior: Clip.none,
              shape: const StadiumBorder(),
              scrolledUnderElevation: 0.0,
              titleSpacing: 0.0,
              backgroundColor: Colors.transparent,
              floating: false,
              pinned: true,
              title: CustomSearchBar(
                hintText: "Hitady hira rodobe...",
                onChanged: onChangedSearch,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: resultSearch.length,
                  itemBuilder: (context, index) {
                    return lyricTyle(resultSearch[index], context, index, Colors.purple);
                  },
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
