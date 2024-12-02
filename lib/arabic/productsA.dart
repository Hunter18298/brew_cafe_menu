import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'item_widgetA.dart';

class ProductsA extends StatefulWidget {
  const ProductsA(
      {super.key, required this.category, required this.categoryNames});
  final int category;
  final String categoryNames;

  @override
  State<ProductsA> createState() => _ProductsAState();
}

class _ProductsAState extends State<ProductsA> {
  late List data = [];

  @override
  void initState() {
    loadData();
    // TODO: implement initState
    super.initState();
  }

  Future<void> loadData() async {
    var getJson = await rootBundle.loadString("assets/Menu_Arabic.json");
    setState(() {
      data = json.decode(getJson);
      data = data
          .where((element) => element['category'] == widget.category)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    // final screenWidth = size.width;
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
        toolbarHeight: screenHeight * 0.07,
        elevation: 0,
        title: Text(
          widget.categoryNames,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          var getData = data[index];

          return MenuWidgetA(
            imageString: 'assets/cat${widget.category}/${index + 1}.png',
            menuFoodName: getData['name'],
            menuFoodPrice: getData['price'],
          );
        },
      ),
    );
  }
}
