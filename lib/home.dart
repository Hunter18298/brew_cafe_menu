import 'package:brew_restaurant_menu/arabic/categoriesA.dart';
import 'package:brew_restaurant_menu/english/categories.dart';
import 'package:brew_restaurant_menu/kurdish/categoriesk.dart';
import 'package:brew_restaurant_menu/turkish/categories.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final Uri location = Uri.parse("https://maps.app.goo.gl/gmhhpZCBDVmfJiYi8");
  final Uri facebookUrl = Uri.parse("https://www.facebook.com/");
  final Uri instagramUrl = Uri.parse("https://www.instagram.com/");
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF48788C),
              Color(0xFF87DEEA),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/b.png"),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.1,
                bottom: screenHeight * 0.02,
              ),
              child: Center(
                child: SizedBox(
                  height: screenHeight * 0.2,
                  child: Text(
                    "Restaurant",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.15,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeCategory()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.025,
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "English",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.15,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeCategoryK()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.025,
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "کوردی",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.15,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeCategoryA(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.025,
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "عربي",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.15,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeCategoryT()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: screenHeight * 0.025,
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Türkçe",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.2,
            ),
            Container(
              height: screenHeight * 0.2,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: screenHeight * 0.02,
                    left: screenWidth * 0.05,
                    child: GestureDetector(
                      onTap: () {
                        _makePhoneCall("+964 770 0000000");
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          Text(
                            "+964 770 00000000",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.02,
                    right: screenWidth * 0.1,
                    child: GestureDetector(
                      onTap: () {
                        _makePhoneCall("+964 750 000000");
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          Text(
                            "+964 750 0000000",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.08,
                    left: screenWidth * 0.05,
                    child: GestureDetector(
                      onTap: () {
                        _launchInBrowser(location);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.pin_drop,
                            color: Colors.white,
                          ),
                          Text(
                            "Shaqlawa Restaurant",
                            style: GoogleFonts.montserrat(
                                fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.07,
                    right: screenWidth * 0.2,
                    child: GestureDetector(
                      onTap: () {
                        _launchInBrowser(facebookUrl);
                      },
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.068,
                    right: screenWidth * 0.1,
                    child: GestureDetector(
                      onTap: () {
                        _launchInBrowser(instagramUrl);
                      },
                      child: const FaIcon(
                        FontAwesomeIcons.instagram,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: screenHeight * 0.02,
                    right: screenWidth * 0.3,
                    child: Text(
                      "Shaqlawa",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _PrecacheImageWrapper extends StatefulWidget {
  final Widget child;

  _PrecacheImageWrapper({required this.child});

  @override
  __PrecacheImageWrapperState createState() => __PrecacheImageWrapperState();
}

class __PrecacheImageWrapperState extends State<_PrecacheImageWrapper> {
  late Future<void> _loadingImages;

  @override
  void initState() {
    super.initState();
    _loadingImages = _loadImages(context);
  }

  Future<void> _loadImages(BuildContext context) async {
    for (var asset in [
      ...HomeCategoryA().offerList,
      ...HomeCategoryA().images,
    ]) {
      await precacheImage(AssetImage(asset), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadingImages,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.child;
        }
        return const Center(
            child:
                CircularProgressIndicator()); // loading indicator while images are being precached
      },
    );
  }
}
