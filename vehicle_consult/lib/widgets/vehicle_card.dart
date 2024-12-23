import 'package:flutter/material.dart';
import 'package:vehicle_consult/theme/style.dart';
import '../models/vehicle.dart';

class VehicleCard extends StatelessWidget {
  final Vehicle vehicle;

  VehicleCard({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Modelo: ${vehicle.model}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Status: ${vehicle.status}'),
            Text('Chassi: ${vehicle.chassi}'),
            Text('Motor: ${vehicle.motor}'),
            if (vehicle.plate != null) Text('Placa: ${vehicle.plate}'),
          ],
        ),
      ),
    );
  }
}
