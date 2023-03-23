import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'obscure_cubit_state.dart';

class ObscureCubit extends Cubit<ObscureCubitState> {
  ObscureCubit() : super(const ObscureCubitState(obscure: true));
  bool value = true;
  obscureText() {
    value = !value;
    emit(ObscureCubitState(obscure: value));
  }
}
