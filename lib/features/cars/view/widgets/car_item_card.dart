import 'package:flutter/material.dart';
import 'package:mechanic/core/functions.dart';
import 'package:mechanic/core/manager/colors_manager.dart';
import 'package:mechanic/data/models/car_model/car_model.dart';
import 'package:mechanic/features/cars/view/widgets/refresh_car_dialog.dart';
import 'package:mechanic/widgets/meter_widget.dart';

class CarItemCard extends StatelessWidget {
  const CarItemCard({Key? key, required this.car}) : super(key: key);

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          spreadRadius: .2,
          blurRadius: 5,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(15), color: Colors.white),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: IconButton(
                  onPressed: () {
                    refreshCarDataDialog(context, car);
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: ColorsManager.primary,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Text(
                  car.carName,
                  style: const TextStyle(
                      color: ColorsManager.primary,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          Text(
            "اخر قراءة للعداد ${car.kilometers} كـم",
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text('غيار الزيت'),
                  const SizedBox(height: 5),
                  MeterWidget(
                    size: 100,
                    currentValue: int.parse(car.oilKilometers),
                    maxValue: 10000,
                    minValue: 1,
                    warningValue: 1000,
                    warningColor: Colors.green,
                    meterColor: Colors.redAccent,
                    displayText: 'كـم',
                  ),
                  Text(
                    car.oilKilometers,
                    style: getStyleBasedOnValue(car.oilKilometers),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('الصيانه الدوريه'),
                  MeterWidget(
                    size: 100,
                    currentValue: int.parse(car.checkKilometers),
                    maxValue: 60000,
                    minValue: 1,
                    warningValue: 10000,
                    warningColor: Colors.green,
                    meterColor: Colors.redAccent,
                    displayText: 'كـم',
                  ),
                  Text(
                    car.checkKilometers,
                    style: getStyleBasedOnValue(car.checkKilometers),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
