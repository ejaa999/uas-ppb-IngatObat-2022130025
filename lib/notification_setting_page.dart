import 'package:flutter/material.dart';

class NotificationSetting extends StatefulWidget {
  @override
  _NotificationSettingState createState() => _NotificationSettingState();
}

class _NotificationSettingState extends State<NotificationSetting> {
  // Status untuk setiap jenis notifikasi
  bool _reminderNotifications = true;
  bool _alertNotifications = true;
  bool _soundNotifications = true;
  bool _vibrationNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Manage Notifications",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: const Text("Reminder Notifications"),
                    subtitle: const Text(
                        "Enable notifications for medication reminders"),
                    value: _reminderNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        _reminderNotifications = value;
                      });
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text("Alert Notifications"),
                    subtitle: const Text("Enable critical alerts"),
                    value: _alertNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        _alertNotifications = value;
                      });
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text("Sound Notifications"),
                    subtitle: const Text("Enable sound for notifications"),
                    value: _soundNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        _soundNotifications = value;
                      });
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text("Vibration Notifications"),
                    subtitle: const Text("Enable vibration for notifications"),
                    value: _vibrationNotifications,
                    onChanged: (bool value) {
                      setState(() {
                        _vibrationNotifications = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyimpan pengaturan notifikasi
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Notification settings saved:\n"
                      "Reminders: ${_reminderNotifications ? 'Enabled' : 'Disabled'}\n"
                      "Alerts: ${_alertNotifications ? 'Enabled' : 'Disabled'}\n"
                      "Sound: ${_soundNotifications ? 'Enabled' : 'Disabled'}\n"
                      "Vibration: ${_vibrationNotifications ? 'Enabled' : 'Disabled'}",
                    ),
                  ),
                );
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
