//
//
// import 'dart:io';
//
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'LoginScreen/login.dart';
// import 'login.dart';
//
//
// void main() {
//   runApp(const MyMySignup());
// }
//
// class MyMySignup extends StatelessWidget {
//   const MyMySignup({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MySignup',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyMySignupPage(title: 'MySignup'),
//     );
//   }
// }
//
// class MyMySignupPage extends StatefulWidget {
//   const MyMySignupPage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyMySignupPage> createState() => _MyMySignupPageState();
// }
//
// class _MyMySignupPageState extends State<MyMySignupPage> {
//
//   String gender = "Male";
//   String photo = "";
//   File? uploadimage;
//   TextEditingController nameController = new TextEditingController();
//   TextEditingController phoneController = new TextEditingController();
//   TextEditingController emailController = new TextEditingController();
//   TextEditingController dobController = new TextEditingController();
//   TextEditingController placeController = new TextEditingController();
//   TextEditingController postController = new TextEditingController();
//   TextEditingController pinController = new TextEditingController();
//   TextEditingController districtController = new TextEditingController();
//   TextEditingController eventdateController = new TextEditingController();
//   TextEditingController passwordController = new TextEditingController();
//   TextEditingController confirmpasswordController = new TextEditingController();
//
//
//   // Future<void> chooseImage() async {
//   //   // final choosedimage = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //   //set source: ImageSource.camera to get image from camera
//   //   setState(() {
//   //     // uploadimage = File(choosedimage!.path);
//   //   });
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme
//               .of(context)
//               .colorScheme
//               .inversePrimary,
//           title: Text(widget.title),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               if (_selectedImage != null) ...{
//                 InkWell(
//                   child:
//                   Image.file(_selectedImage!, height: 400,),
//                   radius: 399,
//                   onTap: _checkPermissionAndChooseImage,
//                   // borderRadius: BorderRadius.all(Radius.circular(200)),
//                 ),
//               } else
//                 ...{
//                   // Image(image: NetworkImage(),height: 100, width: 70,fit: BoxFit.cover,),
//                   InkWell(
//                     onTap: _checkPermissionAndChooseImage,
//                     child: Column(
//                       children: [
//                         Image(image: NetworkImage(
//                             'https://cdn.pixabay.com/photo/2017/11/10/05/24/select-2935439_1280.png'),
//                           height: 200,
//                           width: 200,),
//                         Text('Select Image',
//                             style: TextStyle(color: Colors.cyan))
//                       ],
//                     ),
//                   ),
//                 },
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), label: Text("Name")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(
//                   controller: dobController,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), label: Text("DoB")),
//                 ),
//               ),
//               RadioListTile(
//                 value: "Male", groupValue: gender, onChanged: (value) {
//                 setState(() {
//                   gender = "Male";
//                 });
//               }, title: Text("Male"),),
//               RadioListTile(
//                 value: "Female", groupValue: gender, onChanged: (value) {
//                 setState(() {
//                   gender = "Female";
//                 });
//               }, title: Text("Female"),),
//               RadioListTile(
//                 value: "Other", groupValue: gender, onChanged: (value) {
//                 setState(() {
//                   gender = "Other";
//                 });
//               }, title: Text("Other"),),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(controller: emailController,
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), label: Text("Email")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(controller: phoneController,
//
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), label: Text("Phone")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(controller: placeController,
//
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), label: Text("Place")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(controller: postController,
//
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), label: Text("Post")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(controller: eventdateController,
//
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), label: Text("Eventdate")),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(controller: pinController,
//
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), label: Text("Pin")),
//                 ),
//               ), Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(controller: districtController,
//
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), label: Text("District")),
//                 ),
//               ), Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(controller: passwordController,
//
//                   decoration: InputDecoration(
//                       border: OutlineInputBorder(), label: Text("Password")),
//                 ),
//               ), Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: TextFormField(controller: confirmpasswordController,
//
//                   decoration: InputDecoration(border: OutlineInputBorder(),
//                       label: Text("Confirm Password")),
//                 ),
//               ),
//
//               ElevatedButton(
//                 onPressed: () {
//                   _send_data();
//                 },
//                 child: Text("Signup"),
//               ),
//
//               TextButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (context) => MyLoginScreen(),));
//
//                 },
//                 child: Text("Login"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _send_data() async {
//     String uname = nameController.text;
//     String uphone = phoneController.text;
//     String uemail = emailController.text;
//     String udob = dobController.text;
//     String uplace = placeController.text;
//     String upost = postController.text;
//     String upin = pinController.text;
//     String udistrict = districtController.text;
//     String ueventdate = eventdateController.text;
//     String upassword = passwordController.text;
//     String uconfirmpassword = confirmpasswordController.text;
//
//
//     SharedPreferences sh = await SharedPreferences.getInstance();
//     String url = sh.getString('url').toString();
//
//     final urls = Uri.parse('$url/signup_user/');
//     try {
//       final response = await http.post(urls, body: {
//         "photo": photo,
//         'name': uname,
//         'phone': uphone,
//         "gender":gender,
//         'email': uemail,
//         'dob': udob,
//         'place': uplace,
//         'post': upost,
//         'pin': upin,
//         'district': udistrict,
//         'eventdate': ueventdate,
//         'password': upassword,
//         'confirmpassword': uconfirmpassword,
//
//
//       });
//       if (response.statusCode == 200) {
//         String status = jsonDecode(response.body)['status'];
//         if (status == 'ok') {
//           Fluttertoast.showToast(msg: 'Registration Successfull');
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) => MyLoginScreen(),));
//         } else {
//           Fluttertoast.showToast(msg: 'Not Found');
//         }
//       }
//       else {
//         Fluttertoast.showToast(msg: 'Network Error');
//       }
//     }
//     catch (e) {
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }
//
//   File? _selectedImage;
//   String? _encodedImage;
//
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
//     final PermissionStatus status = (await Permission.mediaLibrary
//         .request()) as PermissionStatus;
//     if (status.isGranted) {
//       _chooseAndUploadImage();
//     } else {
//       showDialog(
//         context: context,
//         builder: (BuildContext context) =>
//             AlertDialog(
//               title: const Text('Permission Denied'),
//               content: const Text(
//                 'Please go to app settings and grant permission to choose an image.',
//               ),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text('OK'),
//                 ),
//               ],
//             ),
//       );
//     }
//   }
// }
//
// //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'LoginScreen/login.dart';
import 'login.dart';

