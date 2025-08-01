import 'package:car_rental_app/data/datasources/firebase_car_data_source.dart';
import 'package:car_rental_app/data/repsitories/car_repository_impl.dart';
import 'package:car_rental_app/domain/repositories/car_repository.dart';
import 'package:car_rental_app/domain/usecases/get_cars.dart';
import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDataSource>(
        () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()));
    getIt.registerLazySingleton<CarRepository>(
        () => CarRepositoryImpl(getIt<FirebaseCarDataSource>()));
    getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));
    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));
  } catch (e) {
    throw e;
  }
}
