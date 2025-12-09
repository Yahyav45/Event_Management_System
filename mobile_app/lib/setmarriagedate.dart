import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen/Screens/Home.dart';
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
      home: const SetMarriageDate(title: 'Flutter Demo Home Page'),
    );
  }
}

class SetMarriageDate extends StatefulWidget {
  const SetMarriageDate({super.key, required this.title});

  final String title;

  @override
  State<SetMarriageDate> createState() => _SetMarriageDateState();
}

class _SetMarriageDateState extends State<SetMarriageDate> {
  TextEditingController dateController=new TextEditingController();
  TextEditingController reminderController=new TextEditingController();



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
                  DateTime initialDate = dateController.text.isEmpty
                      ? DateTime.now()
                      : DateTime.parse(dateController.text);

                  // Open a date picker with the initial date
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: initialDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );

                  if (pickedDate != null) {
                    dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
                  }
                },
                controller: dateController,decoration: InputDecoration(border: OutlineInputBorder(),labelText: "EVENT DATE"),),
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
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.headlineMedium,
            // ),
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
  void send_data()async{

    String date=dateController.text;
    String reminder=reminderController.text;

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();

    final urls = Uri.parse('$url/setmarriagedate/');
    try {

      final response = await http.post(urls, body: {
        'date':date,
        'reminder':reminder,
        'uid':lid,


      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {

          Fluttertoast.showToast(msg: 'Event Date Added');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyHomePage(),));
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

