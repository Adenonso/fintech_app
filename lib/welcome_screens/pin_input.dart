// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class PinInputPage extends StatefulWidget {
//   @override
//   _PinInputPageState createState() => _PinInputPageState();
// }

// class _PinInputPageState extends State<PinInputPage> {
//   TextEditingController _pinController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Enter PIN'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             PinCodeTextField(
//               appContext: context,
//               length: 4,
//               controller: _pinController,
//               keyboardType: TextInputType.number,
//               animationType: AnimationType.fade,
//               pinTheme: PinTheme(
//                 shape: PinCodeFieldShape.box,
//                 borderRadius: BorderRadius.circular(5),
//                 fieldHeight: 50,
//                 fieldWidth: 40,
//                 activeFillColor: Colors.white,
//               ),
//               animationDuration: Duration(milliseconds: 300),
//               backgroundColor: Colors.blue.shade50,
//               enableActiveFill: true,
//               onCompleted: (v) {
//                 print("Completed");
//               },
//               onChanged: (value) {
//                 print(value);
//               },
//               beforeTextPaste: (text) {
//                 return true;
//               },
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                   childAspectRatio: 2,
//                 ),
//                 itemCount: 12,
//                 itemBuilder: (context, index) {
//                   if (index == 9) {
//                     return SizedBox.shrink();
//                   } else if (index == 10) {
//                     return _buildNumberButton(0);
//                   } else if (index == 11) {
//                     return IconButton(
//                       icon: Icon(Icons.backspace),
//                       onPressed: () {
//                         if (_pinController.text.isNotEmpty) {
//                           _pinController.text = _pinController.text
//                               .substring(0, _pinController.text.length - 1);
//                         }
//                       },
//                     );
//                   } else {
//                     return _buildNumberButton(index + 1);
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildNumberButton(int number) {
//     return GestureDetector(
//       onTap: () {
//         if (_pinController.text.length < 4) {
//           _pinController.text += number.toString();
//         }
//       },
//       child: Container(
//         margin: EdgeInsets.all(8.0),
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: Colors.blue,
//         ),
//         child: Center(
//           child: Text(
//             number.toString(),
//             style: TextStyle(
//               fontSize: 24,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
