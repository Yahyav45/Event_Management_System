//
// import 'package:eventmanagement/signup.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'homenew.dart';
//
//
// void main() {
//   runApp(const MyLogin());
// }
//
// class MyLogin extends StatelessWidget {
//   const MyLogin({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const mylog(title: 'Login'),
//     );
//   }
// }
//
// class mylog extends StatefulWidget {
//   const mylog({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<mylog> createState() => _mylogState();
// }
//
// class _mylogState extends State<mylog> {
//
//
//   TextEditingController unameController = new TextEditingController();
//   TextEditingController passController = new TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return WillPopScope(
//       onWillPop: () async{ return true; },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//           title: Text(widget.title),
//         ),
//
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: unameController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Username")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextField(
//                   controller: passController,
//                   decoration: InputDecoration(border: OutlineInputBorder(),label: Text("Password")),
//                 ),
//               ),
//
//               ElevatedButton(
//                 onPressed: () {
//                   _send_data();
//                 },
//                 child: Text("Login"),
//               ),TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => MyMySignupPage(title: '',)),
//                   );
//                 },
//                 child: Text("Signup"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   void _send_data() async{
//
//
//     String uname=unameController.text;
//     String password=passController.text;
//
//
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//
//     final urls = Uri.parse('$url/user_loginpost/');
//     try {
//       final response = await http.post(urls, body: {
//         'uname':uname,
//         'pass':password,
//
//
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status=='ok') {
//
//           String lid=jsonDecode(response.body)['lid'].toString();
//           sh.setString("lid", lid);
//
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
//
// }

import 'package:eventmanagement/signup.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import 'homenew.dart';

void main() {
  runApp(const MyLogin());
}

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const mylog(title: 'Login'),
    );
  }
}

class mylog extends StatefulWidget {
  const mylog({super.key, required this.title});

  final String title;

  @override
  State<mylog> createState() => _mylogState();
}

class _mylogState extends State<mylog> {
  TextEditingController unameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{ return true; },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50), // Provides spacing from the top
              Center(
                child: Text(
                  'EVENTDEX',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20), // Provides spacing between title and input fields
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: unameController,
                  decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Username")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: passController,
                  decoration: InputDecoration(border: OutlineInputBorder(), label: Text("Password")),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _send_data();
                },
                child: Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyMySignupPage(title: '',)),
                  );
                },
                child: Text("Signup"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _send_data() async {
    String uname = unameController.text;
    String password = passController.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/user_loginpost/');
    try {
      final response = await http.post(urls, body: {
        'uname': uname,
        'pass': password,
      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          String lid = jsonDecode(response.body)['lid'].toString();
          sh.setString("lid", lid);

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
}
