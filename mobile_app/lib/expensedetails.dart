// import 'dart:convert';
//
// import 'package:eventmanagement/HomeScreen/Screens/Home.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
//
// import 'homenew.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ExpenseDetails(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class ExpenseDetails extends StatefulWidget {
//   const ExpenseDetails({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ExpenseDetails> createState() => _ExpenseDetailsState();
// }
//
// class _ExpenseDetailsState extends State<ExpenseDetails> {
//   // TextEditingController datedetailsController=new TextEditingController();
//   TextEditingController amountdetailsController=new TextEditingController();
//   TextEditingController narrationdetailsController=new TextEditingController();
//
//   void _incrementCounter() {
//     setState(() {
//
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//         title: Text(widget.title),
//       ),
//       body: Center(
//
//         child: Column(
//
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//
//
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(controller: amountdetailsController,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "AMOUNT DETAILS"),),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(controller: narrationdetailsController,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "NARRATION DETAILS"),),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(onPressed: (){
//
//
//                 _send_data();
//               }, child: Text("UPDATE")),
//             ),
//
//
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: _incrementCounter,
//       //   tooltip: 'Increment',
//       //   child: const Icon(Icons.add),
//       // ),
//     );
//   }
//
//
//   void _send_data() async{
//
//
//     String amount=amountdetailsController.text;
//     String narration=narrationdetailsController.text;
//
//
//
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//
//     String url = sh.getString('url').toString();
//     String lid = sh.getString('lid').toString();
//
//     final urls = Uri.parse('$url/addexpensedetails/');
//     try {
//       final response = await http.post(urls, body: {
//         'textfield2':amount,
//         'textfield3':narration,
//         'lid':lid,
//
//
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status=='ok') {
//
//
//
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) => MyHomePage(),));
//         }else {
//           Fluttertoast.showToast(msg: 'Not Found');
//         }
//       }
//       else {
//         Fluttertoast.showToast(msg: 'Network Error');
//       }
//     }
//     catch (e){
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
//
// }

import 'dart:convert';
import 'package:eventmanagement/HomeScreen/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'homenew.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ExpenseDetails(title: 'Flutter Demo Home Page'),
    );
  }
}

class ExpenseDetails extends StatefulWidget {
  const ExpenseDetails({super.key, required this.title});

  final String title;

  @override
  State<ExpenseDetails> createState() => _ExpenseDetailsState();
}

class _ExpenseDetailsState extends State<ExpenseDetails> {
  TextEditingController amountdetailsController = TextEditingController();
  TextEditingController narrationdetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: amountdetailsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "AMOUNT DETAILS",
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: narrationdetailsController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "NARRATION DETAILS",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _send_data();
                },
                child: Text("UPDATE"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _send_data() async {
    String amount = amountdetailsController.text.trim();
    String narration = narrationdetailsController.text.trim();

    if (amount.isEmpty || narration.isEmpty) {
      Fluttertoast.showToast(msg: "Please fill all fields");
      return;
    }

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String? url = sh.getString('url');
      String? lid = sh.getString('lid');

      if (url == null || lid == null) {
        Fluttertoast.showToast(msg: 'Invalid SharedPreferences data');
        return;
      }

      final urls = Uri.parse('$url/addexpensedetails/');
      final response = await http.post(urls, body: {
        'textfield2': amount,
        'textfield3': narration,
        'lid': lid,
      });

      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        } else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      } else {
        Fluttertoast.showToast(msg: 'invalid amount');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error: ${e.toString()}');
    }
  }
}

