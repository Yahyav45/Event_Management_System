// import 'dart:convert';
//
// import 'package:eventmanagement/send%20appreview.dart';
// import 'package:eventmanagement/send%20vendorreview.dart';
// import 'package:eventmanagement/viewservices.dart';
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
//       home: const SearchVendors(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class SearchVendors extends StatefulWidget {
//   const SearchVendors({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<SearchVendors> createState() => _SearchVendorsState();
// }
//
// class _SearchVendorsState extends State<SearchVendors> {
//
//   _SearchVendorsState(){
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
//   List<String> vendorname_ = <String>[];
//   List<String> contactnumber_ = <String>[];
//   List<String> photo_ = <String>[];
//   List<String> experience_= <String>[];
//   List<String> email_= <String>[];
//   List<String> place_= <String>[];
//   List<String> post_= <String>[];
//   List<String> pin_= <String>[];
//   List<String> district_= <String>[];
//
//
//   Future<void> view_notification() async {
//     List<String> vendorname = <String>[];
//     List<String> id = <String>[];
//     List<String> contactnumber = <String>[];
//     List<String> photo = <String>[];
//     List<String> experience= <String>[];
//     List<String> email= <String>[];
//     List<String> place = <String>[];
//     List<String> post= <String>[];
//     List<String> pin= <String>[];
//     List<String> district= <String>[];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String img_url = sh.getString('img_url').toString();
//       String url = '$urls/userviewvendor/';
//
//       var data = await http.post(Uri.parse(url), body: {
//
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
//         vendorname.add(arr[i]['vendorname'].toString());
//         id.add(arr[i]['id'].toString());
//         contactnumber.add(arr[i]['contactnumber'].toString());
//         photo.add(img_url+arr[i]['photo'].toString());
//         experience.add(urls+ arr[i]['experience'].toString());
//         email.add(arr[i]['email'].toString());
//         place.add(arr[i]['place'].toString());
//         post.add(arr[i]['post'].toString());
//         pin.add(arr[i]['pin'].toString());
//         district.add(arr[i]['district'].toString());
//
//
//       }
//
//       setState(() {
//         vendorname_ = vendorname;
//         id_ = id;
//         contactnumber_ = contactnumber;
//         photo_ = photo;
//         experience_ = experience;
//         email_ = email;
//         place_ = place;
//         post_ = post;
//         pin_ = pin;
//         district_ = district;
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
//         itemCount: vendorname_.length,
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
//                                   child: Text(vendorname_[index]),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(contactnumber_[index]),
//                                 ),
//                                 // Padding(
//                                 //   padding: EdgeInsets.all(5),
//                                 //   child: Text(photo_[index]),
//                                 // ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(experience_[index]),
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.all(5),
//                                   child: Text(email_[index]),
//                                 ),
//                                 Padding(
//                                 padding: EdgeInsets.all(5),
//                                 child: Text(place_[index]),
//                                 ),
//                                 Padding(
//                                 padding: EdgeInsets.all(5),
//                                 child: Text(post_[index]),
//                                 ),
//                                 Padding(
//                                 padding: EdgeInsets.all(5),
//                                 child: Text(pin_[index]),
//                                 ) ,
//                                 Padding(
//                                 padding: EdgeInsets.all(5),
//                                 child: Text(district_[index]),
//                                 ),
//
//                                 ElevatedButton(onPressed: () async {
//
//                                   SharedPreferences sh = await SharedPreferences.getInstance();
//                                   sh.setString('vid', id_[index]).toString();
//
//                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SendVendorReview(title: 'Send Vendor-review',)));
//                                 }, child: Text('Rating')
//                                 ),
//                                 ElevatedButton(onPressed: () async {
//
//                                   SharedPreferences sh = await SharedPreferences.getInstance();
//                                   sh.setString('vid', id_[index]).toString();
//
//                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewVendorServices(title: 'View Vendor-Services',)));
//                                 }, child: Text('Services')
//                                 ),
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
//
//

