import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_consult/theme/style.dart';
import 'package:vehicle_consult/widgets/card_sonsult.dart';

import '../providers/vehicle_provider.dart';
import '../widgets/vehicle_card.dart';
import 'login_screen.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({super.key});

  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchType = 'plate';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VehicleProvider>(context);

    return Scaffold(
      backgroundColor: screenColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: screenColor,
              actions: [
                IconButton(
                  icon: const Icon(Icons.logout),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
            buildConsultaCard(
              context: context,
              searchController: _searchController,
              title: 'Consulta de Veículos',
              labelText: 'Digite a placa, chassi ou motor',
              onBuscarPressed: () {
                provider.searchVehicle(_searchController.text, _searchType);
              },
              onLimparPressed: () {
                setState(() {
                  _searchController.clear();
                });
              },
              isLoading: false,
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              dropdownColor: Colors.white,
              style: TextStyle(fontSize: 15),
              value: _searchType,
              onChanged: (value) {
                setState(() {
                  _searchType = value!;
                });
              },
              items: const [
                DropdownMenuItem(
                    value: 'plate',
                    child: Text(
                      'Buscar por Placa',
                      style: TextStyle(color: Colors.black),
                    )),
                DropdownMenuItem(
                    value: 'chassi',
                    child: Text(
                      'Buscar por Chassi',
                      style: TextStyle(color: Colors.black),
                    )),
                DropdownMenuItem(
                    value: 'motor',
                    child: Text(
                      'Buscar por Motor',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            const SizedBox(height: 40),
            if (provider.errorMessage != null)
              Text(
                provider.errorMessage!,
                style: const TextStyle(color: Colors.red),
              )
            else if (provider.vehicle != null)
              VehicleCard(vehicle: provider.vehicle!),
          ],
        ),
      ),
    );
  }
}
