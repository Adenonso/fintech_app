import 'package:flutter/material.dart';

class EditBudget extends StatefulWidget {
  const EditBudget({super.key});

  @override
  State<EditBudget> createState() => _EditBudgetState();
}

class _EditBudgetState extends State<EditBudget> {
  bool _isToggled = false;
  double _progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            AppBar(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Edit Budget'),
              centerTitle: true,
            ),
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text("How much do you want to spend?",
                  style: TextStyle(color: Colors.grey, fontSize: 17)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Text("N 200",
                  style: TextStyle(color: Colors.white, fontSize: 35)),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'Category',
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
                        //REPEAT TRANSACTION
                        Container(
                            height: 55,
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Receive Alert',
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
                                      ),
                                      Text(
                                        'Receive Alert when it reaches some point',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _isToggled = !_isToggled;
                                      });
                                    },
                                    child: Icon(
                                      _isToggled
                                          ? Icons.toggle_on
                                          : Icons.toggle_off,
                                      size: 55,
                                      color: _isToggled
                                          ? Colors.deepPurple
                                          : Colors.grey.shade400,
                                    ),
                                  )
                                ],
                              ),
                            )),

                        if (_isToggled)
                          Stack(
                            children: [
                              Slider(
                                activeColor: Colors.deepPurple,
                                value: _progress,
                                min: 0,
                                max: 100,
                                divisions: 100,
                                onChanged: (double value) {
                                  setState(() {
                                    _progress = value;
                                  });
                                },
                              ),
                              Positioned(
                                left: (_progress / 100) *
                                        MediaQuery.of(context).size.width -
                                    30,
                                top: 0,
                                child: Text(
                                  '${_progress.round()}%',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        Expanded(child: SizedBox(height: 20)),
                        Container(
                          //SUBMIT BUTTON
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: double.infinity,
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/detail_budget');
                              },
                              child: Text(
                                'Continue',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
