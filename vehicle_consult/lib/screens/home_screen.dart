import 'package:flutter/material.dart';
import 'package:vehicle_consult/screens/cpf_screen.dart';
import 'package:vehicle_consult/screens/vehicle_screen.dart';
import 'package:vehicle_consult/widgets/card_sonsult.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Consulta por módulo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: [
            buildCardHome(
              context,
              'Consultar Pessoas',
              Icons.person,
              () => _navigateTo(context, CpfScreen()),
            ),
            buildCardHome(
              context,
              'Consultar Veículos',
              Icons.directions_car,
              () => _navigateTo(context, VehicleScreen()),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
  }
}
