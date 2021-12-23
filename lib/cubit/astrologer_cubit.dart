import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tak_task/models/astrologer.dart';
import 'package:tak_task/services/repository.dart';

part 'astrologer_state.dart';

class AstrologerCubit extends Cubit<AstrologerState> {
  final repository = Repository();
  AstrologerCubit() : super(AstrologerInitial());
  void fetchAstrologers(String query) {
    repository
        .fetchAstrologers(query)
        .then((astrologer) => emit(AstrologerLoaded(astrologer: astrologer)));
  }
}
