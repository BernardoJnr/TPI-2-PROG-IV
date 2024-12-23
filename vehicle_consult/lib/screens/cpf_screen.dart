import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_consult/theme/style.dart';
import 'package:vehicle_consult/widgets/card_sonsult.dart';

import '../providers/cpf_provider.dart';
import '../widgets/cpf_card.dart';
import 'login_screen.dart';

class CpfScreen extends StatefulWidget {
  @override
  _CpfScreenState createState() => _CpfScreenState();
}

class _CpfScreenState extends State<CpfScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cpfProvider = Provider.of<CpfProvider>(context);

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
              title: 'Consulta por CPF',
              labelText: 'Digite o CPF',
              onBuscarPressed: () {
                cpfProvider.searchCpf(_searchController.text);
              },
              onLimparPressed: () {
                setState(() {
                  _searchController.clear();
                });
              },
              isLoading: cpfProvider.isLoading,
            ),
            const SizedBox(height: 30),
            if (cpfProvider.errorMessage != null)
              Text(
                cpfProvider.errorMessage!,
                style: const TextStyle(color: Colors.red),
              )
            else if (cpfProvider.cpfData != null)
              CpfCard(cpfData: cpfProvider.cpfData!),
          ],
        ),
      ),
    );
  }
}
