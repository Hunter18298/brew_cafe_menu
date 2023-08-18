import 'package:brew_restaurant_menu/english/products.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeCategoryT extends StatelessWidget {
  HomeCategoryT({super.key});
  final offerList = [
    "https://i.imgur.com/EiPiQER.jpeg",
    "https://i.imgur.com/oPIpit4.jpeg",
    "https://i.imgur.com/niIwvii.jpeg"
  ];
  final List images = [
    "https://i.imgur.com/3UgujKn.jpeg",
    "https://i.imgur.com/RBWm1E0.jpeg",
    "https://i.imgur.com/s99IKRC.jpeg",
    "https://i.imgur.com/dTEQmiY.jpeg",
    "https://i.imgur.com/zbgGxSn.jpeg",
    "https://i.imgur.com/8GCiO4z.jpeg",
    "https://i.imgur.com/nVlTF5Q.jpeg",
    "https://i.imgur.com/6szJPbV.jpeg",
    "https://i.imgur.com/7jqn9QK.jpeg",
    "https://i.imgur.com/3jCCy7G.jpeg",
    "https://i.imgur.com/4CGbWj7.jpeg",
    "https://i.imgur.com/aQgr3jC.jpeg",
    "https://i.imgur.com/vnTmNpI.jpeg"
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
            items: offerList.map((i) {
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
              itemCount: name.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                String getNames = name[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Products(
                          category: index,
                          categoryNames: name[index],
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
                          backgroundImage: NetworkImage(images[index]),
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
