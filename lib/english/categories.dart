import 'dart:typed_data';

import 'package:brew_restaurant_menu/english/products.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCategory extends StatefulWidget {
  final offerList = [
    "assets/offers/1.png",
    "assets/offers/2.png",
    "assets/offers/3.png",
  ];

  final List images = [
    "assets/Categories/1.png",
    "assets/Categories/2.png",
    "assets/Categories/3.png",
    "assets/Categories/4.png",
    "assets/Categories/5.png",
    "assets/Categories/6.png",
    "assets/Categories/7.png",
    "assets/Categories/8.png",
    "assets/Categories/9.png",
    "assets/Categories/10.png",
    "assets/Categories/11.png",
    "assets/Categories/12.png",
    "assets/Categories/13.png",
  ];

  final List name = [
    "Hot drinks",
    "Soft drinks",
    "Shisha",
    "Pizza",
    "Burger",
    "Sandwich",
    "Meals",
    "Pasta",
    "Salad",
    "Dessert",
    "Juice",
    "Cocktail",
    "Milkshake"
  ];

  HomeCategory({super.key});

  @override
  State<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  // Let's use a list to store the compressed images
  List<Uint8List?> compressedImages = [];
  @override
  void initState() {
    super.initState();
    _compressImages();
  }

  _compressImages() async {
    try {
      for (var img in widget.images) {
        final bytes = await rootBundle.load(img);
        Uint8List uint8List = bytes.buffer.asUint8List();

        final result = await FlutterImageCompress.compressWithList(
          uint8List,
          minHeight: 512,
          minWidth: 512,
          quality: 60,
        );

        compressedImages.add(result);
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error compressing image: $e");
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(
          "$compressedImages  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    }
    Size size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF37DCF3),
                Color(0xFF4FACC5),
                Color(0xFF2C9EAE),
              ]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45),
              )),
        ),
        toolbarHeight: size.height * 0.07,
        elevation: 0,
        title: Text(
          "Brew Cafe",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 300.0,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(
                milliseconds: 800,
              ),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: widget.offerList.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    height: screenHeight * 0.3,
                    margin: EdgeInsets.symmetric(
                        vertical: 20, horizontal: screenWidth * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(i),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const Divider(),
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              itemCount: widget.name.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                String getNames = widget.name[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Products(
                          category: index,
                          categoryNames: widget.name[index],
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: screenHeight * 0.3,
                    width: screenWidth * 0.2,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              MemoryImage(compressedImages[index]!),
                          radius: 45,
                        ),
                        SizedBox(
                          height: screenHeight * 0.0056,
                        ),
                        Text(
                          getNames,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
