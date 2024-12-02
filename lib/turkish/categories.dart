import 'dart:typed_data';
import 'package:carousel_slider/carousel_controller.dart' as carousel_slider;
import 'package:flutter/src/material/carousel.dart' as material_carousel;
import 'package:brew_restaurant_menu/english/products.dart';
import 'package:carousel_slider/carousel_slider.dart' as slider;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCategoryT extends StatefulWidget {
  final offerList = [
    "assets/assets/offers/1.png",
    "assets/assets/offers/2.png",
    "assets/assets/offers/3.png",
  ];

  final List images = [
    "assets/assets/categories/1.png",
    "assets/assets/categories/2.png",
    "assets/assets/categories/3.png",
    "assets/assets/categories/4.png",
    "assets/assets/categories/5.png",
    "assets/assets/categories/6.png",
    "assets/assets/categories/7.png",
    "assets/assets/categories/8.png",
    "assets/assets/categories/9.png",
    "assets/assets/categories/10.png",
    "assets/assets/categories/11.png",
    "assets/assets/categories/12.png",
    "assets/assets/categories/13.png",
  ];

  final List name = [
    "Sıcak içecekler",
    "Soğuk içecekler",
    "Nargile",
    "Pizza",
    "Burger",
    "Sandviç",
    "Yemekler",
    "Pasta",
    "Salata",
    "Tatlı",
    "Meyve suyu",
    "Kokteyl",
    "Milkshake"
  ];
  HomeCategoryT({super.key});

  @override
  State<HomeCategoryT> createState() => _HomeCategoryTState();
}

class _HomeCategoryTState extends State<HomeCategoryT> {
  // Let's use a list to store the compressed images
  List<Uint8List?> compressedImages = [];
  @override
  void initState() {
    super.initState();
    _compressImages();
  }

  _compressImages() async {
    for (var img in widget.images) {
      // Load image as bytes
      final bytes = await rootBundle.load(img)
        ..buffer.asUint8List();
      Uint8List uint8List = bytes.buffer.asUint8List();
      // Compress the image
      final result = await FlutterImageCompress.compressWithList(
        uint8List,
        minHeight: 512, // define the minHeight you want
        minWidth: 512, // define the minWidth you want
        quality: 60, // Define the quality, between 0 and 100
      );
      compressedImages.add(result);
    }
    setState(() {}); // This is to refresh the widget once images are compressed
  }

  @override
  Widget build(BuildContext context) {
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
          "Restaurant",
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
          slider.CarouselSlider(
            options: slider.CarouselOptions(
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
                          backgroundImage: AssetImage(widget.images[index]!),
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
