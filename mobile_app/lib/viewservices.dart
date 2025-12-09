// import 'dart:convert';
//
// import 'package:eventmanagement/send%20appreview.dart';
// import 'package:eventmanagement/send%20vendorreview.dart';
// import 'package:flutter/material.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
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
//       home: const ViewVendorServices(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class ViewVendorServices extends StatefulWidget {
//   const ViewVendorServices({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewVendorServices> createState() => _ViewVendorServicesState();
// }
//
// class _ViewVendorServicesState extends State<ViewVendorServices> {
//
//   _ViewVendorServicesState(){
//     view_notification();
//
//   }
//
//   // "id":i.id,
//   // "filename":i.filename,
//   // "description":i.description,
//   // "video":i.video,
//   // "date":i.date})
//
//   List<String> id_ = <String>[];
//   List<String> servicename_ = <String>[];
//   List<String> photo_ = <String>[];
//   List<String> servicefees_ = <String>[];
//
//
//
//   Future<void> view_notification() async {
//     List<String> id = <String>[];
//     List<String> servicename = <String>[];
//     List<String> photo = <String>[];
//     List<String> servicefees = <String>[];
//
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String vid = sh.getString('vid').toString();
//       String img_url = sh.getString('img_url').toString();
//       String url = '$urls/userviewvendorservice/';
//
//       var data = await http.post(Uri.parse(url), body: {
//
//         "vid":vid,
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
//         servicename.add(arr[i]['servicename'].toString());
//         photo.add(img_url+arr[i]['photo'].toString());
//         servicefees.add(urls+ arr[i]['servicefees'].toString());
//
//
//       }
//
//       setState(() {
//         id_ = id;
//         servicename_ = servicename;
//         photo_ = photo;
//         servicefees_ = servicefees;
//
//         });
//
//       print(statuss);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
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
//       body: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         // padding: EdgeInsets.all(5.0),
//         // shrinkWrap: true,
//         itemCount: servicename_.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             onLongPress: () {
//               print("long press" + index.toString());
//             },
//
//             title: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: [
//                     Card(
//                       child:
//                       Row(
//                           children: [
//                             CircleAvatar(radius: 30,backgroundImage: NetworkImage(photo_[index])),
//                             Column(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(servicename_[index]),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(servicefees_[index]),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(photo_[index]),
//                                 ),
//
//
//
//                                 ElevatedButton(onPressed: () async {
//
//                                   SharedPreferences sh = await SharedPreferences.getInstance();
//                                   sh.setString('vid', id_[index]).toString();
//
//                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SendVendorReview(title: 'Send Vendor-review',)));
//                                 }, child: Text('Rating')),
//
//
//                               ],
//                             ),
//
//                           ]
//                       )
//
//                       ,
//                       elevation: 8,
//                       margin: EdgeInsets.all(10),
//                     ),
//                   ],
//                 )),
//           );
//         },
//       ),
//
//     );
//   }
// }

// import 'dart:convert';
//
// import 'package:eventmanagement/send%20appreview.dart';
// import 'package:eventmanagement/send%20vendorreview.dart';
// import 'package:flutter/material.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
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
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ViewVendorServices(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class ViewVendorServices extends StatefulWidget {
//   const ViewVendorServices({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewVendorServices> createState() => _ViewVendorServicesState();
// }
//
// class _ViewVendorServicesState extends State<ViewVendorServices> {
//   _ViewVendorServicesState() {
//     view_notification();
//   }
//
//   List<String> id_ = <String>[];
//   List<String> servicename_ = <String>[];
//   List<String> photo_ = <String>[];
//   List<String> servicefees_ = <String>[];
//
//   Future<void> view_notification() async {
//     List<String> id = <String>[];
//     List<String> servicename = <String>[];
//     List<String> photo = <String>[];
//     List<String> servicefees = <String>[];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String vid = sh.getString('vid').toString();
//       String img_url = sh.getString('img_url').toString();
//       String url = '$urls/userviewvendorservice/';
//
//       var data = await http.post(Uri.parse(url), body: {
//         "vid": vid,
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
//         servicename.add(arr[i]['servicename'].toString());
//         photo.add(img_url + arr[i]['photo'].toString());
//         servicefees.add(urls + arr[i]['servicefees'].toString());
//       }
//
//       setState(() {
//         id_ = id;
//         servicename_ = servicename;
//         photo_ = photo;
//         servicefees_ = servicefees;
//       });
//
//       print(statuss);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: ListView.builder(
//         physics: BouncingScrollPhysics(),
//         itemCount: servicename_.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             onLongPress: () {
//               print("long press" + index.toString());
//             },
//             title: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(10),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           CircleAvatar(
//                             radius: 30,
//                             backgroundImage: NetworkImage(photo_[index]),
//                           ),
//                           SizedBox(width: 10), // Adds spacing
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(
//                                     servicename_[index],
//                                     style: TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(servicefees_[index]),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(photo_[index]),
//                                 ),
//                                 ElevatedButton(
//                                   onPressed: () async {
//                                     SharedPreferences sh = await SharedPreferences.getInstance();
//                                     sh.setString('vid', id_[index]).toString();
//
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => SendVendorReview(
//                                           title: 'Send Vendor-review',
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Text('Rating'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     elevation: 8,
//                     margin: EdgeInsets.all(10),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:eventmanagement/send%20appreview.dart';
import 'package:eventmanagement/send%20vendorreview.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      home: const ViewVendorServices(title: 'Flutter Demo Home Page'),
    );
  }
}

class ViewVendorServices extends StatefulWidget {
  const ViewVendorServices({super.key, required this.title});

  final String title;

  @override
  State<ViewVendorServices> createState() => _ViewVendorServicesState();
}

class _ViewVendorServicesState extends State<ViewVendorServices> {
  _ViewVendorServicesState() {
    view_notification();
  }

  List<String> id_ = <String>[];
  List<String> servicename_ = <String>[];
  List<String> photo_ = <String>[];
  List<String> servicefees_ = <String>[];

  Future<void> view_notification() async {
    List<String> id = <String>[];
    List<String> servicename = <String>[];
    List<String> photo = <String>[];
    List<String> servicefees = <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String vid = sh.getString('vid').toString();
      String img_url = sh.getString('img_url').toString();
      String url = '$urls/userviewvendorservice/';

      var data = await http.post(Uri.parse(url), body: {
        "vid": vid,
      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        servicename.add(arr[i]['servicename'].toString());
        photo.add(img_url + arr[i]['photo'].toString());
        servicefees.add(arr[i]['servicefees'].toString());
      }

      setState(() {
        id_ = id;
        servicename_ = servicename;
        photo_ = photo;
        servicefees_ = servicefees;
      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: servicename_.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: servicename_.length,
        itemBuilder: (BuildContext context, int index) {
          print("Image URL: " + photo_[index]);
          return ListTile(
            onLongPress: () {
              print("long press" + index.toString());
            },
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(
                            photo_[index],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.broken_image, size: 60);
                            },
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    servicename_[index],
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text("Service Fee: ${servicefees_[index]}",
                                      style: TextStyle(color: Colors.green)),
                                ),
                                SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      SharedPreferences sh = await SharedPreferences.getInstance();
                                      sh.setString('vid', id_[index]);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => SendVendorReview(
                                            title: 'Send Vendor-review',
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('Rating'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    elevation: 8,
                    margin: EdgeInsets.all(10),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
