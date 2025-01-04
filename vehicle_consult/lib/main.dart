import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_consult/providers/vehicle_provider.dart';
import 'package:vehicle_consult/providers/cpf_provider.dart';
import 'package:vehicle_consult/screens/login_screen.dart';

import 'service/auth_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => VehicleProvider()),
        ChangeNotifierProvider(create: (context) => CpfProvider()),
      ],
      child: MaterialApp(
        title: 'TPI2 Consultas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
