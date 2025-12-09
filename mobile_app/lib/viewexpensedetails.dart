// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart'as http;
//
// import 'HomeScreen/Screens/Home.dart';
// import 'expensedetails.dart';
// import 'homenew.dart';
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
//       home: const ViewExpenseDetails(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class ViewExpenseDetails extends StatefulWidget {
//   const ViewExpenseDetails({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewExpenseDetails> createState() => _ViewExpenseDetailsState();
// }
//
// class _ViewExpenseDetailsState extends State<ViewExpenseDetails> {
//
//   _ViewExpenseDetailsState()
//   {
//     view_notification();
//   }
//
//   // {"id": i.id,
//   // "date": i.date,
//   // "complaint": i.complaint,
//   // "reply": i.reply})
//
//   List<String> id_ = <String>[];
//   List<String> date_ = <String>[];
//   List<String> amount_ = <String>[];
//   List<String> narration_= <String>[];
//
//
//
//   Future<void> view_notification() async {
//     List<String> id = <String>[];
//     List<String> date = <String>[];
//     List<String> amount = <String>[];
//     List<String> narration = <String>[];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/viewexpensedetails/';
//
//       var data = await http.post(Uri.parse(url), body: {
//
// 'lid':lid
//       });
//       var jsondata = json.decode(data.body);
//       String statuss = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr.length);
//
//       for (int i = 0; i < arr.length; i++) {
//         id.add(arr[i]['id'].toString());
//         date.add(arr[i]['date'].toString());
//         amount.add(arr[i]['amount'].toString());
//         narration.add(arr[i]['narration'].toString());
//
//
//       }
//
//       setState(() {
//         id_ = id;
//         date_ = date;
//         amount_ = amount;
//         narration_ = narration;
//       });
//
//       print(statuss);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return WillPopScope(
//       onWillPop: () async{
//
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MyHomePage()),);
//
//
//         return true; },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: BackButton( onPressed:() {
//
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MyHomePage()),);
//
//           },),
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           title: Text(widget.title),
//         ),
//         body: ListView.builder(
//           physics: BouncingScrollPhysics(),
//           // padding: EdgeInsets.all(5.0),
//           // shrinkWrap: true,
//           itemCount: id_.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//               onLongPress: () {
//                 print("long press" + index.toString());
//               },
//               title: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     children: [
//                       Card(
//                         child:
//                         Row(
//                             children: [
//                               Column(
//                                 children: [
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text(date_[index]),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text(amount_[index]),
//                                   ),    Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text(narration_[index]),
//                                   ),
//                                 ],
//                               ),
//
//                             ]
//                         ),
//
//                         elevation: 8,
//                         margin: EdgeInsets.all(10),
//                       ),
//                     ],
//                   )),
//             );
//           },
//         ),
//
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseDetails(title: 'Add Expense',),));
//
//           },
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ),
//
//
//
//       ),
//     );
//   }
// }



import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen/Screens/Home.dart';
import 'expensedetails.dart';
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
      home: const ViewExpenseDetails(title: 'Expense Details'),
    );
  }
}

class ViewExpenseDetails extends StatefulWidget {
  const ViewExpenseDetails({super.key, required this.title});
  final String title;
  @override
  State<ViewExpenseDetails> createState() => _ViewExpenseDetailsState();
}

class _ViewExpenseDetailsState extends State<ViewExpenseDetails> {
  _ViewExpenseDetailsState() {
    view_notification();
  }

  List<String> id_ = [];
  List<String> date_ = [];
  List<String> amount_ = [];
  List<String> narration_ = [];

  Future<void> view_notification() async {
    List<String> id = [];
    List<String> date = [];
    List<String> amount = [];
    List<String> narration = [];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/viewexpensedetails/';
      var data = await http.post(Uri.parse(url), body: {'lid': lid});
      var jsondata = json.decode(data.body);
      var arr = jsondata["data"];

      for (var item in arr) {
        id.add(item['id'].toString());
        date.add(item['date'].toString());
        amount.add(item['amount'].toString());
        narration.add(item['narration'].toString());
      }

      setState(() {
        id_ = id;
        date_ = date;
        amount_ = amount;
        narration_ = narration;
      });
    } catch (e) {
      print("Error: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage())),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: id_.length,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date: ${date_[index]}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text("Amount: ₹${amount_[index]}", style: TextStyle(fontSize: 14, color: Colors.green)),
                      SizedBox(height: 5),
                      Text("Narration: ${narration_[index]}", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseDetails(title: 'Add Expense')));
          },
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

