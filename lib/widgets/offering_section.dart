import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OfferingsSection extends StatelessWidget {
  const OfferingsSection({super.key});
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 1600;
    const SizedBox(height: 00);
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OUR OFFERINGS',
                style: GoogleFonts.ysabeau(
                    fontSize: isMobile ? 40 : 50,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                    letterSpacing: 1.6,
                    height: 5.0),
              ),
              const SizedBox(height: 10),
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _OfferingCard(
                          title: 'EXTERIOR DESIGN',
                          description:
                              'Kamalana offers exterior design services for a variety of building types—residences, offices, stores, malls, and hotels. We help you discover a unique design character that aligns with your personal or business identity.',
                          icon: FontAwesomeIcons.archway,
                        ),
                        const SizedBox(height: 10),
                        _OfferingCard(
                          title: 'INTERIOR DESIGN',
                          description:
                              'Kamalana is here to bring your interior design dreams to life—whether it’s a home, café, office, retail space, or other interior environments. We craft spaces that reflect the identity you wish to express, blending function, beauty, and soul.',
                          icon: FontAwesomeIcons.chair,
                        ),
                        const SizedBox(height: 10),
                        _OfferingCard(
                          title: 'LANDSCAPE DESIGN',
                          description:
                              'Kamalana offers landscape design solutions for all types of spaces—be it your backyard, front garden, or larger-scale areas like malls, hotels, and commercial zones. We design with a vision that blends functionality, beauty, and nature.',
                          icon: FontAwesomeIcons.seedling,
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _OfferingCard(
                            title: 'EXTERIOR DESIGN',
                            description:
                                'Kamalana offers exterior design services for a variety of building types—residences, offices, stores, malls, and hotels. We help you discover a unique design character that aligns with your personal or business identity.',
                            icon: FontAwesomeIcons.archway,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _OfferingCard(
                            title: 'INTERIOR DESIGN',
                            description:
                                'Kamalana is here to bring your interior design dreams to life—whether it’s a home, café, office, retail space, or other interior environments. We craft spaces that reflect the identity you wish to express, blending function, beauty, and soul.',
                            icon: FontAwesomeIcons.chair,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: _OfferingCard(
                            title: 'LANDSCAPE DESIGN',
                            description:
                                'Kamalana offers landscape design solutions for all types of spaces—be it your backyard, front garden, or larger-scale areas like malls, hotels, and commercial zones. We design with a vision that blends functionality, beauty, and nature.',
                            icon: FontAwesomeIcons.seedling,
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OfferingCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _OfferingCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 1600;
    const SizedBox(height: 50);
    return Card(
      child: Container(
        width: 450,
        padding: EdgeInsets.only(top: 40, bottom: 40, left: 20, right: 20),
        color: Colors.white,
        child: Column(
          children: [
            Icon(icon, color: const Color.fromARGB(255, 2, 49, 49), size: 70),
            SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.ysabeau(
                fontSize: isMobile ? 16 : 25,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 2, 49, 49),
                letterSpacing: 1.8,
              ),
            ),
            SizedBox(height: 20),
            Text(
              description,
              textAlign: TextAlign.center,
              style: GoogleFonts.ysabeau(
                fontSize: isMobile ? 13 : 18,
                fontWeight: FontWeight.w300,
                color: Color.fromARGB(255, 2, 49, 49),
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
