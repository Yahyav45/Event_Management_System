// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
//
// class Rooms extends StatelessWidget {
//   const Rooms({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         leading: IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Colors.blue,
//             )),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right: 30),
//             child: Icon(
//               Icons.settings_outlined,
//               color: Colors.blue,
//             ),
//           )
//         ],
//       ),
//       backgroundColor: Color(0xfff5f7fa),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 15),
//               child: Text(
//                 "Happy Clients",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 26),
//               ),
//             ),
//             Container(
//               height: size.height * .20,
//               width: size.width,
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(8),
//                   image: const DecorationImage(
//                     image: AssetImage(
//                       "assets/kiara.jpg",
//                     ),
//                     fit: BoxFit.cover,
//                   )),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 15, top: size.height * .26),
//                   // child: const Text(
//                   //   'Camera bedroom',
//                   //   style: TextStyle(
//                   //       color: Colors.white,
//                   //       fontSize: 17,
//                   //       fontWeight: FontWeight.bold),
//                   // ),
//                 ),
//               ),
//             ),
//             Container(
//               height: size.height * .20,
//               width: size.width,
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(8),
//                   image: const DecorationImage(
//                     image: AssetImage(
//                       "assets/eira.jpg",
//                     ),
//                     fit: BoxFit.cover,
//                   )),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 15, top: size.height * .26),
//                   // child: const Text(
//                   //   'Camera bedroom',
//                   //   style: TextStyle(
//                   //       color: Colors.white,
//                   //       fontSize: 17,
//                   //       fontWeight: FontWeight.bold),
//                   // ),
//                 ),
//               ),
//             ),
//             Container(
//               height: size.height * .20,
//               width: size.width,
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(8),
//                   image: const DecorationImage(
//                     image: AssetImage(
//                       "assets/ridhi.jpg",
//                     ),
//                     fit: BoxFit.cover,
//                   )),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 15, top: size.height * .26),
//                   // child: const Text(
//                   //   'Camera bedroom',
//                   //   style: TextStyle(
//                   //       color: Colors.white,
//                   //       fontSize: 17,
//                   //       fontWeight: FontWeight.bold),
//                   // ),
//                 ),
//               ),
//             ),
//             Container(
//               height: size.height * .20,
//               width: size.width,
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(8),
//                   image: const DecorationImage(
//                     image: AssetImage(
//                       "assets/akshay.jpg",
//                     ),
//                     fit: BoxFit.cover,
//                   )),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 15, top: size.height * .26),
//                   // child: const Text(
//                   //   'Camera bedroom',
//                   //   style: TextStyle(
//                   //       color: Colors.white,
//                   //       fontSize: 17,
//                   //       fontWeight: FontWeight.bold),
//                   // ),
//                 ),
//               ),
//             ),
//             Container(
//               height: size.height * .20,
//               width: size.width,
//               decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(8),
//                   image: const DecorationImage(
//                     image: AssetImage(
//                       "assets/aishu.jpg",
//                     ),
//                     fit: BoxFit.cover,
//                   )),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.black.withOpacity(0.3),
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(left: 15, top: size.height * .26),
//                   // child: const Text(
//                   //   'Camera bedroom',
//                   //   style: TextStyle(
//                   //       color: Colors.white,
//                   //       fontSize: 17,
//                   //       fontWeight: FontWeight.bold),
//                   // ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 15,),
//             DevicesGridDashboard(size: size)
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DevicesGridDashboard extends StatelessWidget {
//   const DevicesGridDashboard({
//     Key? key,
//     required this.size,
//   }) : super(key: key);
//
//   final Size size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Row(
//         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //   children: [
//         //     CardField(
//         //         size,
//         //         Icon(
//         //           Icons.lightbulb_outline,
//         //           color: Colors.orange,
//         //         ),
//         //         'Main Light',
//         //         '50%'),
//         //     CardField(size, Icon(Icons.lightbulb_outline, color: Colors.grey),
//         //         'Table Lamp', 'Off'),
//         //     CardField(size, Icon(Icons.lightbulb_outline, color: Colors.grey),
//         //         'Floor Lamp', 'Off'),
//         //   ],
//         // ),
//         // Row(
//         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         //   children: [
//         //     CardField(
//         //         size,
//         //         Icon(
//         //           Icons.music_note_outlined,
//         //           color: Colors.amber,
//         //         ),
//         //         'Speaker',
//         //         '50%'),
//         //     CardField(
//         //         size, Icon(Icons.radio, color: Colors.grey), 'Socket', 'Off'),
//         //     CardField(size, Icon(Icons.wifi_outlined, color: Colors.green),
//         //         'Sensor', 'Off'),
//         //   ],
//         // ),
//         CardField(
//             size,
//             Icon(
//               Icons.air,
//               color: Colors.teal,
//             ),
//             'Air Condition',
//             '50%'),
//       ],
//     );
//   }
// }
//
// CardField(
//   Size size,
//   Icon icon,
//   String title,
//   String subtitle,
// ) {
//   return Card(
//       child: SizedBox(
//           height: size.width * .23,
//           width: size.width * .26,
//           child: Center(
//             child: Column(children: [
//               ListTile(
//                 leading: icon,
//                 title: Text(
//                   subtitle,
//                   style: const TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 13),
//                 ),
//               ),
//               Text(
//                 title,
//                 style: const TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14),
//               ),
//             ]),
//           )));
// }
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Rooms extends StatelessWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> images = [
      "assets/kiara.jpg",
      "assets/eira.jpg",
      "assets/ridhi.jpg",
      "assets/akshay.jpg",
      "assets/aishu.jpg",
      "assets/snapinsta-app-450066486-17871970917127656-7544145086699940294-n-1080-15-474870-172130194930901_15_474870-172318974656225.jpg",
      "assets/onam.jpg",
      "assets/arp00582-copy.webp",
      "assets/download.jpg",
      "assets/images.jpg",
      "assets/sui.jpg",
      "assets/download2.jpg",
      "assets/images2.jpg",
      "assets/ss.png",
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(
              Icons.settings_outlined,
              color: Colors.blue,
            ),
          )
        ],
      ),
      backgroundColor: Color(0xfff5f7fa),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "Happy Clients",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.5,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => ImageDialog(images: images, index: index),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover,
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black.withOpacity(0.3),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            DevicesGridDashboard(size: size)
          ],
        ),
      ),
    );
  }
}

