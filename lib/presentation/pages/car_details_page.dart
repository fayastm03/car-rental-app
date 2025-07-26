import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/presentation/pages/MapDetailsPage.dart';
import 'package:car_rental_app/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:car_rental_app/presentation/widgets/more_card.dart';

class CarDetailsPage extends StatefulWidget {
  final Car car;

  const CarDetailsPage({super.key, required this.car});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);

    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });
    _controller!.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info_outline), Text('Information')],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: Car(
                model: widget.car.model,
                distance: widget.car.distance,
                fuelCapacity: widget.car.fuelCapacity,
                pricePerHour: widget.car.pricePerHour),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 106, 107, 102),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20,
                            spreadRadius: 5,
                          )
                        ]),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('assets/user.png')),
                        SizedBox(height: 10),
                        Text(
                          'Fayas',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$4.5',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mapdetailspage(car: widget.car),
                        ),
                      );
                    },
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 20),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child:
                              Image.asset('assets/maps.png', fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                MoreCard(
                  car: Car(
                      model: "${widget.car.model}-1",
                      distance: widget.car.distance + 100,
                      fuelCapacity: widget.car.fuelCapacity + 100,
                      pricePerHour: widget.car.pricePerHour + 10),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  car: Car(
                      model: "${widget.car.model}-2",
                      distance: widget.car.distance + 200,
                      fuelCapacity: widget.car.fuelCapacity + 200,
                      pricePerHour: widget.car.pricePerHour + 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                  car: Car(
                      model: "${widget.car.model}-3",
                      distance: widget.car.distance + 300,
                      fuelCapacity: widget.car.fuelCapacity + 300,
                      pricePerHour: widget.car.pricePerHour + 30),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
