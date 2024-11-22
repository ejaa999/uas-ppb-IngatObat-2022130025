import 'package:flutter/material.dart';

class ListObatScreen extends StatefulWidget {
  const ListObatScreen({Key? key}) : super(key: key);

  @override
  _ListObatScreenState createState() => _ListObatScreenState();
}

class _ListObatScreenState extends State<ListObatScreen> {
  // List data obat
  final List<Map<String, String>> _obatList = [
    {'name': 'Paracetamol', 'schedule': '6 jam sekali'},
    {'name': 'Vitamin C', 'schedule': '12 jam sekali'},
    {'name': 'Amoxicillin', 'schedule': '8 jam sekali'},
  ];

  // Fungsi untuk menambahkan obat
  void _addObat(String name, String schedule) {
    setState(() {
      _obatList.add({'name': name, 'schedule': schedule});
    });
  }

  // Fungsi untuk menghapus obat
  void _deleteObat(int index) {
    setState(() {
      _obatList.removeAt(index);
    });
  }

  // Menampilkan dialog untuk menambah obat
  Future<void> _showAddObatDialog() async {
    final TextEditingController nameController = TextEditingController();
    String selectedSchedule = '6 jam sekali'; // Default pilihan pertama

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Tambah Obat"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(labelText: "Nama Obat"),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Pilih Jadwal Minum:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      RadioListTile<String>(
                        value: '6 jam sekali',
                        groupValue: selectedSchedule,
                        title: const Text('6 jam sekali'),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedSchedule = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        value: '8 jam sekali',
                        groupValue: selectedSchedule,
                        title: const Text('8 jam sekali'),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedSchedule = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        value: '12 jam sekali',
                        groupValue: selectedSchedule,
                        title: const Text('12 jam sekali'),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedSchedule = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        value: '24 jam sekali',
                        groupValue: selectedSchedule,
                        title: const Text('24 jam sekali'),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedSchedule = value!;
                          });
                        },
                      ),
                    ],
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
                    if (nameController.text.isNotEmpty) {
                      _addObat(nameController.text, selectedSchedule);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Nama obat tidak boleh kosong!"),
                        ),
                      );
                    }
                  },
                  child: const Text("Tambah"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Obat"),
      ),
      body: _obatList.isEmpty
          ? const Center(
              child: Text(
                "Belum ada obat yang ditambahkan.",
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: _obatList.length,
              itemBuilder: (context, index) {
                final obat = _obatList[index];
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
                        _deleteObat(index);
                      },
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddObatDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
