import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // TODO: 1. Deklarasikan variabel
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';

  bool _obscurePassword = true;

  //TODO: 1.Membuat method _signUp
  void _signUp(){
    String name = _fullnameController.text.trim();
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    if(password.length < 8 ||
    !password.contains(RegExp(r'[A-Z]'))||
    !password.contains(RegExp(r'[a-z]'))||
    !password.contains(RegExp(r'[0-9]'))||
    !password.contains(RegExp(r'[!@#\\\$%^&*(),.?":{}|<>]'))){
      setState(() {
        _errorText = 'Minimal 8 karakter, kombinasi [A-Z], [a-z], [0-9], [!@#\\\$%^&*(),.?":{}|<>]';
      });
    }
    print('*** Sign Up berhasil!');
    print('Nama: $name');
    print('Nama Pengguna: $username');
    print('Password: $password');
  }

  //TODO: 2.Membuat method dispose
  @override
  void dispose(){
    //TODO: Implement dispose
    _fullnameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO: 2. Pasang AppBar
      appBar: AppBar(title: Text('Sign Up')),
      // TODO: 3. Pasang body
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
                  // TODO: 4. Atur mainAxisAlignment dan crossAxisAlignment
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _fullnameController,
                      decoration: InputDecoration(
                        labelText: "Nama Lengkap Pengguna",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // TODO: 6. Pasang TextFormField Nama Pengguna
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: "Nama Pengguna",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    // TODO: 7. Pasang TextFormField Kata Sandi
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: "Kata Sandi",
                        errorText: _errorText.isNotEmpty ? _errorText : null,
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscurePassword = ! _obscurePassword;
                            });
                          },
                          icon: Icon(
                            _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          ),
                        ),
                      ),
                      obscureText: _obscurePassword,
                    ),
                    // TODO: 8. Pasang ElevatedButton Sign In
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: () {
                      _signUp();
                    }, child: Text('Sign Up')),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
