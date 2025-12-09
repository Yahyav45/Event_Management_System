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
      home: const EditProfile(title: 'Flutter Demo Home Page'),
    );
  }
}

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.title});

  final String title;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String gender = "";
  String photo_ = '';

  _EditProfileState()
  {
    a();
  }


  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController dobController = new TextEditingController();
  TextEditingController placeController = new TextEditingController();
  TextEditingController postController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();
  TextEditingController districtController = new TextEditingController();
  TextEditingController eventdateController = new TextEditingController();
  TextEditingController photoController = new TextEditingController();

  String gender_="";
  String upic="";



  void _edit_data() async {
    String uname = nameController.text;
    String uphone = phoneController.text;
    String uemail = emailController.text;
    String udob = dobController.text;
    String uplace = placeController.text;
    String upost = postController.text;
    String upin = pinController.text;
    String udistrict = districtController.text;
    String ueventdate = eventdateController.text;


    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();

    final urls = Uri.parse('$url/edit_user/');
    try {
      final response = await http.post(urls, body: {
        "photo": photo_,
        'name': uname,
        'phone': uphone,
        "gender":gender,
        'email': uemail,
        'dob': udob,
        'place': uplace,
        'post': upost,
        'pin': upin,
        'district': udistrict,
        'eventdate': ueventdate,
        'lid': sh.getString("lid").toString()


      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status == 'ok') {
          Fluttertoast.showToast(msg: 'Updated succesfully');
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyHomePage(),));
        } else {
          Fluttertoast.showToast(msg: 'Not Found');
        }
      }
      else {
        Fluttertoast.showToast(msg: 'Network Error');
      }
    }
    catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  a() async{

    SharedPreferences sh = await SharedPreferences.getInstance();
    String url = sh.getString('url').toString();
    String lid = sh.getString('lid').toString();
    String img_url = sh.getString('img_url').toString();


    final urls = Uri.parse('$url/viewprofile/');
    try {
      final response = await http.post(urls, body: {
        'lid':lid
      });
      if (response.statusCode == 200) {
        String status = jsonDecode(response.body)['status'];
        if (status=='ok') {
          String name=jsonDecode(response.body)['name'].toString();
          String dob=jsonDecode(response.body)['dob'].toString();
          String genders=jsonDecode(response.body)['gender'].toString();
          String email=jsonDecode(response.body)['email'].toString();
          String phone=jsonDecode(response.body)['phone'].toString();
          String place=jsonDecode(response.body)['place'].toString();
          String post=jsonDecode(response.body)['post'].toString();
          String pin=jsonDecode(response.body)['pin'].toString();
          String district=jsonDecode(response.body)['district'].toString();
          String photo=img_url+jsonDecode(response.body)['photo'].toString();
          String eventdate=jsonDecode(response.body)['eventdate'].toString();



          nameController.text= name;
          dobController.text= dob;

          emailController.text= email;
          phoneController.text= phone;
          placeController.text= place;
          postController.text= post;
          pinController.text= pin;
          districtController.text= district;
          eventdateController.text=eventdate;

          setState(() {


            gender= genders;
            upic= photo;


          });




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



  void _incrementCounter() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              if (_selectedImage != null) ...{
                InkWell(
                  child:
                  Image.file(_selectedImage!, height: 400,),
                  radius: 399,
                  onTap: _checkPermissionAndChooseImage,
                  // borderRadius: BorderRadius.all(Radius.circular(200)),
                ),
              } else
                ...{
                  InkWell(
                    onTap: _checkPermissionAndChooseImage,
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                              upic
                          ),
                          height: 200,
                          width: 200,),
                        Text('Select Image', style: TextStyle(color: Colors.cyan))
                      ],
                    ),
                  ),
                },




              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Name")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(
                  onTap: () async {
                    // Set an initial date
                    DateTime initialDate = dobController.text.isEmpty
                        ? DateTime.now()
                        : DateTime.parse(dobController.text);

                    // Open a date picker with the initial date
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: initialDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null) {
                      dobController.text = "${pickedDate.toLocal()}".split(' ')[0];
                    }
                  },
                  controller: dobController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("DoB")),
                ),
              ),
              RadioListTile(
                value: "Male", groupValue: gender, onChanged: (value) {
                setState(() {
                  gender = "Male";
                });
              }, title: Text("Male"),),
              RadioListTile(
                value: "Female", groupValue: gender, onChanged: (value) {
                setState(() {
                  gender = "Female";
                });
              }, title: Text("Female"),),
              RadioListTile(
                value: "Other", groupValue: gender, onChanged: (value) {
                setState(() {
                  gender = "Other";
                });
              }, title: Text("Other"),),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Email")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(controller: phoneController,

                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Phone")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(controller: placeController,

                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Place")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(controller: postController,

                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Post")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(controller: pinController,

                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Pin")),
                ),
              ), Padding(
                padding: const EdgeInsets.all(8),
                child: TextFormField(controller: districtController,

                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("District")),
                ),
              ),


              ElevatedButton(
                onPressed: () {
                  _edit_data() ;

                },
                child: Text("Edit"),
              ),

            ],
          ),
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
      String name = nameController.text;
      String phone = phoneController.text;
      String dob = dobController.text;
      String email = emailController.text;
      String place = placeController.text;
      String pin = pinController.text;
      String district = districtController.text;
      String eventdate = eventdateController.text;

      SharedPreferences sh = await SharedPreferences.getInstance();
      String url = sh.getString('url').toString();
      // String img_url = sh.getString('img_url').toString();

      final urls = Uri.parse('$url/edituserprofile/');
      try {

        final response = await http.post(urls, body: {
          // "photo":img_url+photo_,
          "photo":photo_,
          "name":name,
          "phone":phone,
          "dob":dob,
          "email":email,
          "place":place,
          "pin":pin,
          "district":district,
          "eventdate":eventdate,


        });
        if (response.statusCode == 200) {
          String status = jsonDecode(response.body)['status'];
          if (status=='ok') {

            Fluttertoast.showToast(msg: 'Updated succesfully');
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => mylog(title: "Login"),));
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



    File? _selectedImage;
    String? _encodedImage;
    Future<void> _chooseAndUploadImage() async {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
          _encodedImage = base64Encode(_selectedImage!.readAsBytesSync());
          photo_ = _encodedImage.toString();
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



}

