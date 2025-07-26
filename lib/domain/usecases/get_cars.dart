import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repstository;
  GetCars(this.repstository);

  Future<List<Car>> call() async {
    return await repstository.fetchCars();
  }
}
