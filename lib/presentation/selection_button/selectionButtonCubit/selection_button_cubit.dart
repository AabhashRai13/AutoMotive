import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'selection_button_state.dart';

class SelectionButtonCubit extends Cubit<SelectionButtonState> {
  SelectionButtonCubit() : super(const SelectionButtonState(indexList: []));

  setIndex(int index, List<int> newList) async {
    if (!newList.contains(index)) {
      newList.clear();
      newList.add(index);
      emit(SelectionButtonState(indexList: newList));
    } else {
      newList.removeAt(newList.indexOf(index));
      emit(SelectionButtonState(indexList: newList));
    }
  }
}
