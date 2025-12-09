import 'package:flutter/material.dart';

class PageViewExample extends StatelessWidget {
  final PageController _pageController = PageController(viewportFraction: 0.8);

  final List<Map<String, String>> categories = [
    {"title": "Wedding", "image": "assets/wedding.jpg"},
    {"title": "Photography", "image": "assets/photography.jpg"},
    {"title": "Catering", "image": "assets/catering.jpg"},
    {"title": "Decorations", "image": "assets/decorations.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text("PageView Example")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "SERVICES",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.25, // Set a height for PageView
            child: PageView.builder(
              controller: _pageController,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return buildPageItem(size, categories[index]["title"]!, categories[index]["image"]!);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPageItem(Size size, String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.4),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
