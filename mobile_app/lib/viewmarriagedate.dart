import 'dart:convert';

import 'package:eventmanagement/sendcomplaint.dart';
import 'package:eventmanagement/setmarriagedate.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import 'HomeScreen/Screens/Home.dart';
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
      home: const viewmarriagedate(title: 'Flutter Demo Home Page'),
    );
  }
}

class viewmarriagedate extends StatefulWidget {
  const viewmarriagedate({super.key, required this.title});

  final String title;

  @override
  State<viewmarriagedate> createState() => _viewmarriagedateState();
}

class _viewmarriagedateState extends State<viewmarriagedate> {
  _viewmarriagedateState()

  {

    view_notification();

  }




  List<String> id_ = <String>[];
  List<String> eventdate_ = <String>[];
  List<String> reminder_ = <String>[];



  Future<void> view_notification() async {
    List<String> id = <String>[];
    List<String> eventdate = <String>[];
    List<String> reminder = <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/viewmarriagedate/';

      var data = await http.post(Uri.parse(url), body: {

        'uid':lid

      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['uid'].toString());
        eventdate.add(arr[i]['eventdate'].toString());
        reminder.add(arr[i]['reminder'].toString());


      }

      setState(() {
        id_ = id;
        eventdate_ = eventdate;
        reminder_ = reminder;
      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }
  @override
  Widget build(BuildContext context) {



    return WillPopScope(
      onWillPop: () async{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),);

        return true; },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton( onPressed:() {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),);

          },),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        // body: ListView.builder(
        //   physics: BouncingScrollPhysics(),
        //   // padding: EdgeInsets.all(5.0),
        //   // shrinkWrap: true,
        //   itemCount: id_.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       onLongPress: () {
        //         print("long press" + index.toString());
        //       },
        //       title: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Column(
        //             children: [
        //               Card(
        //                 child:
        //                 Row(
        //                     children: [
        //                       Column(
        //                         children: [
        //                           Padding(
        //                             padding: EdgeInsets.all(5),
        //                             child: Text(eventdate_[index]),
        //                           ),
        //                           Padding(
        //                             padding: EdgeInsets.all(5),
        //                             child: Text(reminder_[index]),
        //                           ),
        //                         ],
        //                       ),
        //
        //                     ]
        //                 ),
        //
        //                 elevation: 8,
        //                 margin: EdgeInsets.all(10),
        //               ),
        //             ],
        //           )),
        //     );
        //   },
        // ),

        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: id_.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(10),
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Event Date: ${eventdate_[index]}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Reminder: ${reminder_[index]}",
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SetMarriageDate(title: 'Set Date',),));

          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),



      ),
    );
  }
}


//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'homenew.dart';
// import 'setmarriagedate.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Event Management',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ViewMarriageDate(title: 'Marriage Dates'),
//     );
//   }
// }
//
// class ViewMarriageDate extends StatefulWidget {
//   const ViewMarriageDate({super.key, required this.title});
//   final String title;
//
//   @override
//   State<ViewMarriageDate> createState() => _ViewMarriageDateState();
// }
//
// class _ViewMarriageDateState extends State<ViewMarriageDate> {
//   List<String> idList = [];
//   List<String> eventDateList = [];
//   List<String> reminderList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchMarriageDates();
//   }
//
//   Future<void> _fetchMarriageDates() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String baseUrl = prefs.getString('url') ?? '';
//       String userId = prefs.getString('lid') ?? '';
//       String url = '$baseUrl/viewmarriagedate/';
//
//       var response = await http.post(Uri.parse(url), body: {'uid': userId});
//       var jsonData = json.decode(response.body);
//
//       if (jsonData['status'] == 'success') {
//         List<dynamic> data = jsonData['data'];
//         setState(() {
//           idList = data.map((item) => item['uid'].toString()).toList();
//           eventDateList = data.map((item) => item['eventdate'].toString()).toList();
//           reminderList = data.map((item) => item['reminder'].toString()).toList();
//         });
//       }
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => true,
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () => Navigator.pushReplacement(
//                 context, MaterialPageRoute(builder: (context) => HomeNew())),
//           ),
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           title: Text(widget.title),
//         ),
//         body: ListView.builder(
//           physics: const BouncingScrollPhysics(),
//           itemCount: idList.length,
//           itemBuilder: (context, index) {
//             return Card(
//               margin: const EdgeInsets.all(10),
//               elevation: 5,
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               child: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Event Date: ${eventDateList[index]}",
//                       style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 5),
//                     Text(
//                       "Reminder: ${reminderList[index]}",
//                       style: const TextStyle(fontSize: 14, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const SetMarriageDate(title: 'Set Date')),
//           ),
//           tooltip: 'Add Date',
//           child: const Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }

