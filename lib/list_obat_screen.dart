import 'package:flutter/material.dart';

class ListObatScreen extends StatefulWidget {
  const ListObatScreen({Key? key}) : super(key: key);

  @override
  _ListObatScreenState createState() => _ListObatScreenState();
}

class _ListObatScreenState extends State<ListObatScreen> {
  // List data obat
  final List<Map<String, String>> _obatList = [
    {'name': 'Paracetamol', 'schedule': 'every 6 hours'},
    // {'name': 'Vitamin C', 'schedule': '12 jam sekali'},
    {'name': 'Ibuprofen', 'schedule': 'every 8 hours'},
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
    String selectedSchedule = 'every 6 hours'; // Default pilihan pertama

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text("Add Medication"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: nameController,
                    decoration:
                        const InputDecoration(labelText: "Medication Name"),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Select Medication Schedule:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      RadioListTile<String>(
                        value: 'every 6 hours',
                        groupValue: selectedSchedule,
                        title: const Text('every 6 hours'),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedSchedule = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        value: 'every 8 hours',
                        groupValue: selectedSchedule,
                        title: const Text('every 8 hours'),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedSchedule = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        value: 'every 12 hours',
                        groupValue: selectedSchedule,
                        title: const Text('every 12 hours'),
                        onChanged: (value) {
                          setDialogState(() {
                            selectedSchedule = value!;
                          });
                        },
                      ),
                      RadioListTile<String>(
                        value: 'every 24 hours',
                        groupValue: selectedSchedule,
                        title: const Text('every 24 hours'),
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
                  child: const Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty) {
                      _addObat(nameController.text, selectedSchedule);
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Medication name cannot be empty!"),
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
        title: const Text("Medication List"),
      ),
      body: _obatList.isEmpty
          ? const Center(
              child: Text(
                "No medication has been added yet.",
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
                    subtitle: Text("Schedule: ${obat['schedule']}"),
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
