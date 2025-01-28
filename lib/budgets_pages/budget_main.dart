import 'package:flutter/material.dart';

class BudgetMain extends StatefulWidget {
  const BudgetMain({super.key});

  @override
  State<BudgetMain> createState() => _BudgetMainState();
}

class _BudgetMainState extends State<BudgetMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.keyboard_arrow_left_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  'May',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Icon(Icons.keyboard_arrow_right_outlined,
                    color: Colors.white, size: 30)
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 140, 20, 20),
                      child: Text(
                          "You don't have a budget.\nLet's make one so you can control.",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey, fontSize: 17)),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 140, 10, 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/create_budget');
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            'Create a budget',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
