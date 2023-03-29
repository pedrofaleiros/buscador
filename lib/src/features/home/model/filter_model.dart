enum FilterType { author, title }

class FilterModel {
  final FilterType filter;
  final String? args;
  final int initialDate;
  final int finalDate;

  FilterModel({
    required this.filter,
    required this.args,
    required this.initialDate,
    required this.finalDate,
  });

  FilterModel copyWith({
    FilterType? filter,
    String? args,
    int? initialDate,
    int? finalDate,
  }) {
    return FilterModel(
      filter: filter ?? this.filter,
      args: args ?? this.args,
      initialDate: initialDate ?? this.initialDate,
      finalDate: finalDate ?? this.finalDate,
    );
  }
}
