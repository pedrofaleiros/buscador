class PaginationModel {
  final int rows;
  final int start;
  final int numFound;

  PaginationModel({
    required this.rows,
    required this.start,
    required this.numFound,
  });

  PaginationModel copyWith({int? rows, int? start, int? numFound}) {
    return PaginationModel(
      rows: rows ?? this.rows,
      start: start ?? this.start,
      numFound: numFound ?? this.numFound,
    );
  }
}
