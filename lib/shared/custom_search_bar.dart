import 'package:flutter/material.dart';
import 'package:lyra/models/lyric.dart';
import 'package:lyra/shared/lyric_param.dart';
import 'package:lyra/shared/view_song_detail.dart';

class CustomSearchBar extends StatefulWidget {
  final dynamic onChanged;
  final String? hintText;
  final dynamic onTap;

  const CustomSearchBar({
    Key? key,
    this.hintText,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBar();
}

Future<List<Widget>> buildSearchResult(Future<List<Lyric>> lyrics,
    SearchController searchController, BuildContext context) async {
  List<Widget> results = [];
  var lyricList = await lyrics;
  for (var lyric in lyricList) {
    results.add(ListTile(
      title: Text(lyric.title),
      onTap: () {
        searchController.closeView(lyric.title);
        searchController.clear();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewSongDetail(),
            settings: RouteSettings(
              arguments: LyricParam(id: lyric.idLyricGva, title: lyric.title),
            ),
          ),
        );
      },
    ));
  }

  return results;
}

class _CustomSearchBar extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight:
              screenHeight * 0.5, // This will make it occupy half of the screen
        ),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SearchAnchor.bar(
              barHintText: widget.hintText,
              viewConstraints: const BoxConstraints(
                maxHeight:
                    300, // You can also set a fixed height in logical pixels
              ),
              suggestionsBuilder:
                  (BuildContext context, SearchController searchController) {
                Future<List<Lyric>> results =
                    widget.onChanged(searchController.text);
                if (searchController.text.isEmpty) {
                  return [];
                }
                return buildSearchResult(results, searchController, context);
              },
            )));
  }
}
