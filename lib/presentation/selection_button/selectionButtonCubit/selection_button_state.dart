part of 'selection_button_cubit.dart';

class SelectionButtonState {
  final List<int> indexList;
  const SelectionButtonState({required this.indexList});
  Map<String, dynamic> toMap() {
    return {
      'indexList': indexList,
    };
  }

  factory SelectionButtonState.fromMap(Map<String, dynamic> map) {
    return SelectionButtonState(indexList: map['indexList']);
  }
  String toJson() => json.encode(toMap());
  factory SelectionButtonState.fromJson(String source) =>
      SelectionButtonState.fromJson(json.decode(source));

  @override
  String toString() => 'indexListCubitState(indexList: $indexList,)';
}
