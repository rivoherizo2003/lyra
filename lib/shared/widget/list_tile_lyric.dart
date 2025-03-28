import 'package:flutter/material.dart';
import 'package:lyra/models/lyric.dart';
import 'package:lyra/shared/lyric_param.dart';
import 'package:lyra/shared/view_song_detail.dart';

Widget lyricTyle(Lyric lyric, BuildContext context, int index, Color colorCircleAvatar) => ListTile(
      leading: ExcludeSemantics(
        child: CircleAvatar(
          backgroundColor: colorCircleAvatar,
          foregroundColor: Colors.white,
          child: Text(index.toString()),
        ),
      ),
      title: Text(lyric.title),
      subtitle: Text("${lyric.author} Clé:${lyric.key}"),
      onTap: () {
        Navigator.push( 
            context,
            MaterialPageRoute(
                builder: (context) => const ViewSongDetail(),
                settings: RouteSettings(
                    arguments:
                        LyricParam(id: lyric.idLyricGva, title: lyric.title))));
      },
    );
