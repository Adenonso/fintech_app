import 'package:fintech_app/widgets/transactionlist.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FinancialReportPage extends StatefulWidget {
  @override
  State<FinancialReportPage> createState() => _FinancialReportPageState();
}

class _FinancialReportPageState extends State<FinancialReportPage> {
  bool _isOption1Selected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            AppBar(
              title: Text('Financial Report',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              centerTitle: true,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      // boxShadow: [
                      //   BoxShadow(
                      //       color: Colors.black,
                      //       blurRadius: 3,
                      //       offset: Offset(3, 3))
                      // ],
                      // color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [Icon(Icons.keyboard_arrow_down), Text('Month')],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.schema_outlined,
                          color: Colors.white,
                        )),
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.donut_small_rounded,
                          color: Colors.deepPurple,
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'N 333',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 200,
                child: LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 1),
                          FlSpot(1, 3),
                          FlSpot(2, 2),
                          FlSpot(3, 5),
                          FlSpot(4, 3),
                          FlSpot(5, 4),
                          FlSpot(6, 7),
                        ],
                        isCurved: true,
                        colors: [Colors.deepPurple],
                        barWidth: 4,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _isOption1Selected = true;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: _isOption1Selected
                          ? Colors.grey.shade200
                          : Colors.deepPurple,
                      backgroundColor: _isOption1Selected
                          ? Colors.deepPurple
                          : Colors.grey.shade200,
                    ),
                    child: Text('Expense'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _isOption1Selected = false;
                      });
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: !_isOption1Selected
                          ? Colors.white
                          : Colors.deepPurple,
                      backgroundColor: !_isOption1Selected
                          ? Colors.deepPurple
                          : Colors.grey.shade200,
                    ),
                    child: Text('Income'),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Icon(Icons.keyboard_arrow_down),
                      Text('Transaction')
                    ],
                  ),
                ),
                Spacer(),
                Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        // color: Colors.grey.shade200,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.filter_list_rounded)),
              ],
            ),
            Expanded(child: Transactionlist())
          ],
        ),
      ),
    );
  }
}
