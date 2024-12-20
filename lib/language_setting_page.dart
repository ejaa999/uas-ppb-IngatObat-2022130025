import 'package:flutter/material.dart';

class LanguageSetting extends StatefulWidget {
  @override
  _LanguageSettingState createState() => _LanguageSettingState();
}

class _LanguageSettingState extends State<LanguageSetting> {
  String _selectedLanguage = "English"; // Bahasa default

  final List<String> _languages = [
    "English",
    "Bahasa Indonesia",
    "Español",
    "Français",
    "Deutsch",
    "中文",
    "日本語"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Your Preferred Language",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  return RadioListTile<String>(
                    title: Text(_languages[index]),
                    value: _languages[index],
                    groupValue: _selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value!;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logika untuk menyimpan pengaturan bahasa
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Language saved: $_selectedLanguage"),
                    ),
                  );
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
