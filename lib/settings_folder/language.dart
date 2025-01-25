import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _selectedLanguage = 'USD'; // Default selected currency

  final List<String> _currencies = [
    'English',
    'French',
    'Spanish',
    'Portuguese',
    'Latin',
    'Chinese',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _currencies.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_currencies[index]),
                  trailing: _selectedLanguage == _currencies[index]
                      ? Icon(Icons.check_circle, color: Colors.deepPurple)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedLanguage = _currencies[index];
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
