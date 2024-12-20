import 'package:flutter/material.dart';

class PrivacySetting extends StatefulWidget {
  @override
  _PrivacySettingState createState() => _PrivacySettingState();
}

class _PrivacySettingState extends State<PrivacySetting> {
  // Status izin akses
  bool _locationAccess = false;
  bool _storageAccess = false;
  bool _cameraAccess = false;
  bool _microphoneAccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Manage Privacy Permissions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: const Text("Location Access"),
                    subtitle:
                        const Text("Allow the app to access your location"),
                    value: _locationAccess,
                    onChanged: (bool value) {
                      setState(() {
                        _locationAccess = value;
                      });
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text("Storage Access"),
                    subtitle:
                        const Text("Allow the app to access your storage"),
                    value: _storageAccess,
                    onChanged: (bool value) {
                      setState(() {
                        _storageAccess = value;
                      });
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text("Camera Access"),
                    subtitle: const Text("Allow the app to use your camera"),
                    value: _cameraAccess,
                    onChanged: (bool value) {
                      setState(() {
                        _cameraAccess = value;
                      });
                    },
                  ),
                  const Divider(),
                  SwitchListTile(
                    title: const Text("Microphone Access"),
                    subtitle:
                        const Text("Allow the app to use your microphone"),
                    value: _microphoneAccess,
                    onChanged: (bool value) {
                      setState(() {
                        _microphoneAccess = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk menyimpan pengaturan izin akses
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Permissions saved:\n"
                      "Location: ${_locationAccess ? 'Enabled' : 'Disabled'}\n"
                      "Storage: ${_storageAccess ? 'Enabled' : 'Disabled'}\n"
                      "Camera: ${_cameraAccess ? 'Enabled' : 'Disabled'}\n"
                      "Microphone: ${_microphoneAccess ? 'Enabled' : 'Disabled'}",
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
