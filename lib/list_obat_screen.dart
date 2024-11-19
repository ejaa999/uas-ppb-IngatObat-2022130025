import 'package:flutter/material.dart';

class ListObatScreen extends StatelessWidget {
  const ListObatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data obat (sementara, nanti diganti dengan data dari Firebase)
    final List<Map<String, String>> obatList = [
      {'name': 'Paracetamol', 'schedule': 'Pagi & Malam'},
      {'name': 'Vitamin C', 'schedule': 'Setelah Sarapan'},
      {'name': 'Amoxicillin', 'schedule': 'Setiap 8 Jam'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("List Obat"),
      ),
      body: obatList.isEmpty
          ? const Center(
              child: Text(
                "Belum ada obat yang ditambahkan.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: obatList.length,
              itemBuilder: (context, index) {
                final obat = obatList[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.medication),
                    title: Text(obat['name']!),
                    subtitle: Text("Jadwal: ${obat['schedule']}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Tambahkan logika untuk menghapus obat
                        print("Hapus ${obat['name']}");
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddObatDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showAddObatDialog(BuildContext context) async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController scheduleController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Tambah Obat"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Nama Obat"),
              ),
              TextField(
                controller: scheduleController,
                decoration: const InputDecoration(labelText: "Jadwal Minum"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menambahkan obat ke database
                print("Obat Ditambahkan: ${nameController.text}");
                Navigator.of(context).pop();
              },
              child: const Text("Tambah"),
            ),
          ],
        );
      },
    );
  }
}
