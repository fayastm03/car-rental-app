import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/presentation/bloc/car_bloc.dart';
import 'package:car_rental_app/presentation/bloc/car_event.dart';
import 'package:car_rental_app/presentation/bloc/car_state.dart';
import 'package:car_rental_app/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key}); // Add more

  @override
  Widget build(BuildContext context) {
    context.read<CarBloc>().add(LoadCars());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Choose Your Car'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<CarBloc, CarState>(builder: (context, state) {
          if (state is CarsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: state.cars[index]);
              },
            );
          } else if (state is CarsError) {
            return Center(
                child: Text(
              'Error: ${state.message}',
            ));
          }

          return Container();
        }));
  }
}
