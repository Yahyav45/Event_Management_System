// import 'dart:convert';
//
// import 'package:flutter/material.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
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
//       home: const ViewBlogs(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class ViewBlogs extends StatefulWidget {
//   const ViewBlogs({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<ViewBlogs> createState() => _ViewBlogsState();
// }
//
// class _ViewBlogsState extends State<ViewBlogs> {
//
//   _ViewBlogsState(){
//     view_notification();
//
//   }
//
//   // "id":i.id,
//   // "filename":i.filename,
//   // "description":i.description,
//   // "video":i.video,
//   // "date":i.date})
//
//   List<String> id_ = <String>[];
//   List<String> filename_ = <String>[];
//   List<String> description_ = <String>[];
//   List<String> video_= <String>[];
//   List<String> date_= <String>[];
//
//
//
//   Future<void> view_notification() async {
//     List<String> id = <String>[];
//     List<String> filename = <String>[];
//     List<String> description = <String>[];
//     List<String> video = <String>[];
//     List<String> date= <String>[];
//
//     try {
//       SharedPreferences sh = await SharedPreferences.getInstance();
//       String urls = sh.getString('url').toString();
//       String img_url = sh.getString('img_url').toString();
//
//       String url = '$urls/userviewblogs/';
//
//       var data = await http.post(Uri.parse(url), body: {
//
//
//       });
//       var jsondata = json.decode(data.body);
//       String statuss = jsondata['status'];
//
//       var arr = jsondata["data"];
//
//       print(arr.length);
//
//       for (int i = 0; i < arr.length; i++) {
//         id.add(arr[i]['id'].toString());
//         filename.add(img_url+arr[i]['filename'].toString());
//         description.add(arr[i]['description']);
//         video.add(arr[i]['video']);
//         date.add(arr[i]['date']);
//
//
//
//
//     }
//
//       setState(() {
//         id_ = id;
//         filename_ = filename;
//         description_ = description;
//         video_ = video;
//         date_ = date;
//       });
//
//       print(statuss);
//     } catch (e) {
//       print("Error ------------------- " + e.toString());
//       //there is error during converting file image to base64 encoding.
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(
//
//           backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//
//           title: Text(widget.title),
//         ),
//         body: ListView.builder(
//           physics: BouncingScrollPhysics(),
//           // padding: EdgeInsets.all(5.0),
//           // shrinkWrap: true,
//           itemCount: id_.length,
//           itemBuilder: (BuildContext context, int index) {
//             return ListTile(
//                 onLongPress: () {
//                   print("long press" + index.toString());
//                 },
//                 title: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                       children: [
//                   Card(
//                   child:
//                   Row(
//                   children: [
//                       CircleAvatar(radius: 30,backgroundImage: NetworkImage(filename_[index])),
//                       Column(
//                       children: [
//                       Padding(
//                       padding: EdgeInsets.all(5),
//                   child: Text(date_[index]),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(5),
//                   child: Text(video_[index]),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(5),
//                   child: Text(id_[index]),
//                 ),
//                 Padding(
//                 padding: EdgeInsets.all(5),
//             child: Text(description_[index]),
//             ),
//             // Padding(
//             // padding: EdgeInsets.all(5),
//             // child: Text(video_[index]),
//             // )
//
//             ],
//             ),
//             ]
//             )
//
//             ,
//                     elevation: 8,
//                     margin: EdgeInsets.all(10),
//                   ),
//                       ],
//                   )),
//             );
//           },
//         ),
//
//     );
//   }
// }




import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import 'HomeScreen/Screens/Home.dart';
import 'homenew.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class ViewBlogs extends StatefulWidget {
  const ViewBlogs({Key? key, required String title}) : super(key: key);

  @override
  State<ViewBlogs> createState() => _ViewBlogsState();
}

class _ViewBlogsState extends State<ViewBlogs> {

  _ViewBlogsState() {
    view_notification();
  }
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  List<String> id_ = <String>[];
  List<String> filename_ = <String>[];
  List<String> description_ = <String>[];
  List<String> video_ = <String>[];
  List<String> date_ = <String>[];



