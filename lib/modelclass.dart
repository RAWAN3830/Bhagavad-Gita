
class BhagavatGeeta{
  final int id;
  final int chapter_id;
  final String chapter_name_eg;
  final String chapter_name_hn;
  final String image;
  final int total_verse;
  final List<Verse> verses;

  BhagavatGeeta({
    required this.id,
    required this.chapter_id,
    required this.chapter_name_eg,
    required this.chapter_name_hn,
    required this.image,
    required this.total_verse,
    required this.verses,
  }
  );
  factory BhagavatGeeta.fromJson(Map<String ,dynamic> json) => BhagavatGeeta(
      id: json['id'],
      chapter_id: json['chapter_id'],
      chapter_name_eg: json['chapter_name_eg'],
      chapter_name_hn: json['chapter_name_hn'],
      image: json['image'],
      total_verse: json['total_verse'],
      verses: List<Verse>.from(json['verses'].map((x)=> Verse.fromJson(x))),

  );
}
List<BhagavatGeeta> postlist = [];
class Verse {
  final double verseId;
  final String verse;
  final String commentaryEg;
  final String commentaryHn;
  
  Verse({
  required this.verseId, 
    required this.verse,
    required this.commentaryEg,
    required this.commentaryHn, });
  
  factory Verse.fromJson(Map<String,dynamic> map) => Verse(
      verseId: map['verse_id']?.toDouble(),
      verse: map['verse'],
      commentaryEg: map['commentary_eg'],
      commentaryHn: map['commentary_hn']);
}


class bookmark{
  final String? verses;
  bookmark({required this.verses});
}

List<bookmark> bookmarkList = [];
