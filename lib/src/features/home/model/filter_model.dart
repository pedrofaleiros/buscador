enum FilterType { author, title }

class FilterModel {
  final FilterType type;
  final String args;
  final int initialDate;
  final int finalDate;

  final int rows;
  final int start;

  String? get content => args;

  FilterModel({
    required this.type,
    required this.args,
    required this.initialDate,
    required this.finalDate,
    required this.rows,
    required this.start,
  });

  FilterModel copyWith({
    FilterType? type,
    String? args,
    int? initialDate,
    int? finalDate,
    int? rows,
    int? start,
  }) {
    return FilterModel(
      type: type ?? this.type,
      args: args ?? this.args,
      initialDate: initialDate ?? this.initialDate,
      finalDate: finalDate ?? this.finalDate,
      rows: rows ?? this.rows,
      start: start ?? this.start,
    );
  }
}
