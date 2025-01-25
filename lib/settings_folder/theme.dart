import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  String _selectedCurrency = 'USD'; // Default selected currency

  final List<String> _currencies = [
    'Light',
    'Dark',
    'Use device theme',
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
                  trailing: _selectedCurrency == _currencies[index]
                      ? Icon(Icons.check_circle, color: Colors.deepPurple)
                      : null,
                  onTap: () {
                    setState(() {
                      _selectedCurrency = _currencies[index];
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
