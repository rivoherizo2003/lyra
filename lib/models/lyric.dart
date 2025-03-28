class Lyric {
  final int id;
  final int idLyricGva;
  final String code;
  String author;
  String key;
  final String lyric;
  final String title;
  final int type;

  Lyric(
      {required this.id,
      required this.idLyricGva,
      required this.code,
      required this.lyric,
      required this.title,
      required this.type,
      this.author = '',
      this.key = ''});

  factory Lyric.fromMap(Map<String, dynamic> map) => Lyric(
      id: map['id'],
      idLyricGva: map['id_gva_lyric'],
      code: map['code'],
      author: map['author'],
      key: map['key'],
      lyric: map['lyric'],
      title: map['title'],
      type: map['type']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'id_gva_lyric': idLyricGva,
      'code': code,
      'author': author,
      'lyric': lyric,
      'title': title,
      'type': type
    };
  }
}
