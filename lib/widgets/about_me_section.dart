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
                Text(
                  'ME ?',
                  style: GoogleFonts.ysabeau(
                    fontSize: isMobile ? 50 : 100,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 150),
                CircleAvatar(
                  radius: imageSize / 2,
                  backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1549068106-b024baf505f0?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Modern architect photo
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(height: 10),
                Text(
                  '[Your Architect Name]',
                  style: GoogleFonts.ysabeau(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Lead Architect',
                  style: GoogleFonts.ysabeau(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100),
                Text(
                  "Kamalana is more than a name — it's the soul of every space we create. A quiet beauty, a meaningful presence, a place to simply be. Kamalana is not just about architecture. We design with soul — from the spaces you live in, to the interiors that shape your days, to the landscapes that embrace them all. Kamalana offers comprehensive architectural consulting—covering exterior, interior, and landscape design. From residential homes, cafés, offices, and retail spaces to malls and hotels, we craft spaces that reflect identity, function, and beauty. Whether it’s a façade that makes a statement, interiors that inspire comfort, or landscapes that breathe life—we’re here to shape your vision into space.",
                  style: GoogleFonts.ysabeau(
                    fontSize: isMobile ? 3 : 16,
                    height: 0.8,
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
