import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lupa Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Masukkan email untuk mereset password',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Tampilkan snackbar untuk notifikasi
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Email reset password terkirim!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                child: const Text('Kirim Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
