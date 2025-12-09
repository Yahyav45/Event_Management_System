// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'editprofile.dart';
// void main() {
//   runApp(const ViewProfile());
// }
//
// class ViewProfile extends StatelessWidget {
//   const ViewProfile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'View Profile',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const ViewProfilePage(title: 'View Profile'),
//     );
//   }
// }
//
// class ViewProfilePage extends StatefulWidget {
//   const ViewProfilePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewProfilePage> createState() => _ViewProfilePageState();
// }
//
// class _ViewProfilePageState extends State<ViewProfilePage> {
//
//   _ViewProfilePageState()
//   {
//     _send_data();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//
//
//     return WillPopScope(
//       onWillPop: () async{ return true; },
//       child: Scaffold(
//         appBar: AppBar(
//           leading: BackButton( ),
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           title: Text(widget.title),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//
//
//               CircleAvatar(radius: 30,backgroundImage: NetworkImage(photo_)),
//               Column(
//                 children: [
//                   // Image(image: NetworkImage(photo_),height: 200,width: 200,),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Text(name_),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Text(dob_),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Text(gender_),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Text(email_),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Text(phone_),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Text(place_),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Text(post_),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Text(pin_),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Text(district_),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Text(eventdate_),
//                   ),
//
//                 ],
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (context) => EditProfile(title: "Edit Profile"),));
//                 },
//                 child: Text("Edit Profile"),
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//
//   String name_="";
//   String dob_="";
//   String gender_="";
//   String email_="";
//   String phone_="";
//   String place_="";
//   String post_="";
//   String pin_="";
//   String district_="";
//   String photo_="";
//   String eventdate_="";
//
//   void _send_data() async{
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//     String lid = sh.getString('lid').toString();
//     String img_url = sh.getString('img_url').toString();
//
//     final urls = Uri.parse('$url/viewprofile/');
//     try {
//       final response = await http.post(urls, body: {
//         'lid':lid
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status=='ok') {
//           String name=jsonDecode(response.body)['name'].toString();
//           String dob=jsonDecode(response.body)['dob'].toString();
//           String gender=jsonDecode(response.body)['gender'].toString();
//           String email=jsonDecode(response.body)['email'].toString();
//           String phone=jsonDecode(response.body)['phone'].toString();
//           String place=jsonDecode(response.body)['place'].toString();
//           String post=jsonDecode(response.body)['post'].toString();
//           String pin=jsonDecode(response.body)['pin'].toString();
//           String district=jsonDecode(response.body)['district'].toString();
//           String photo=img_url+jsonDecode(response.body)['photo'].toString();
//           String eventdate=jsonDecode(response.body)['eventdate'].toString();
//
//
//
//           setState(() {
//
//             name_= name;
//             dob_= dob;
//             gender_= gender;
//             email_= email;
//             phone_= phone;
//             place_= place;
//             post_= post;
//             pin_= pin;
//             district_= district;
//             photo_= photo;
//             eventdate_=eventdate;
//           });
//
//
//
//
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
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'editprofile.dart';

void main() {
  runApp(const ViewProfile());
}

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'View Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ViewProfilePage(title: 'View Profile'),
    );
  }
}

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  _ViewProfilePageState() {
    _send_data();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          backgroundColor: Theme.of(context).colorScheme.primary,
          title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(photo_),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      name_,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      email_,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildProfileInfo("Date of Birth", dob_),
                      _buildProfileInfo("Gender", gender_),
                      _buildProfileInfo("Phone", phone_),
                      _buildProfileInfo("Place", place_),
                      _buildProfileInfo("Post", post_),
                      _buildProfileInfo("Pin", pin_),
                      _buildProfileInfo("District", district_),
                      _buildProfileInfo("Event Date", eventdate_),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfile(title: "Edit Profile"),
                    ),
                  );
                },
                icon: const Icon(Icons.edit),
                label: const Text("Edit Profile"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.grey.shade700),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "$title: $value",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  String name_ = "";
  String dob_ = "";
  String gender_ = "";
  String email_ = "";
  String phone_ = "";
  String place_ = "";
  String post_ = "";
  String pin_ = "";
  String district_ = "";
  String photo_ = "";
  String eventdate_ = "";

  void _send_data() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String img_url = sh.getString('img_url').toString();

    final urls = Uri.parse('$url/viewprofile/');
    try {
      final response = await http.post(urls, body: {'lid': lid});
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          setState(() {
            name_ = jsonDecode(response.body)['name'].toString();
            dob_ = jsonDecode(response.body)['dob'].toString();
            gender_ = jsonDecode(response.body)['gender'].toString();
            email_ = jsonDecode(response.body)['email'].toString();
            phone_ = jsonDecode(response.body)['phone'].toString();
            place_ = jsonDecode(response.body)['place'].toString();
            post_ = jsonDecode(response.body)['post'].toString();
            pin_ = jsonDecode(response.body)['pin'].toString();
            district_ = jsonDecode(response.body)['district'].toString();
            photo_ = img_url + jsonDecode(response.body)['photo'].toString();
            eventdate_ = jsonDecode(response.body)['eventdate'].toString();
          });
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
