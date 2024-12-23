import 'package:flutter/material.dart';
import 'package:vehicle_consult/widgets/primary_button.dart';

Widget buildCardHome(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Card(
      color: Colors.grey[800],
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48.0, color: Colors.blue),
            const SizedBox(height: 16.0),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }



Widget buildConsultaCard(
    {required BuildContext context,
    required TextEditingController searchController,
    required String title,
    required String labelText,
    required VoidCallback onBuscarPressed,
    required VoidCallback onLimparPressed,
    required bool isLoading}) {
  return Card(
    color: Colors.grey[300],
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(height: 40),
          TextField(
            controller: searchController,
            decoration: InputDecoration(
              prefixIconColor: Colors.white,
              labelText: labelText,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PrimaryButton(
                onPressed: onLimparPressed,
                text: 'Limpar',
                isLoading: false,
              ),
              PrimaryButton(
                onPressed: onBuscarPressed,
                text: 'Buscar',
                isLoading: isLoading,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
