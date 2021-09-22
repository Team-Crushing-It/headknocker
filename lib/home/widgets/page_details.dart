import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageDetails extends StatelessWidget {
  PageDetails({
    required this.decribing_text,
    this.images,
    this.images_bottom_text,
    Key? key,
  }) : super(key: key);

  List<Text> decribing_text;
  List<String>? images;
  List<String>? images_bottom_text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: 450,
            child: Column(
              children: decribing_text,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      child: Image.asset(images![0]),
                    ),
                    Text(
                      images_bottom_text![0],
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: 150,
                      height: 100,
                      child: Image.asset(images![1]),
                    ),
                    Text(
                      images_bottom_text![1],
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      child: Image.asset(images![2]),
                    ),
                    Text(
                      images_bottom_text![2],
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