import 'dart:convert';
import 'package:eventmanagement/send%20appreview.dart';
import 'package:eventmanagement/send%20vendorreview.dart';
import 'package:eventmanagement/viewservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy_search_bar/flutter_easy_search_bar.dart';
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
      home: const SearchVendors(title: 'Flutter Demo Home Page'),
    );
  }
}

class SearchVendors extends StatefulWidget {
  const SearchVendors({super.key, required this.title});

  final String title;

  @override
  State<SearchVendors> createState() => _SearchVendorsState();
}

class _SearchVendorsState extends State<SearchVendors> {
  _SearchVendorsState() {
    view_notification("");
  }

  List<String> id_ = <String>[];
  List<String> vendorname_ = <String>[];
  List<String> contactnumber_ = <String>[];
  List<String> photo_ = <String>[];
  List<String> experience_ = <String>[];
  List<String> email_ = <String>[];
  List<String> place_ = <String>[];
  List<String> post_ = <String>[];
  List<String> pin_ = <String>[];
  List<String> district_ = <String>[];
  List<String> category_ = <String>[];

  Future<void> view_notification(value) async {
    List<String> vendorname = <String>[];
    List<String> id = <String>[];
    List<String> contactnumber = <String>[];
    List<String> photo = <String>[];
    List<String> experience = <String>[];
    List<String> email = <String>[];
    List<String> place = <String>[];
    List<String> post = <String>[];
    List<String> pin = <String>[];
    List<String> district = <String>[];
    List<String> category = <String>[];

    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String img_url = sh.getString('img_url').toString();
      String url = '$urls/userviewvendor/';

      var data = await http.post(Uri.parse(url), body: {
        'search':value,
      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];
      var arr = jsondata["data"];

      for (int i = 0; i < arr.length; i++) {
        vendorname.add(arr[i]['vendorname'].toString());
        id.add(arr[i]['id'].toString());
        contactnumber.add(arr[i]['contactnumber'].toString());
        photo.add(img_url + arr[i]['photo'].toString());
        experience.add(urls + arr[i]['experience'].toString());
        email.add(arr[i]['email'].toString());
        place.add(arr[i]['place'].toString());
        post.add(arr[i]['post'].toString());
        pin.add(arr[i]['pin'].toString());
        district.add(arr[i]['district'].toString());
        category.add(arr[i]['category'].toString());
      }

      setState(() {
        vendorname_ = vendorname;
        id_ = id;
        contactnumber_ = contactnumber;
        photo_ = photo;
        experience_ = experience;
        email_ = email;
        place_ = place;
        post_ = post;
        pin_ = pin;
        district_ = district;
        category_ = category;
      });
    } catch (e) {
      print("Error: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => MyHomePage(title: '')),
        //     );
        //   },
        // ),
        backgroundColor: Color.fromARGB(255, 232, 177, 61),
        title: Text('Search by vendorname'),
        onSearch: (value) =>view_notification(value),
        suggestions: vendorname_,
      ),
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: vendorname_.length,
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
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(photo_[index]),
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vendorname_[index],
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(category_[index], style: TextStyle(color: Colors.grey[700])),
                              Text(contactnumber_[index], style: TextStyle(color: Colors.grey[700])),
                              Text(email_[index], style: TextStyle(color: Colors.grey[700])),
                              Text("${place_[index]}, ${district_[index]}",
                                  style: TextStyle(color: Colors.grey[700])),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            SharedPreferences sh = await SharedPreferences.getInstance();
                            sh.setString('vid', id_[index]).toString();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SendVendorReview(title: 'Send Vendor Review')));
                          },
                          child: Text('Rating'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            SharedPreferences sh = await SharedPreferences.getInstance();
                            sh.setString('vid', id_[index]).toString();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ViewVendorServices(title: 'View Vendor Services')));
                          },
                          child: Text('Services'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Updated code

