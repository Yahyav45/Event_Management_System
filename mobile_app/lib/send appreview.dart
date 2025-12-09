// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart'as http;
// import 'HomeScreen/Screens/Home.dart';
// import 'homenew.dart';
// import 'login.dart';
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
//       home: const SendAppReview(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class SendAppReview extends StatefulWidget {
//   const SendAppReview({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<SendAppReview> createState() => _SendAppReviewState();
// }
//
// class _SendAppReviewState extends State<SendAppReview> {
//   TextEditingController reviewController=new TextEditingController();
//   TextEditingController ratingController=new TextEditingController();
//
//   void _incrementCounter() {
//     setState(() {
//
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 controller: ratingController,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Rating"),
//               ),
//             ), Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 controller: reviewController,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Review"),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(onPressed: () {
//
//                 send_data();
//               }, child: Text("Send")),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   void send_data()async{
//     String review=reviewController.text;
//     String rating=ratingController.text;
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     String lid = sh.getString('lid').toString();
//
//     final urls = Uri.parse('$url/sendappreview/');
//     try {
//
//       final response = await http.post(urls, body: {
//
//         "lid":lid,
//         "review":review,
//         "rating":rating,
//
//
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status=='ok') {
//
//           Fluttertoast.showToast(msg: 'Sent Successfully');
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
//

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'HomeScreen/Screens/Home.dart';
import 'homenew.dart';
import 'login.dart';

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
      home: const SendAppReview(title: 'Flutter Demo Home Page'),
    );
  }
}

class SendAppReview extends StatefulWidget {
  const SendAppReview({super.key, required this.title});

  final String title;

  @override
  State<SendAppReview> createState() => _SendAppReviewState();
}

class _SendAppReviewState extends State<SendAppReview> {
  TextEditingController reviewController = TextEditingController();
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Rate the App",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Center(
              child: RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: reviewController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Write your review",
                alignLabelWithHint: true,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: _sendData,
                child: Text("Submit Review"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendData() async {
    String review = reviewController.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/sendappreview/');
    try {
      final response = await http.post(urls, body: {
        "lid": lid,
        "review": review,
        "rating": _rating.toString(),
      });

      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          Fluttertoast.showToast(msg: 'Sent Successfully');
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MyHomePage()));
        } else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      } else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
