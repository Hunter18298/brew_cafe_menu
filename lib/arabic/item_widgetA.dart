import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class MenuWidgetA extends StatefulWidget {
  final String? imageString;
  final String menuFoodName;
  final String menuFoodPrice;

  const MenuWidgetA(
      {super.key,
      this.imageString,
      required this.menuFoodName,
      required this.menuFoodPrice});

  @override
  _MenuWidgetAState createState() => _MenuWidgetAState();
}

class _MenuWidgetAState extends State<MenuWidgetA> {
  Uint8List? compressedImage;

  @override
  void initState() {
    super.initState();
    _compressImage();
  }

  Future<void> _compressImage() async {
    final Uint8List imageBytes = await File(widget.imageString!).readAsBytes();
    final result = await FlutterImageCompress.compressWithList(
      imageBytes,
      minWidth: 500,
      minHeight: 500,
      quality: 60,
    );
    setState(() {
      compressedImage = result;
    });
  }

  ImageProvider<Object> _getImage() {
    if (compressedImage == null) {
      return AssetImage(widget.imageString!);
    }
    return MemoryImage(compressedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;

    return SizedBox(
      height: screenHeight * 0.3,
      child: Container(
        margin:
            EdgeInsets.symmetric(vertical: 20, horizontal: screenWidth * 0.1),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: _getImage(),
          ),
        ),
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: Stack(children: [
            // Positioned(
            //   right: 10,
            //   top: 20,
            //   child: Container(
            //     width: 50,
            //     height: 50,
            //     decoration: const BoxDecoration(
            //       color: Color(0xFFFF6850),
            //       borderRadius: BorderRadius.only(
            //           bottomLeft: Radius.circular(5),
            //           bottomRight: Radius.circular(35),
            //           topLeft: Radius.circular(35)),
            //     ),
            //     child: const Icon(
            //       Icons.food_bank,
            //       size: 30,
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 0,
              child: Container(
                  width: screenWidth * 0.81,
                  height: screenHeight * 0.055,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(0.5),
                      const Color(0xFF37DCF3).withOpacity(0.7),
                      const Color(0xFF37DCF3),
                    ]),
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(35)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.menuFoodPrice,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.menuFoodName,
                          style: GoogleFonts.notoSansArabic(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                          textDirection: TextDirection.rtl,
                        ),
                      ],
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
