import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_consult/theme/style.dart';
import 'package:vehicle_consult/widgets/primary_button.dart';

import '../providers/vehicle_provider.dart';
import '../widgets/vehicle_card.dart';
import 'login_screen.dart';

class VehicleScreen extends StatefulWidget {
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
            Card(
              color: cardColor,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Consulta de Veículos',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        labelText: 'Digite a placa, chassi ou motor',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceAround, // Distribui os botões com espaçamento
                      children: [
                        PrimaryButton(
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                            });
                          },
                          text: 'Limpar',
                          isLoading: false,
                        ),
                        PrimaryButton(
                          onPressed: () {
                            provider.searchVehicle(
                                _searchController.text, _searchType);
                          },
                          text: 'Buscar',
                          isLoading: false,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
