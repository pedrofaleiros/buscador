enum FilterType { author, title }

class FilterModel {
  final FilterType type;
  final String args;
  final int? initialDate;
  final int? finalDate;

  String? get content => args;

  FilterModel({
    required this.type,
    required this.args,
    required this.initialDate,
    required this.finalDate,
  });

  FilterModel copyWith({
    FilterType? type,
    String? args,
    int? initialDate,
    int? finalDate,
  }) {
    return FilterModel(
      type: type ?? this.type,
      args: args ?? this.args,
      initialDate: initialDate ?? this.initialDate,
      finalDate: finalDate ?? this.finalDate,
    );
  }
}
