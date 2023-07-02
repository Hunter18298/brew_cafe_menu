import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuWidgetK extends StatelessWidget {
  final String? imageString;
  final String menuFoodName;
  final String menuFoodPrice;

  const MenuWidgetK(
      {super.key,
      this.imageString,
      required this.menuFoodName,
      required this.menuFoodPrice});

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
            image: NetworkImage(
              imageString ??
                  "https://img.freepik.com/free-photo/top-view-table-full-delicious-food-composition_23-2149141352.jpg?w=740&t=st=1667390038~exp=1667390638~hmac=582fd2a88f8daa1df8b87f6de03d3feab00b475f91dc1fb89d3824ac3da63d06",
            ),
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
                          menuFoodPrice,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          menuFoodName,
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
