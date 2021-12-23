part of 'astrologer_cubit.dart';

@immutable
abstract class AstrologerState {}

class AstrologerInitial extends AstrologerState {}

class AstrologerLoaded extends AstrologerState {
  final List<Astrologer>? astrologer;

  AstrologerLoaded({this.astrologer});
}
