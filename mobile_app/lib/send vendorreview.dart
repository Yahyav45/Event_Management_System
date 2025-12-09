// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
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
//       home: const SendVendorReview(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class SendVendorReview extends StatefulWidget {
//   const SendVendorReview({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<SendVendorReview> createState() => _SendVendorReviewState();
// }
//
// class _SendVendorReviewState extends State<SendVendorReview> {
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
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextFormField(
//                 controller: ratingController,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "Rating"),
//               ),
//             ),
//             Padding(
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
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
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
//     String pid = sh.getString('vid').toString();
//
//
//     final urls = Uri.parse('$url/sendvendorreview/');
//     try {
//
//       final response = await http.post(urls, body: {
//         "review":review,
//         "rating":rating,
//         "lid":lid,
//         "vd":pid,
//
//
//
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status=='ok') {
//
//           Fluttertoast.showToast(msg: 'Rating Successfull');
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) => HomeNewPage(title: "Home"),));
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
//   File? _selectedImage;
//   String? _encodedImage;
//   Future<void> _chooseAndUploadImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//
//     if (pickedImage != null) {
//       setState(() {
//         _selectedImage = File(pickedImage.path);
//         _encodedImage = base64Encode(_selectedImage!.readAsBytesSync());
//         photo = _encodedImage.toString();
//       });
//     }
//   }
//
//   Future<void> _checkPermissionAndChooseImage() async {
//     final PermissionStatus status = await Permission.mediaLibrary.request();
//     if (status.isGranted) {
//       _chooseAndUploadImage();
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('Permission Denied'),
//           content: const Text(
//             'Please go to app settings and grant permission to choose an image.',
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       );
//     }
//   }
//
//   String photo = '';
//
// }

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';  // Added import

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
      home: const SendVendorReview(title: 'Flutter Demo Home Page'),
    );
  }
}

class SendVendorReview extends StatefulWidget {
  const SendVendorReview({super.key, required this.title});

  final String title;

  @override
  State<SendVendorReview> createState() => _SendVendorReviewState();
}

class _SendVendorReviewState extends State<SendVendorReview> {
  TextEditingController reviewController = TextEditingController();
  double rating = 0.0; // Changed from TextEditingController to double

  void _incrementCounter() {
    setState(() {});
  }

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
              child: RatingBar.builder(
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (newRating) {
                  setState(() {
                    rating = newRating; // Update rating value
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: reviewController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Review"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  send_data();
                },
                child: const Text("Send"),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  void send_data() async {
    String review = reviewController.text;
    String ratingValue = rating.toString(); // Convert rating to string

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url') ?? ''; // Prevent null errors
    String lid = sh.getString('lid') ?? '';
    String pid = sh.getString('vid') ?? '';

    final urls = Uri.parse('$url/sendvendorreview/');
    try {
      final response = await http.post(urls, body: {
        "review": review,
        "rating": ratingValue, // Use updated rating value
        "lid": lid,
        "vd": pid,
      });

      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          Fluttertoast.showToast(msg: 'Rating Successful');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeNewPage(title: "Home")),
          );
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

  File? _selectedImage;
  String? _encodedImage;
  Future<void> _chooseAndUploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
        _encodedImage = base64Encode(_selectedImage!.readAsBytesSync());
        photo = _encodedImage.toString();
      });
    }
  }

  Future<void> _checkPermissionAndChooseImage() async {
    final PermissionStatus status = await Permission.mediaLibrary.request();
    if (status.isGranted) {
      _chooseAndUploadImage();
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Permission Denied'),
          content: const Text(
            'Please go to app settings and grant permission to choose an image.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  String photo = '';
}

