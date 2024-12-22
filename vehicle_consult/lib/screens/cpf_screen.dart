import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_consult/theme/style.dart';
import 'package:vehicle_consult/widgets/primary_button.dart';

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
                      'Consulta por CPF',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        prefixIconColor: Colors.white,
                        labelText: 'Digite o CPF',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            cpfProvider.searchCpf(_searchController.text);
                          },
                          text: 'Buscar',
                          isLoading: cpfProvider.isLoading,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
