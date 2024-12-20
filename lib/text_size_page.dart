import 'package:flutter/material.dart';

class TextSizePage extends StatefulWidget {
  @override
  _TextSizePageState createState() => _TextSizePageState();
}

class _TextSizePageState extends State<TextSizePage> {
  double _textSize = 16.0; // Ukuran teks default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Text Size Settings",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Adjust the text size in the application:",
              style: TextStyle(fontSize: _textSize),
            ),
            Slider(
              value: _textSize,
              min: 12.0,
              max: 24.0,
              divisions: 6,
              label: "${_textSize.toInt()}",
              onChanged: (value) {
                setState(() {
                  _textSize = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Preview Text",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                "This is a preview of the text size.",
                style: TextStyle(fontSize: _textSize),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Text size set to ${_textSize.toInt()}"),
            ),
          );
        },
        child: const Icon(Icons.save),
        tooltip: "Save Settings",
      ),
    );
  }
}
