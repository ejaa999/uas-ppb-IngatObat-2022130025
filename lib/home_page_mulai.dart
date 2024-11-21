import 'package:flutter/material.dart';

class HomePageMulai extends StatelessWidget {
  const HomePageMulai({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingat Obatku'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icon(Icons.notifications_active, size: 100),
            Image.asset('assets/images/medicine.png', height: 200, width: 200),
            const Text(
              'Pengingat',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              'obat-obatan',
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dan masih banyak lagi...',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Navigasi ke halaman login
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Mulai'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dengan mengetuk tombol, Anda menerima Ketentuan\nPenggunaan Ingat Obat. Harap baca juga Kebijakan Privasi Ingat Obat.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
