import 'package:flutter/material.dart';

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  String _selectedCurrency = 'USD'; // Default selected currency

  final List<String> _currencies = [
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'AUD',
    'CAD',
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