void main() {
  runApp(const MyMySignup());
}

class MyMySignup extends StatelessWidget {
  const MyMySignup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MySignup',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: const MyMySignupPage(title: 'MySignup'),
    );
  }
}

class MyMySignupPage extends StatefulWidget {
  const MyMySignupPage({super.key, required this.title});
  final String title;

  @override
  State<MyMySignupPage> createState() => _MyMySignupPageState();
}

class _MyMySignupPageState extends State<MyMySignupPage> {
  String gender = "Male";
  String photo = "";
  File? _selectedImage;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController postController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController eventdateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Profile Image Selector
            GestureDetector(
              onTap: _checkPermissionAndChooseImage,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[300],
                backgroundImage: _selectedImage != null
                    ? FileImage(_selectedImage!)
                    : null,
                child: _selectedImage == null
                    ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[700])
                    : null,
              ),
            ),
            SizedBox(height: 10),
            Text('Select Profile Image',
                style: TextStyle(fontSize: 14, color: Colors.deepPurple)),
            SizedBox(height: 20),

            // Form Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildTextField("Name", nameController),


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
                      labelText: "Date of birth",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                ),
              ),
                    // _buildTextField("Date of Birth", dobController),
                    // _buildGenderSelection(),


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
                    _buildTextField("Email", emailController),
                    _buildTextField("Phone", phoneController),
                    _buildTextField("Place", placeController),
                    _buildTextField("Post", postController),
                    _buildTextField("Event Date", eventdateController),
                    _buildTextField("Pin Code", pinController),
                    _buildTextField("District", districtController),
                    _buildTextField("Password", passwordController, obscureText: true),
                    _buildTextField("Confirm Password", confirmpasswordController, obscureText: true),
                    SizedBox(height: 20),

                    // Signup Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _send_data,
                        child: Text("Sign Up"),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Login Button
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => MyLoginScreen(),
                        ));
                      },
                      child: Text("Already have an account? Login",
                          style: TextStyle(color: Colors.deepPurple)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          filled: true,
          fillColor: Colors.grey[200],
        ),
      ),
    );
  }

  Widget _buildGenderSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender", style: TextStyle(fontSize: 16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildRadio("Male"),
            _buildRadio("Female"),
            _buildRadio("Other"),
          ],
        ),
      ],
    );
  }

  Widget _buildRadio(String value) {
    return Expanded(
      child: RadioListTile(
        title: Text(value),
        value: value,
        groupValue: gender,
        onChanged: (val) {
          setState(() {
            gender = val!;
          });
        },
      ),
    );
  }

  Future<void> _checkPermissionAndChooseImage() async {
    final status = await Permission.mediaLibrary.request();
    if (status.isGranted) {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
          photo = base64Encode(_selectedImage!.readAsBytesSync());
        });
      }
    }
  }

  void _send_data() async {}
}
//

// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'dart:io';
// import 'dart:convert';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'LoginScreen/login.dart';
//
// void main() {
//   runApp(const MyMySignup());
// }
//
// class MyMySignup extends StatelessWidget {
//   const MyMySignup({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MySignup',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//         inputDecorationTheme: InputDecorationTheme(
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//       home: const MyMySignupPage(title: 'MySignup'),
//     );
//   }
// }
//
// class MyMySignupPage extends StatefulWidget {
//   const MyMySignupPage({super.key, required this.title});
//   final String title;
//
//   @override
//   State<MyMySignupPage> createState() => _MyMySignupPageState();
// }
//
// class _MyMySignupPageState extends State<MyMySignupPage> {
//   final _formKey = GlobalKey<FormState>();
//   String gender = "Male";
//   String photo = "";
//   File? _selectedImage;
//   TextEditingController nameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController dobController = TextEditingController();
//   TextEditingController placeController = TextEditingController();
//   TextEditingController postController = TextEditingController();
//   TextEditingController pinController = TextEditingController();
//   TextEditingController districtController = TextEditingController();
//   TextEditingController eventdateController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmpasswordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: Text(widget.title, style: TextStyle(color: Colors.white)),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: _checkPermissionAndChooseImage,
//                 child: CircleAvatar(
//                   radius: 60,
//                   backgroundColor: Colors.grey[300],
//                   backgroundImage: _selectedImage != null ? FileImage(_selectedImage!) : null,
//                   child: _selectedImage == null
//                       ? Icon(Icons.camera_alt, size: 40, color: Colors.grey[700])
//                       : null,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text('Select Profile Image',
//                   style: TextStyle(fontSize: 14, color: Colors.deepPurple)),
//               SizedBox(height: 20),
//
//               Card(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//                 elevation: 4,
//                 child: Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     children: [
//                       _buildTextField("Name", nameController),
//                       _buildTextField("Email", emailController, isEmail: true),
//                       _buildTextField("Phone", phoneController, isPhone: true),
//                       _buildTextField("Place", placeController),
//                       _buildTextField("Post", postController),
//                       _buildTextField("Pin Code", pinController),
//                       _buildTextField("District", districtController),
//                       _buildTextField("Password", passwordController, obscureText: true),
//                       _buildTextField("Confirm Password", confirmpasswordController, obscureText: true),
//                       SizedBox(height: 20),
//
//                       SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: _validateAndSubmit,
//                           child: Text("Sign Up"),
//                         ),
//                       ),
//                       SizedBox(height: 10),
//
//                       TextButton(
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(
//                             builder: (context) => MyLoginScreen(),
//                           ));
//                         },
//                         child: Text("Already have an account? Login",
//                             style: TextStyle(color: Colors.deepPurple)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, TextEditingController controller,
//       {bool obscureText = false, bool isEmail = false, bool isPhone = false}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         keyboardType: isEmail
//             ? TextInputType.emailAddress
//             : isPhone
//             ? TextInputType.phone
//             : TextInputType.text,
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return 'This field is required';
//           }
//           if (isEmail && !RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+$").hasMatch(value)) {
//             return 'Enter a valid email';
//           }
//           if (isPhone && !RegExp(r"^\d{10}$").hasMatch(value)) {
//             return 'Enter a valid phone number';
//           }
//           return null;
//         },
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
//           filled: true,
//           fillColor: Colors.grey[200],
//         ),
//       ),
//     );
//   }
//
//   void _validateAndSubmit() {
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }
//     if (passwordController.text != confirmpasswordController.text) {
//       Fluttertoast.showToast(msg: 'Passwords do not match');
//       return;
//     }
//     _send_data();
//   }
//
//   Future<void> _checkPermissionAndChooseImage() async {
//     final status = await Permission.mediaLibrary.request();
//     if (status.isGranted) {
//       final picker = ImagePicker();
//       final pickedImage = await picker.pickImage(source: ImageSource.gallery);
//       if (pickedImage != null) {
//         setState(() {
//           _selectedImage = File(pickedImage.path);
//           photo = base64Encode(_selectedImage!.readAsBytesSync());
//         });
//       }
//     }
//   }
//
//   void _send_data() {
//     Fluttertoast.showToast(msg: 'Form Submitted Successfully');
//   }
// }

