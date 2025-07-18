import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': "L'Orangerie ",
      'image': 'assets/images/cafe.png',
      'description':
          'With few walls and abundant light, this café-restaurant offers a sense of openness—like a garden without fences, where conversations and flavors grow without boundaries.'
    },
    {
      'title': 'AwVilla',
      'image': 'assets/images/awvilla.png',
      'description':
          'Bathed in white serenity, this villa stands as a quiet poem of elegance. Inspired by classical American architecture, its graceful entrance and soft grandeur speak not in volume, but in presence. A garden blooms gently at its heart and whispers around its edges—inviting nature to dance with luxury, in stillness and in light.'
    },
    {
      'title': 'Panogi Cafe',
      'image': 'assets/images/panogicafe.png',
      'description':
          'Panogi is more than a building — it is a contemporary social node that reflects the evolving dynamics of urban living in Medan'
    },
    {
      'title': 'Makeupuccino Bengawan',
      'image': 'assets/images/makeupuccinobengawan.png',
      'description':
          'Makeupuccino is a well-known beauty store among women in Bandung & Bogor, offering a wide range of makeup products, skincare essentials, and beauty accessories.'
    },
    {
      'title': 'Makeupuccino Bogor',
      'image': 'assets/images/makeupuccinobogor.png',
      'description':
          'Makeupuccino was born and blossomed. Now, it nurtures a new space in the city of rain—a special place for the women of Bogor to celebrate their beauty, in softness and in meaning.'
    },
    {
      'title': 'Lansdcape Kilang Pertamina',
      'image': 'assets/images/LANDSCAPE PERTAMINA.png',
      'description':
          ' Following a consultation session with the client, the team proceeded with a preliminary design process—from concept development to layout planning. Inspired by the unique identity of Balikpapan—including its native fauna, cultural objects, and traditional patterns—the design aims to root the entire site in local character and contex'
    },
    {
      'title': 'Merakee Florist',
      'image': 'assets/images/merakee.png',
      'description':
          "Merakee Florist isn`t just a flower shop—it`s a space where love, joy, and milestones are celebrated. Now with a fresh new look, designed by Kamalana"
    },
    {
      'title': 'Standard Room Hotel Garut',
      'image': 'assets/images/INTERIOR S-TYPE HOTEL GARUT (3).png',
      'description':
          'Soft pastel hues fill the room with light and warmth. Designed by Kamalana, this standard hotel room in Garut invites calmness and joy—elevated by subtle lighting on the ceiling and a refined backdrop, just as envisioned by the owner.'
    },
    {
      'title': 'Executive Room Hotel Garut',
      'image': 'assets/images/INTERIOR E-TYPE HOTEL GARUT (1).png',
      'description':
          'Kamalana brings the executive room to life with a vibrant tropical spirit, a touch of luxury, and understated elegance. Building on the character of the standard room, rich emerald accents now take the spotlight—infusing the space with tranquility, depth, and timeless sophistication.'
    },
    {
      'title': 'Residences at Cihanjuang',
      'image': 'assets/images/RESIDENCES AT CIHANJUANG.png',
      'description':
          'Kamalana was entrusted with the 3D Visualization Render project for a residential area in Cihanjuang. The scene is crafted to evoke warmth, comfort, and luxury—set in a serene morning atmosphere with soft dew and the vibrant bustle of residents starting their day.'
    },
    {
      'title': 'Residences at Arcamanik',
      'image': 'assets/images/RESIDENCES AT ARCAMANIK.png',
      'description':
          'Kamalana was given the opportunity to design a residential cluster in Arcamanik, Bandung—starting from master layout planning, façade design, material & color selection, to 3D visualization. With the owners brief for a Scandinavian concept, the homes were envisioned to reflect clean lines, natural warmth, and a quiet sense of elegance.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;
    final double padding = isMobile ? 35 : 70;
    final double cardWidth = isMobile ? screenWidth * 0.7 : 380;
    const SizedBox(height: 50);
    return Container(
      padding: EdgeInsets.all(padding),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '     HIGHLIGHTS PROJECTS    ',
            style: GoogleFonts.ysabeauInfant(
              fontSize: isMobile ? 28 : 50,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).primaryColor,
              letterSpacing: 3.0,
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: isMobile ? 650 : 800,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              separatorBuilder: (_, __) => SizedBox(width: isMobile ? 10 : 20),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: cardWidth,
                  child: PortfolioCard(project: projects[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PortfolioCard extends StatefulWidget {
  final Map<String, String> project;
  const PortfolioCard({super.key, required this.project});

  @override
  State<PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<PortfolioCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scaleAnimation = Tween<double>(begin: 0.98, end: 1.02).animate(
      CurvedAnimation(
          parent: _controller, curve: Curves.fastEaseInToSlowEaseOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 1600;
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: GestureDetector(
        onTap: () {
          showDialogProjectDetails(context);
        },
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Card(
            elevation: 1000,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            clipBehavior: Clip.antiAlias,
            color: theme.brightness == Brightness.dark
                ? const Color.fromARGB(255, 255, 255, 255)
                : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with overlay and rounded corners (portrait aspect ratio)
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 4, // Portrait aspect ratio
                      child: Image.asset(
                        widget.project['image']!,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 250,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255)
                              .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.white, size: 15),
                      ),
                    ),
                  ],
                ),
                // Card content
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project['title']!,
                        style: GoogleFonts.ysabeau(
                          fontSize: isMobile ? 15 : 30,
                          fontWeight: FontWeight.w700,
                          color: theme.primaryColorDark,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.project['description']!,
                        style: GoogleFonts.ysabeau(
                          fontSize: isMobile ? 10 : 15,
                          color: theme.brightness == Brightness.dark
                              ? Colors.grey[300]
                              : const Color.fromARGB(255, 0, 0, 0),
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          TextButton.icon(
                            style: TextButton.styleFrom(
                              foregroundColor: theme.primaryColor,
                              textStyle: GoogleFonts.ysabeau(
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                            onPressed: () {
                              showDialogProjectDetails(context);
                            },
                            icon: const Icon(Icons.open_in_full_rounded,
                                size: 20),
                            label: const Text('See Project'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDialogProjectDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(32),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Image
              ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: Image.network(
                  widget.project['image']!,
                  fit: BoxFit.cover,
                  // height: 700,
                  // width: 900,
                  loadingBuilder: (context, child, progress) => progress == null
                      ? child
                      : Container(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          // height: 700,
                          // width: 900,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        ),
                ),
              ),
              // Description overlay

              // Close button
              Positioned(
                top: 16,
                right: 20,
                child: IconButton(
                  icon: const Icon(Icons.close,
                      color: Color.fromARGB(255, 160, 160, 160), size: 15),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
