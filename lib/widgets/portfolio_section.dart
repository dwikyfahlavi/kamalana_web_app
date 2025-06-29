import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'Harmony House',
      'image':
          'https://images.unsplash.com/photo-1600585154340-dacd98e265c8?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description':
          'A minimalist residence designed for tranquility and modern living, featuring sustainable materials.'
    },
    {
      'title': 'Eco Tower',
      'image':
          'https://images.unsplash.com/photo-1497215729119-ed229e3a7587?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description':
          'An innovative commercial complex integrating green spaces and energy-efficient systems.'
    },
    {
      'title': 'Riverside Retreat',
      'image':
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description':
          'A luxurious vacation home blending seamlessly with its natural riverside environment.'
    },
    {
      'title': 'Urban Core',
      'image':
          'https://images.unsplash.com/photo-1516246417765-5b4d457636e0?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description':
          'Revitalizing a city block with mixed-use development, fostering community and commerce.'
    },
    {
      'title': 'Zen Garden House',
      'image':
          'https://images.unsplash.com/photo-1506126613408-eca69fe87852?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description':
          'A serene home designed around a central Japanese Zen garden, promoting peace and reflection.'
    },
    {
      'title': 'Industrial Chic Loft',
      'image':
          'https://images.unsplash.com/photo-1541571216-3e4b78631100?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description':
          'Conversion of an old factory into a modern, stylish living and workspace.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    final double padding = isMobile ? 20 : 60;
    final int crossAxisCount = isMobile ? 1 : (screenWidth < 1024 ? 2 : 3);

    return Container(
      padding: EdgeInsets.all(padding),
      color: Theme.of(context).scaffoldBackgroundColor, // Light grey
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Portfolio',
            style: GoogleFonts.montserrat(
              fontSize: isMobile ? 28 : 38,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 40),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: isMobile
                  ? (3 / 2.5)
                  : (3 / 2), // Adjust aspect ratio for mobile
              crossAxisSpacing: isMobile ? 15 : 30,
              mainAxisSpacing: isMobile ? 15 : 30,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return PortfolioCard(project: projects[index]);
            },
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
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // For hover effect on web
      onEnter: (_) => _controller.forward(),
      onExit: (_) => _controller.reverse(),
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Card(
          elevation: 8,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAlias, // Ensures image respects border radius
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Image.network(
                  widget.project['image']!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project['title']!,
                        style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey[800],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.project['description']!,
                        style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
