import 'package:flutter/material.dart';

class ReminderPage extends StatefulWidget {
  @override
  _ReminderPageState createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  // List to store alarm data with medication name
  List<Map<String, dynamic>> alarms = [
    {
      "time": "08:00",
      "medication": "Paracetamol every 6 hours",
      "isActive": true
    },
    {
      "time": "14:00",
      "medication": "Ibuprofen every 8 hours",
      "isActive": false
    },
  ];

  // Function to add a new alarm
  void _addAlarm(String time, String medicationName) {
    setState(() {
      alarms
          .add({"time": time, "medication": medicationName, "isActive": false});
    });
  }

  // Show dialog to add a new alarm
  void _showAddAlarmDialog() {
    TextEditingController _timeController = TextEditingController();
    TextEditingController _medicationController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Alarm"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _timeController,
                decoration: const InputDecoration(
                  labelText: "Alarm time",
                  hintText: "Format: HH:mm",
                ),
                keyboardType: TextInputType.datetime,
              ),
              TextField(
                controller: _medicationController,
                decoration: const InputDecoration(
                  labelText: "Medication name",
                  hintText: "e.g., Paracetamol every 6 hours",
                ),
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
            TextButton(
              onPressed: () {
                String time = _timeController.text;
                String medicationName = _medicationController.text;

                // Validasi format waktu menggunakan regex
                final timeRegex = RegExp(r'^([01]\d|2[0-3]):([0-5]\d)$');
                if (!timeRegex.hasMatch(time)) {
                  // Tampilkan pesan error jika format waktu tidak valid
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Invalid time format. Use HH:mm."),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  return;
                }

                if (time.isNotEmpty && medicationName.isNotEmpty) {
                  _addAlarm(time, medicationName);
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medication Reminder"),
      ),
      body: alarms.isEmpty
          ? const Center(
              child: Text(
                "No alarms added yet.\nTap the + button to add one.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    alarms[index]["time"],
                    style: const TextStyle(fontSize: 24),
                  ),
                  subtitle: Text("Medication: ${alarms[index]["medication"]}"),
                  trailing: Switch(
                    value: alarms[index]["isActive"],
                    onChanged: (value) {
                      setState(() {
                        alarms[index]["isActive"] = value;
                      });
                    },
                  ),
                  onLongPress: () {
                    setState(() {
                      alarms.removeAt(index);
                    });
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddAlarmDialog,
        child: const Icon(Icons.add),
        tooltip: "Add Alarm",
      ),
    );
  }
}
