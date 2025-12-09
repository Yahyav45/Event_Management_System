import 'dart:convert';

import 'package:eventmanagement/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'forgotpassword.dart';
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
      home: const ChangePassword(title: 'Flutter Demo Home Page'),
    );
  }
}

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key, required this.title});

  final String title;

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldpasswordController = new TextEditingController();
  TextEditingController newpasswordController = new TextEditingController();
  TextEditingController confirmpasswordController = new TextEditingController();

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
              child: TextFormField(
                controller: oldpasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "OLD PASSWORD"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: newpasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "NEW PASSWORD"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: confirmpasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "CONFIRM PASSWORD"),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ForgotPassword(),));
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color(0xff4c505b),
                    fontSize: 18,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: () {

                send_data();
              }, child: Text("UPDATE")),
            )
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
    String oldpassword = oldpasswordController.text;
    String newpassword = newpasswordController.text;
    String confirmpassword = confirmpasswordController.text;


    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/user_changepassword/');
    try {

      final response = await http.post(urls, body: {
        "oldpassword":oldpassword,
        "newpassword":newpassword,
        "confirmpassword":confirmpassword,
        "lid":lid,


      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Password Changed');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => mylog(title: "Login"),));
        }else {
          Fluttertoast.showToast(msg: 'Incorrect password');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }


  String photo = '';

}
