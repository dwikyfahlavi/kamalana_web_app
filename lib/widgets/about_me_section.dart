import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    final double padding = isMobile ? 20 : 60;
    final double imageSize = isMobile ? 120 : 200;

    return Container(
      padding: EdgeInsets.all(padding),
      color: Colors.white,
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'About Me',
                  style: GoogleFonts.montserrat(
                    fontSize: isMobile ? 28 : 38,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                CircleAvatar(
                  radius: imageSize / 2,
                  backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1549068106-b024baf505f0?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Modern architect photo
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(height: 20),
                Text(
                  '[Your Architect Name]',
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[900],
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Lead Architect',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Text(
                  "Kamalana is more than a name — it's the soul of every space we create. A quiet beauty, a meaningful presence, a place to simply be. Kamalana is not just about architecture. We design with soul — from the spaces you live in, to the interiors that shape your days, to the landscapes that embrace them all.",
                  style: GoogleFonts.openSans(
                    fontSize: isMobile ? 16 : 18,
                    height: 1.6,
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
                      'About Me',
                      style: GoogleFonts.montserrat(
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Kamalana is more than a name — it's the soul of every space we create. A quiet beauty, a meaningful presence, a place to simply be. Kamalana is not just about architecture. We design with soul — from the spaces you live in, to the interiors that shape your days, to the landscapes that embrace them all.",
                      style: GoogleFonts.openSans(
                        fontSize: 18,
                        height: 1.6,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
    );
  }
}
