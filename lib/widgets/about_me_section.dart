import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 1500;
    final double padding = isMobile ? 20 : 100;
    final double imageSize = isMobile ? 120 : 500;

    return Container(
      padding: EdgeInsets.all(padding),
      color: Colors.white,
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Text(
                  'ABOUT US',
                  style: GoogleFonts.ysabeau(
                    fontSize: isMobile ? 30 : 100,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                CircleAvatar(
                  radius: imageSize / 2,
                  backgroundImage: const NetworkImage(
                      'assets/images/KAMALANA ATELIER LOGO (2).png'),
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(height: 10),
                Text(
                  'Kamalana Atelier',
                  style: GoogleFonts.ysabeau(
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Elegance Concealed in Every Contour',
                  style: GoogleFonts.ysabeau(
                    fontSize: 10,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                Text(
                  "Kamalana is more than a name — it's the soul of every space we create. A quiet beauty, a meaningful presence, a place to simply be. Kamalana is not just about architecture. We design with soul — from the spaces you live in, to the interiors that shape your days, to the landscapes that embrace them all. Kamalana offers comprehensive architectural consulting—covering exterior, interior, and landscape design. From residential homes, cafés, offices, and retail spaces to malls and hotels, we craft spaces that reflect identity, function, and beauty. Whether it’s a façade that makes a statement, interiors that inspire comfort, or landscapes that breathe life—we’re here to shape your vision into space.",
                  style: GoogleFonts.ysabeau(
                    fontSize: isMobile ? 12 : 16,
                    height: isMobile ? 1.6 : 1.2,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ABOUT US',
                      style: GoogleFonts.ysabeauInfant(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                          letterSpacing: 3.0),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "           Kamalana is more than a name — it's the soul of every space we create. A quiet beauty, a meaningful presence, a place to simply be. Kamalana is not just about architecture. We design with soul — from the spaces you live in, to the interiors that shape your days, to the landscapes that embrace them all. Kamalana offers comprehensive architectural consulting—covering exterior, interior, and landscape design. From residential homes, cafés, offices, and retail spaces to malls and hotels, we craft spaces that reflect identity, function, and beauty. Whether it’s a façade that makes a statement, interiors that inspire comfort, or landscapes that breathe life—we’re here to shape your vision into space.",
                      style: GoogleFonts.ysabeauInfant(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        height: 1.4,
                        color: const Color.fromARGB(255, 48, 48, 48),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
    );
  }
}
