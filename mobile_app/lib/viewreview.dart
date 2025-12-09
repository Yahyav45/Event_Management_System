// import 'dart:convert';
//
// import 'package:eventmanagement/HomeScreen/Screens/Home.dart';
// import 'package:eventmanagement/send%20appreview.dart';
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
//       home: const ViewReview(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class ViewReview extends StatefulWidget {
//   const ViewReview({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewReview> createState() => _ViewReviewState();
// }
//
// class _ViewReviewState extends State<ViewReview> {
//   _ViewReviewState()
//
//   {
//
//     view_notification();
//
//   }
//
//
//
//
//   List<String> id_ = <String>[];
//   List<String> date_ = <String>[];
//   List<String> review_ = <String>[];
//   List<String> rating_= <String>[];
//   List<String> user_= <String>[];
//
//
//
//   Future<void> view_notification() async {
//     List<String> id = <String>[];
//     List<String> date = <String>[];
//     List<String> review = <String>[];
//     List<String> rating = <String>[];
//     List<String> user = <String>[];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String lid = sh.getString('lid').toString();
//       String url = '$urls/viewappreview/';
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
//         review.add(arr[i]['review'].toString());
//         rating.add(arr[i]['rating'].toString());
//         user.add(arr[i]['user'].toString());
//
//
//       }
//
//       setState(() {
//         id_ = id;
//         date_ = date;
//         review_ = review;
//         rating_ = rating;
//         user_ = user;
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
//                                     child: Text(review_[index]),
//                                   ),    Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text(rating_[index]),
//                                   ), Padding(
//                                     padding: EdgeInsets.all(5),
//                                     child: Text(user_[index]),
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
//             Navigator.push(context, MaterialPageRoute(builder: (context) => SendAppReview(title: 'Send Review',),));
//
//           },
//           tooltip: 'Increment',
//           child: const Icon(Icons.add),
//         ),
//
//
//
//
//       ),
//     );
//   }
// }


import 'dart:convert';

import 'package:eventmanagement/HomeScreen/Screens/Home.dart';
import 'package:eventmanagement/send%20appreview.dart';
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
      home: const ViewReview(title: 'Flutter Demo Home Page'),
    );
  }
}

class ViewReview extends StatefulWidget {
  const ViewReview({super.key, required this.title});

  final String title;

  @override
  State<ViewReview> createState() => _ViewReviewState();
}

class _ViewReviewState extends State<ViewReview> {
  _ViewReviewState() {
    view_notification();
  }

  List<String> id_ = <String>[];
  List<String> date_ = <String>[];
  List<String> review_ = <String>[];
  List<String> rating_ = <String>[];
  List<String> user_ = <String>[];

  Future<void> view_notification() async {
    List<String> id = <String>[];
    List<String> date = <String>[];
    List<String> review = <String>[];
    List<String> rating = <String>[];
    List<String> user = <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String url = '$urls/viewappreview/';

      var data = await http.post(Uri.parse(url), body: {
        'lid': lid
      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        date.add(arr[i]['date'].toString());
        review.add(arr[i]['review'].toString());
        rating.add(arr[i]['rating'].toString());
        user.add(arr[i]['user'].toString());
      }

      setState(() {
        id_ = id;
        date_ = date;
        review_ = review;
        rating_ = rating;
        user_ = user;
      });
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
          title: Text(widget.title, style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: id_.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(date_[index],
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                      SizedBox(height: 5),
                      Text(review_[index],
                          style: TextStyle(fontSize: 16, color: Colors.black87)),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Rating: ${rating_[index]}",
                              style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold)),
                          Text("User: ${user_[index]}",
                              style: TextStyle(color: Colors.blueAccent)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SendAppReview(title: 'Send Review')),
            );
          },
          backgroundColor: Colors.deepPurple,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}

