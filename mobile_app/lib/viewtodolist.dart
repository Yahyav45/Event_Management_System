// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart'as http;
//
// import 'HomeScreen/Screens/Home.dart';
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
//       home: const ViewToDoList(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class ViewToDoList extends StatefulWidget {
//   const ViewToDoList({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewToDoList> createState() => _ViewToDoListState();
// }
//
// class _ViewToDoListState extends State<ViewToDoList> {
//
//   _ViewToDoListState()
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
//   List<String> eventdate_ = <String>[];
//   List<String> reminder_ = <String>[];
//
//
//
//   Future<void> view_notification() async {
//     List<String> id = <String>[];
//     List<String> eventdate = <String>[];
//     List<String> reminder = <String>[];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/viewtodolist/';
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
//         eventdate.add(arr[i]['eventdate'].toString());
//         reminder.add(arr[i]['reminder'].toString());
//
//
//       }
//
//       setState(() {
//         id_ = id;
//         eventdate_ = eventdate;
//         reminder_ = reminder;
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
//                                     child: Text(eventdate_[index]),
//                                   ),
//                                   Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text(reminder_[index]),
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
import 'homenew.dart';
import 'managetodolist.dart';

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
      home: const ViewToDoList(title: 'To-Do List'),
    );
  }
}

class ViewToDoList extends StatefulWidget {
  const ViewToDoList({super.key, required this.title});
  final String title;

  @override
  State<ViewToDoList> createState() => _ViewToDoListState();
}

class _ViewToDoListState extends State<ViewToDoList> {
  _ViewToDoListState() {
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
      String url = '$urls/viewtodolist/';

      var data = await http.post(Uri.parse(url), body: {'lid': lid});
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];
      var arr = jsondata['data'];

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
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
      print("Error: " + e.toString());
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
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title),
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: id_.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Event Date: ${eventdate_[index]}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Reminder: ${reminder_[index]}",
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){

            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ManageToDoList(title: "To-Do List"),));
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),

      ),
    );
  }
}

// Updated Code

