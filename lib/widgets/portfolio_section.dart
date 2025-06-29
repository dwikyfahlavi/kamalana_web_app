import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  final List<Map<String, String>> projects = const [
    {
      'title': 'Harmony manis',
      'image':
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description':
          'A minimalist residence designed for tranquility and modern living, featuring sustainable materials.'
    },
    {
      'title': 'Eco ghdfghj',
      'image':
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description':
          'Revitalizing a city block with mixed-use development, fostering community and commerce.'
    },
    {
      'title': 'Zen Garden House',
      'image':
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description':
          'A serene home designed around a central Japanese Zen garden, promoting peace and reflection.'
    },
    {
      'title': 'Industrial Chic Loft',
      'image':
          'https://images.unsplash.com/photo-1512917774080-9991f1c4c750?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'description':
          'Conversion of an old factory into a modern, stylish living and workspace.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    final double padding = isMobile ? 20 : 60;
    final double cardWidth = isMobile ? screenWidth * 0.8 : 380;

    return Container(
      padding: EdgeInsets.all(padding),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Portfolio',
            style: GoogleFonts.montserrat(
              fontSize: isMobile ? 28 : 38,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            height: isMobile ? 340 : 800,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              separatorBuilder: (_, __) => SizedBox(width: isMobile ? 16 : 32),
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
      duration: const Duration(milliseconds: 180),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.04).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(_) => _controller.forward();
  void _onTapUp(_) => _controller.reverse();

  @override
  Widget build(BuildContext context) {
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
            elevation: 14,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22),
            ),
            clipBehavior: Clip.antiAlias,
            color: theme.brightness == Brightness.dark
                ? Colors.grey[900]
                : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with overlay and rounded corners (portrait aspect ratio)
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 3 / 4, // Portrait aspect ratio
                      child: Image.network(
                        widget.project['image']!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, progress) =>
                            progress == null
                                ? child
                                : Container(
                                    color: Colors.grey[200],
                                    child: const Center(
                                        child: CircularProgressIndicator()),
                                  ),
                      ),
                    ),
                    Positioned(
                      right: 16,
                      top: 16,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.visibility,
                            color: Colors.white, size: 20),
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
                        style: GoogleFonts.montserrat(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: theme.primaryColorDark,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.project['description']!,
                        style: GoogleFonts.openSans(
                          fontSize: 15,
                          color: theme.brightness == Brightness.dark
                              ? Colors.grey[300]
                              : Colors.grey[700],
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
                              textStyle: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            onPressed: () {
                              showDialogProjectDetails(context);
                            },
                            icon:
                                const Icon(Icons.open_in_new_rounded, size: 18),
                            label: const Text('View Project'),
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
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  widget.project['image']!,
                  fit: BoxFit.cover,
                  // height: 700,
                  // width: 900,
                  loadingBuilder: (context, child, progress) => progress == null
                      ? child
                      : Container(
                          color: Colors.grey[200],
                          // height: 700,
                          // width: 900,
                          child:
                              const Center(child: CircularProgressIndicator()),
                        ),
                ),
              ),
              // Description overlay
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  // width: 900,
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(18),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project['title']!,
                        style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.project['description']!,
                        style: GoogleFonts.openSans(
                          color: Colors.white70,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Close button
              Positioned(
                top: 16,
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, size: 28),
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