  Future<void> view_notification() async {
    List<String> id = <String>[];

    List<String> video = <String>[];

    List<String> filename = <String>[];
    List<String> description = <String>[];
    List<String> date = <String>[];


    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      String urls = sh.getString('url').toString();
      String lid = sh.getString('lid').toString();
      String cateringid = sh.getString('cateringid').toString();
      String url = '$urls/userviewblogs/';
      var data = await http.post(Uri.parse(url), body: {
        'lid':lid,
        'cid':cateringid,


      });
      var jsondata = json.decode(data.body);
      String statuss = jsondata['status'];

      var arr = jsondata["data"];

      print(arr.length);

      for (int i = 0; i < arr.length; i++) {
        id.add(arr[i]['id'].toString());
        filename.add(sh.getString('img_url').toString()+arr[i]['filename']);

        video.add(sh.getString("img_url").toString()+arr[i]['video']);
        description.add(arr[i]['description']);
        date.add(arr[i]['date']);


      }

      setState(() {
        id_ = id;

        video_ = video;
        date_=date;
        description_=description;

        filename_=filename;

      });

      print(statuss);
    } catch (e) {
      print("Error ------------------- " + e.toString());
      //there is error during converting file image to base64 encoding.
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(),
          ),
        );

        return false; },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),);

            },
          ),

          backgroundColor: Theme.of(context).colorScheme.primary,

          // title: Text(widget.title),
        ),
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/cat.jpg'), fit: BoxFit.cover),
            ),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              // padding: EdgeInsets.all(5.0),
              // shrinkWrap: true,
              itemCount: id_.length,
              itemBuilder: (BuildContext context, int index) {
                // ElevatedButton(onPressed: (){}, child: Text('video')),
                // late VideoPlayerController  _controller = VideoPlayerController.networkUrl(Uri.parse(
                //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
                //   ..initialize().then((_) {
                //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                //     setState(() {});
                //   });;
                return ListTile(
                  onLongPress: () {
                    print("long press" + index.toString());
                  },
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Card(

                          child:
                          Row(
                            children: [
                              // CircleAvatar(radius: 50,backgroundImage: NetworkImage(photo_[index]),),
                              Column(
                                children: [
                                  Padding(padding: EdgeInsets.all(10),child: Row(children: [
                                    SizedBox(height: 20,
                                      width: 15,),

                                    Container(
                                      height: 200, // Set the desired image height
                                      width: 250, // Set the desired image width
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0), // Add padding only at the bottom
                                        child: Image(
                                          image: NetworkImage(filename_[index], scale: 2),
                                          fit: BoxFit.contain, // Adjust how the image fits
                                        ),
                                      ),

                                    ),

                                  ],
                                  ),
                                  ),
                                  ElevatedButton(onPressed: (){
                                    _launchURL(video_[index]);

                                  }, child: Text('video')),

                                  // Padding(
                                  //   padding: const EdgeInsets.all(4),
                                  //   child: Row(
                                  //     children: [
                                  //       SizedBox(height: 20, width: 20),
                                  //       Padding(
                                  //         padding: const EdgeInsets.all(5),
                                  //         child: Container(
                                  //           width: 250,
                                  //           child: VideoPlayerWidget(videoUrl: video_[index]),
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Row(
                                      children: [
                                        SizedBox(height: 20, width: 20),
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Container(
                                            width: 250,
                                            child: Text( date_[index]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Row(
                                      children: [
                                        SizedBox(height: 20, width: 20),
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Container(
                                            width: 250,
                                            child: Text( description_[index]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          elevation: 8,
                          margin: EdgeInsets.all(10),
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
          )
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerWidget({required this.videoUrl});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  bool isVideoPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  void toggleVideoPlayback() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        isVideoPlaying = false;
      } else {
        _controller.play();
        isVideoPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleVideoPlayback,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
          if (!isVideoPlaying)
            Icon(
              Icons.play_arrow,
              size: 64,
              color: Colors.white,
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}