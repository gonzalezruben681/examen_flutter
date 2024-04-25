import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<List<String>> {
  HomeCubit() : super([]);

  void toggleOption(String option) {
    if (state.contains(option)) {
      emit(state.where((element) => element != option).toList());
    } else {
      emit([...state, option]);
    }
  }
}
