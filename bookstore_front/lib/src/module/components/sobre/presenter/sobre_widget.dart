import 'package:bookstore_front/src/utils/img_utils.dart';
import 'package:bookstore_front/src/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SobreWidget extends StatelessWidget {
  const SobreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xffC2C8CF),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                "QUEM\nSOMOS",
                style: TextStyle(
                  color: Color(0xff34495E),
                  fontWeight: FontWeight.w600,
                  fontSize: 23,
                ),
              ),
            ),
            Row(
              children: [
                Image.asset(ImageUtils.SOBRE_BOOKSTORE, fit: BoxFit.cover),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75.0),
                    child: Text(
                      TextUtils.SOBRE_TEXT,
                      style: GoogleFonts.playfair(
                        color: const Color(0xff2C3E50),
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Text(
                  TextUtils.SOBRE_TEXT_END,
                  style: GoogleFonts.playfair(
                    color: const Color(0xff2C3E50),
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
