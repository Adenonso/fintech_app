import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class IncomePage extends StatefulWidget {
  const IncomePage({super.key});

  @override
  State<IncomePage> createState() => _ExpensePageState();
}

class _ExpensePageState extends State<IncomePage> {
  XFile? _attachment;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _attachment = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          //APPBAR SHOWING EXPENSE AND BACK ARROW
          AppBar(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text('Income'),
            centerTitle: true,
          ),
          SizedBox(
            height: 60,
          ),
          //AMOUNT CONTAINER
          Container(
            width: screenWidth * 0.9,
            decoration: BoxDecoration(
                // color: Colors.deepPurple,
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'How much?',
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
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Desciprtion',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                            ), // Grey border when focused
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 20),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Wallet',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Cash', 'Credit Card', 'Bank Account']
                            .map((wallet) {
                          return DropdownMenuItem(
                            value: wallet,
                            child: Text(wallet),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 20),
                      _attachment == null
                          ? GestureDetector(
                              onTap: () {
                                _pickImage();
                              },
                              child: Container(
                                height: 55,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.attachment, size: 30),
                                    TextButton(
                                      onPressed: () {
                                        _showModalBottomSheet(context);
                                      },
                                      child: Text(
                                        "Add Attachment",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Image.file(
                              File(_attachment!.path),
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                      SizedBox(height: 20),
                      //SUBMIT BUTTON
                      Container(
                          height: 55,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Repeat',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    ),
                                    Text(
                                      'Repeat transaction',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.toggle_on,
                                  size: 55,
                                  color: Colors.grey.shade400,
                                )
                              ],
                            ),
                          )),
                      SizedBox(height: 20),
                      Container(
                        //SUBMIT BUTTON
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

  ///THIS SECTION IS TO POPUP THE ADD ATTACHMENT OPTIONS
  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.deepPurple,
                        size: 30,
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo,
                        color: Colors.deepPurple,
                        size: 30,
                      ),
                      Text(
                        'Image',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade100,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_copy,
                        color: Colors.deepPurple,
                        size: 30,
                      ),
                      Text(
                        'Document',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
