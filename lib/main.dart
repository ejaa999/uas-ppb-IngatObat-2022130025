import 'package:flutter/material.dart';

void main() {
  runApp(const IngatObatApp());
}

class IngatObatApp extends StatelessWidget {
  const IngatObatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ingat Obat',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Dummy reminders for now (to be replaced with Firebase data)
  final List<Map<String, dynamic>> _reminders = [
    {"title": "Obat Pagi", "time": "08:00 AM"},
    {"title": "Obat Siang", "time": "12:00 PM"},
    {"title": "Obat Malam", "time": "08:00 PM"}
  ];

  void _addReminder() {
    // Simulasi untuk menambahkan data dummy
    // Nanti akan diganti dengan operasi Firebase
    setState(() {
      _reminders.add({"title": "Obat Baru", "time": "10:00 AM"});
    });
  }

  void _deleteReminder(int index) {
    // Hapus pengingat
    setState(() {
      _reminders.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ingat Obat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: () {
              // Aksi ketika ikon notifikasi ditekan
              // Mungkin untuk fitur pengaturan notifikasi nanti
            },
          ),
        ],
      ),
      body: _reminders.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.hourglass_empty,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Belum ada pengingat obat.',
                    style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton.icon(
                    onPressed: _addReminder,
                    icon: const Icon(Icons.add),
                    label: const Text('Tambah Pengingat'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListView.builder(
                itemCount: _reminders.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: const CircleAvatar(
                        backgroundColor: Colors.teal,
                        child: Icon(Icons.medication, color: Colors.white),
                      ),
                      title: Text(
                        _reminders[index]["title"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("Waktu: ${_reminders[index]["time"]}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteReminder(index),
                      ),
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addReminder,
        icon: const Icon(Icons.add),
        label: const Text('Tambah Pengingat'),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
