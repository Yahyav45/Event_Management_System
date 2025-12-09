import 'dart:convert';

import 'package:eventmanagement/viewtodolist.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
      home: const ManageToDoList(title: 'Flutter Demo Home Page'),
    );
  }
}

class ManageToDoList extends StatefulWidget {
  const ManageToDoList({super.key, required this.title});

  final String title;

  @override
  State<ManageToDoList> createState() => _ManageToDoListState();
}

class _ManageToDoListState extends State<ManageToDoList> {
  TextEditingController eventdateController=new TextEditingController();
  TextEditingController reminderController=new TextEditingController();

  void _incrementCounter() {
    setState(() {

    });
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
                onTap: () async {
                  // Set an initial date
                  DateTime initialDate = eventdateController.text.isEmpty
                      ? DateTime.now()
                      : DateTime.parse(eventdateController.text);

                  // Open a date picker with the initial date
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2500),
                  );

                  if (pickedDate != null) {
                    eventdateController.text = "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
                controller: eventdateController,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "EVENT DATE"),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(controller: reminderController,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "REMINDER"),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                send_data();
              }, child: Text("UPDATE")),
            ),





          ],
        ),
      ),
      //
    );
  }

  void send_data()async{

    String date=eventdateController.text;
    String reminder=reminderController.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/managetodolist/');
    try {

      final response = await http.post(urls, body: {
        'date':date,
        'reminder':reminder,
        'lid':lid,


      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Registration Successfull');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ViewToDoList(title: "To-Do List"),));
        }else {
          Fluttertoast.showToast(msg: 'Not Found');
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

}
