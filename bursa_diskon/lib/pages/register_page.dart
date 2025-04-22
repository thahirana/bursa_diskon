import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;

  void _register() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Tambahkan ini untuk menghindari eror karena email belum dipakai
      print('Email yang didaftarkan: $email');

      // Cek apakah password dan confirm password cocok
      if (password != _confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password dan konfirmasi password tidak cocok'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // ✅ Simpan email dan password ke SharedPreferences 
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setString('password', password);

      // Kalau validasi sukses, bisa simpan data user ke database/API
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registrasi berhasil!'),
          backgroundColor: Colors.green,
        ),
      );

      // setelah berhasil daftar, pindah ke halaman login
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Daftar Akun Baru',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      if (!value.contains('@')) {
                        return 'Format email tidak valid';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      if (value.length < 6) {
                        return 'Password minimal 6 karakter';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _confirmPasswordController,
                    obscureText: _obscurePassword,
                    decoration: const InputDecoration(
                      labelText: 'Konfirmasi Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Konfirmasi password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _register,
                    child: const Text('Daftar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
