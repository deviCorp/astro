import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tak_task/models/location.dart';
import 'package:tak_task/services/repository.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final repository = Repository();
  LocationCubit() : super(LocationInitial());
  void fetchLocation() {
    repository
        .fetchLocation()
        .then((location) => emit(LocationLoaded(location: location)));
  }
}
