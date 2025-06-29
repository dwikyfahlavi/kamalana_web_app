import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kamalana_web_app/widgets/about_me_section.dart';
import 'package:kamalana_web_app/widgets/contact_section.dart';
import 'package:kamalana_web_app/widgets/portfolio_section.dart'; // If using Google Fonts
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  late AnimationController _heroAnimationController;
  late Animation<double> _heroTextOpacity;
  late Animation<Offset> _heroTextSlide;

  @override
  void initState() {
    super.initState();
    _heroAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _heroTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _heroAnimationController,
        curve: const Interval(0.5, 1.0,
            curve: Curves.easeIn), // Starts halfway through
      ),
    );
    _heroTextSlide =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _heroAnimationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    _heroAnimationController.forward();
  }

  @override
  void dispose() {
    _heroAnimationController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 700), // Smoother scroll
      curve: Curves.easeInOutQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF25D366),
        onPressed: () {
          final Uri whatsappUrl = Uri.parse(
              'https://wa.me/6285155325399'); // 62 is Indonesia country code
          // ignore: deprecated_member_use
          launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
        },
        child: Icon(Icons.chat, color: Colors.white, size: 32),
      ),
      endDrawer: isMobile ? _buildDrawer(context) : null, // Drawer for mobile
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: ClipRRect(
          // For rounded corners if needed
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
            child: AppBar(
              toolbarHeight: isMobile ? 80 : 120, // Responsive height
              backgroundColor: Colors.black.withOpacity(0.25),
              elevation: 0,
              titleSpacing: 24,
              title: Container(
                margin: EdgeInsets.only(top: isMobile ? 8 : 16),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: isMobile ? 80 : 100, // Responsive logo size
                ),
              ),
              actions: isMobile
                  ? null
                  : [
                      _buildAppBarButton(
                          'About Me', () => _scrollToSection(_aboutMeKey)),
                      _buildAppBarButton(
                          'Portfolio', () => _scrollToSection(_portfolioKey)),
                      _buildAppBarButton(
                          'Contact', () => _scrollToSection(_contactKey)),
                      const SizedBox(width: 24),
                    ],
              iconTheme: const IconThemeData(color: Colors.white),
              automaticallyImplyLeading: isMobile,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              height: isMobile ? 300 : 500, // Responsive height
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/tower.jpg'), // Use local asset image
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black54,
                    BlendMode.darken,
                  ), // Darken for text readability
                ),
              ),
              child: Center(
                child: SlideTransition(
                  position: _heroTextSlide,
                  child: FadeTransition(
                    opacity: _heroTextOpacity,
                    child: Text(
                      'Crafting Visions into Reality',
                      style: GoogleFonts.montserrat(
                        fontSize: isMobile ? 32 : 64,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: isMobile ? 1 : 2,
                        shadows: [
                          Shadow(
                            blurRadius: 15.0,
                            color: Colors.black.withOpacity(0.6),
                            offset: const Offset(5.0, 5.0),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            AboutMeSection(key: _aboutMeKey),
            PortfolioSection(key: _portfolioKey),
            ContactSection(key: _contactKey),
            // Footer
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 20 : 30, horizontal: 20),
              color: const Color(0xFF263238), // Dark Blue Grey
              child: Center(
                child: Text(
                  '© ${DateTime.now().year} Architect Studio. All rights reserved.',
                  style: GoogleFonts.montserrat(
                      color: Colors.white70, fontSize: isMobile ? 12 : 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBarButton(String text, VoidCallback onPressed) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.montserrat(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              'Navigation',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            title:
                Text('About Me', style: GoogleFonts.montserrat(fontSize: 18)),
            onTap: () {
              _scrollToSection(_aboutMeKey);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title:
                Text('Portfolio', style: GoogleFonts.montserrat(fontSize: 18)),
            onTap: () {
              _scrollToSection(_portfolioKey);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Contact', style: GoogleFonts.montserrat(fontSize: 18)),
            onTap: () {
              _scrollToSection(_contactKey);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
