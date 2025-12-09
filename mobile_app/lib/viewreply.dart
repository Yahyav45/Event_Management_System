// import 'dart:convert';
//
// import 'package:eventmanagement/HomeScreen/Screens/Home.dart';
// import 'package:eventmanagement/sendcomplaint.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart'as http;
//
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
//       home: const ViewReply(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class ViewReply extends StatefulWidget {
//   const ViewReply({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewReply> createState() => _ViewReplyState();
// }
//
// class _ViewReplyState extends State<ViewReply> {
//   _ViewReplyState()
//
//   {
//
//   view_notification();
//
//   }
//
//
//
//
//   List<String> id_ = <String>[];
//   List<String> date_ = <String>[];
//   List<String> complaint_ = <String>[];
//   List<String> reply_= <String>[];
//
//
//
//   Future<void> view_notification() async {
//     List<String> id = <String>[];
//     List<String> date = <String>[];
//     List<String> complaint = <String>[];
//     List<String> reply = <String>[];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/viewreply/';
//
//       var data = await http.post(Uri.parse(url), body: {
//
//         'lid':lid
//
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
//         complaint.add(arr[i]['complaint'].toString());
//         reply.add(arr[i]['reply'].toString());
//
//
//       }
//
//       setState(() {
//         id_ = id;
//         date_ = date;
//         complaint_ = complaint;
//         reply_ = reply;
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
//
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return WillPopScope(
//       onWillPop: () async{
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MyHomePage()),);
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
//                                     child: Text(complaint_[index]),
//                                   ),    Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text(reply_[index]),
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
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){
//             Navigator.push(context, MaterialPageRoute(builder: (context) => SendComplaint(title: 'Send Complaint',),));
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
import 'package:eventmanagement/HomeScreen/Screens/Home.dart';
import 'package:eventmanagement/sendcomplaint.dart';
import 'package:flutter/material.dart';
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
      home: const ViewReply(title: 'View Replies'),
    );
  }
}

class ViewReply extends StatefulWidget {
  const ViewReply({super.key, required this.title});
  final String title;

  @override
  State<ViewReply> createState() => _ViewReplyState();
}

class _ViewReplyState extends State<ViewReply> {
  List<String> id_ = [];
  List<String> date_ = [];
  List<String> complaint_ = [];
  List<String> reply_ = [];

  @override
  void initState() {
    super.initState();
    view_notification();
  }

  Future<void> view_notification() async {
    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url') ?? '';
      String lid = sh.getString('lid') ?? '';
      String url = '$urls/viewreply/';

      var data = await http.post(Uri.parse(url), body: {'lid': lid});
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];
      List<String> id = [];
      List<String> date = [];
      List<String> complaint = [];
      List<String> reply = [];

      for (var item in arr) {
        id.add(item['id'].toString());
        date.add(item['date'].toString());
        complaint.add(item['complaint'].toString());
        reply.add(item['reply'].toString());
      }

      setState(() {
        id_ = id;
        date_ = date;
        complaint_ = complaint;
        reply_ = reply;
      });
    } catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title, style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: id_.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(10),
          itemCount: id_.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date: ${date_[index]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Complaint: ${complaint_[index]}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Reply: ${reply_[index]}",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SendComplaint(title: 'Send Complaint'),
              ),
            );
          },
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
