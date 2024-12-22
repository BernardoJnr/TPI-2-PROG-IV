import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;

  const InputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.validator,
    required Null Function() onVisibilityPressed,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  late bool _obscureText = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(widget.icon, color: Colors.white, size: 24),
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: widget.validator,
    );
  }
}
