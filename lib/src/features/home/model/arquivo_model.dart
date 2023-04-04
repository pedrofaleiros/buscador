class ArquivoModel {
  final String id;
  final String title;
  final String author;
  final int year;

  ArquivoModel({
    required this.id,
    required this.title,
    required this.author,
    required this.year,
  });

  ArquivoModel copyWith({
    String? id,
    String? title,
    String? author,
    int? year,
  }) {
    return ArquivoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'year': year.toString(),
    };
  }

  factory ArquivoModel.fromMap(Map<String, dynamic> map) {
    return ArquivoModel(
      id: map['id'],
      title: map['title'],
      author: map['author'],
      year: int.tryParse(map['year']) ?? 0,
    );
  }

  factory ArquivoModel.fromMapSolr(Map<String, dynamic> map) {
    return ArquivoModel(
      id: map['id'],
      title: map['title'][0],
      author: map['author'][0],
      year: map['year'][0],
    );
  }

  String toJson() {
    return '{"id": "$id","title": "$title","author": "$author","year": $year}';
  }
}
