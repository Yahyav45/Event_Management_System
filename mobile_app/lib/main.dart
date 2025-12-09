import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'LoginScreen/login.dart';
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
      home: const ippage(title: 'Flutter Demo Home Page'),
    );
  }
}

class ippage extends StatefulWidget {
  const ippage({super.key, required this.title});

  final String title;

  @override
  State<ippage> createState() => _ippageState();
}

class _ippageState extends State<ippage> {

  TextEditingController ipController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(

          backgroundColor: Theme.of(context).colorScheme.inversePrimary,

          title: Text(widget.title),
        ),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: ipController,
                  decoration: InputDecoration(border: OutlineInputBorder(),label: Text("IP ADDRESS")),
                ),
              ),

              ElevatedButton(onPressed: (){
                _send_data();
              }, child: Text("submit"))

            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: _incrementCounter,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }



  void _send_data() async{


    String ipname=ipController.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString("url","http://"+ipname+":8000/myapp");
    sh.setString("img_url","http://"+ipname+":8000");

    // Navigator.push(context, MaterialPageRoute(
    //   builder: (context) => MyLoginPage(title: "Home"),));
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => MyLoginScreen(),));

  }


}
