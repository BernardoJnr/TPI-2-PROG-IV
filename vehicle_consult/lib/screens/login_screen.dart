import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_consult/screens/home_screen.dart';
import 'package:vehicle_consult/service/auth_service.dart';
import 'package:vehicle_consult/theme/style.dart';
import 'package:vehicle_consult/widgets/input_field.dart';
import 'package:vehicle_consult/widgets/primary_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _obscureText = true;

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final authService = Provider.of<AuthService>(context, listen: false);
      final success = await authService.login(
        _cpfController.text,
        _passwordController.text,
      );
      setState(() {
        _isLoading = false;
      });
      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(authService.errorMessage!)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: screenColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/logo.png',
                    height: 180,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Consulta Veicular',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  InputField(
                    controller: _cpfController,
                    hintText: 'Login',
                    icon: Icons.person,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira o Login';
                      }
                      return null;
                    },
                    onVisibilityPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  InputField(
                    controller: _passwordController,
                    hintText: 'Senha',
                    icon: Icons.lock,
                    obscureText: _obscureText,
                    onVisibilityPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira a senha';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 50),
                  if (_isLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    PrimaryButton(
                      isLoading: _isLoading,
                      onPressed: _login,
                      text: 'Entrar',
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
