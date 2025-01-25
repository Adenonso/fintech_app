import 'package:fintech_app/widgets/home_recent_transaction.dart';
import 'package:fintech_app/widgets/transactionlist.dart';
import 'package:flutter/material.dart';

class Detailaccount extends StatefulWidget {
  const Detailaccount({super.key});

  @override
  State<Detailaccount> createState() => _DetailaccountState();
}

class _DetailaccountState extends State<Detailaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 15, 10, 40),
        child: Column(
          children: [
            AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/edit_account');
                    },
                    icon: Icon(
                      Icons.mode_edit_outline_sharp,
                    ))
              ],
              backgroundColor: Colors.white,
              // foregroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: Text('Detail Account'),
              centerTitle: true,
            ),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.paypal,
                      color: Colors.blue.shade900,
                    )),
                Text('Paypal'),
                Text(
                  'N4300',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Expanded(child: Transactionlist()),
          ],
        ),
      ),
    );
  }
}

////////THIS IS TO DISPLAY THE RECENT TRANSACTION ITEM LIST
// class transactionItem extends StatelessWidget {
//   final IconData itemIcon;
//   final String itemType;
//   final int itemAmount;
//   final Color iconColor;
//   final Color iconContainerColor;

//   const transactionItem(
//       {super.key,
//       required this.itemIcon,
//       required this.itemType,
//       required this.itemAmount,
//       required this.iconColor,
//       required this.iconContainerColor});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 height: 45,
//                 width: 40,
//                 decoration: BoxDecoration(
//                     color: iconContainerColor,
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Icon(
//                   itemIcon,
//                   size: 25,
//                   color: iconColor,
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         itemType,
//                         style: TextStyle(
//                             fontSize: 17, fontWeight: FontWeight.bold),
//                       ), //this is the username
//                       //This is insight into recent message
//                     ],
//                   ),
//                 ),
//               ),
//               Column(
//                 children: [
//                   Text('N' '$itemAmount', style: TextStyle(fontSize: 13)),
//                 ],
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
