import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:tak_task/models/panchang.dart';
import 'package:tak_task/services/repository.dart';

part 'panchang_state.dart';

class PanchangCubit extends Cubit<PanchangState> {
  final repository = Repository();
  PanchangCubit() : super(PanchangInitial());

  void fetchPanchang(DateTime date, String placeId) {
    repository
        .fetchPanchang(date, placeId)
        .then((panchang) => emit(PanchangLoaded(panchang: panchang)));
  }
}