class ImageDialog extends StatefulWidget {
  final List<String> images;
  final int index;

  const ImageDialog({Key? key, required this.images, required this.index}) : super(key: key);

  @override
  _ImageDialogState createState() => _ImageDialogState();
}

class _ImageDialogState extends State<ImageDialog> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.index;
  }

  void _nextImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.images.length;
    });
  }

  void _previousImage() {
    setState(() {
      currentIndex = (currentIndex - 1 + widget.images.length) % widget.images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Container(
            height: 400,
            width: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.images[currentIndex]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 180,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 30),
              onPressed: _previousImage,
            ),
          ),
          Positioned(
            right: 10,
            top: 180,
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 30),
              onPressed: _nextImage,
            ),
          ),
        ],
      ),
    );
  }
}

class DevicesGridDashboard extends StatelessWidget {
  const DevicesGridDashboard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // children: [
      //   CardField(
      //       size,
      //       Icon(
      //         Icons.air,
      //         color: Colors.teal,
      //       ),
      //       'Air Condition',
      //       '50%'),
      // ],
    );
  }
}

CardField(
    Size size,
    Icon icon,
    String title,
    String subtitle,
    ) {
  return Card(
      child: SizedBox(
          height: size.width * .23,
          width: size.width * .26,
          child: Center(
            child: Column(children: [
              ListTile(
                leading: icon,
                title: Text(
                  subtitle,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ]),
          )));
}
