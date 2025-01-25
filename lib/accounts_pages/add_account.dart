import 'package:fintech_app/widgets/banktype.dart';
import 'package:flutter/material.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          //APPBAR SHOWING EXPENSE AND BACK ARROW
          AppBar(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Add Account'),
            centerTitle: true,
          ),
          SizedBox(
            height: 100,
          ),
          //AMOUNT CONTAINER
          Container(
            width: 350,
            decoration: BoxDecoration(
                // color: Colors.deepPurple,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Balance',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                ),
                Text(
                  'N100',
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          //WHITE FORM SECTION
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'PayPal',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Bank',
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          'Food',
                          'Transport',
                          'Shopping',
                          'Entertainment'
                        ].map((category) {
                          return DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Bank',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Expanded(child: Banktype()),
                      SizedBox(height: 200),
                      ////SUBMIT BUTTON
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Continue',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
