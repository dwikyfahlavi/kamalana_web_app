import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kamalana_web_app/widgets/about_me_section.dart';
import 'package:kamalana_web_app/widgets/contact_section.dart';
import 'package:kamalana_web_app/widgets/offering_section.dart';
import 'package:kamalana_web_app/widgets/portfolio_section.dart'; // If using Google Fonts
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return IconButton(
        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
        icon: FaIcon(FontAwesomeIcons.gamepad),
        onPressed: () {
          print("Pressed");
        });
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey _aboutMeKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _offeringKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  late AnimationController _heroAnimationController;
  late Animation<double> _heroTextOpacity;
  late Animation<Offset> _heroTextSlide;
  late ScrollController _scrollController;
  bool _scrolledPastAboutSection = false;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController()..addListener(_onScroll);

    _heroAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _heroTextOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _heroAnimationController,
        curve: const Interval(0.5, 1.0, curve: Curves.easeInCubic),
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

  void _onScroll() {
    if (_aboutMeKey.currentContext != null) {
      final RenderBox box =
          _aboutMeKey.currentContext!.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero).dy;

      if (position < 0 && !_scrolledPastAboutSection) {
        setState(() {
          _scrolledPastAboutSection = true;
        });
      } else if (position >= 0 && _scrolledPastAboutSection) {
        setState(() {
          _scrolledPastAboutSection = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _heroAnimationController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600), // Smoother scroll
      curve: Curves.easeInOutQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile =
        screenWidth < 500; // <600 cocok untuk iPhone & Android

    ;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 51, 105, 70),
        onPressed: () {
          final Uri whatsappUrl = Uri.parse(
              'https://wa.me/+6281912308055'); // 62 is Indonesia country code
          // ignore: deprecated_member_use
          launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
        },
        child: Icon(Icons.phone, color: Colors.white, size: 22),
      ),
      endDrawer: isMobile ? _buildDrawer(context) : null, // Drawer for mobile
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize:
            isMobile ? const Size.fromHeight(40) : const Size.fromHeight(90),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              color: isMobile
                  ? const Color.fromARGB(48, 2, 49, 49)
                  : (_scrolledPastAboutSection
                      ? const Color(0xFF023131)
                      : Colors.transparent),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                toolbarHeight: isMobile ? 45 : 90,
                titleSpacing: 250,
                title: Container(
                  margin: EdgeInsets.only(top: isMobile ? 5 : 10),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: isMobile ? 28 : 110,
                  ),
                ),
                actions: isMobile
                    ? null
                    : [
                        _buildAppBarButton(
                            'ABOUT', () => _scrollToSection(_aboutMeKey)),
                        _buildAppBarButton(
                            'PORTFOLIO', () => _scrollToSection(_portfolioKey)),
                        _buildAppBarButton(
                            'OFFERING', () => _scrollToSection(_offeringKey)),
                        _buildAppBarButton(
                            'CONTACT', () => _scrollToSection(_contactKey)),
                        const SizedBox(width: 300),
                      ],
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // Hero tetap di atas
            Container(
              height: isMobile ? MediaQuery.of(context).size.height * 1 : 1000,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: const AssetImage('assets/images/L.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                  colorFilter: ColorFilter.mode(
                    const Color.fromARGB(133, 0, 0, 0),
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Center(
                child: SlideTransition(
                  position: _heroTextSlide,
                  child: FadeTransition(
                    opacity: _heroTextOpacity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Elegance Concealed in Every Contour',
                          style: GoogleFonts.ysabeauInfant(
                            fontSize: isMobile ? 28 : 75, // ubah dari 30 ke 28
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          '• Kamalana Atelier •',
                          style: GoogleFonts.ysabeauInfant(
                            fontSize: isMobile
                                ? 14
                                : 20, // ubah agar pas di layar mobile
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            AboutMeSection(key: _aboutMeKey),
            PortfolioSection(key: _portfolioKey),
            OfferingsSection(key: _offeringKey),
            ContactSection(key: _contactKey),

            // Footer
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: isMobile ? 10 : 30, horizontal: 40),
              color: const Color(0xFF023131),
              // Dark Blue Grey
              child: Center(
                child: Text(
                  '© ${DateTime.now().year} Kamalana Atelier . All rights reserved.',
                  style: GoogleFonts.ysabeau(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w200,
                      fontSize: isMobile ? 12 : 16),
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
        textStyle: GoogleFonts.ysabeau(
          fontSize: 14,
          fontWeight: FontWeight.w300,
        ),
      ),
      child: Text(text),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Remove default padding
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF023131), // Warna utama Kamalana
                  Color.fromARGB(255, 36, 65, 54), // Variasi tone lebih gelap
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Kamalana Atelier',
                style: GoogleFonts.ysabeau(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('About Us', style: GoogleFonts.ysabeau(fontSize: 14)),
            onTap: () {
              _scrollToSection(_aboutMeKey);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Portfolio', style: GoogleFonts.ysabeau(fontSize: 14)),
            onTap: () {
              _scrollToSection(_portfolioKey);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Offerings', style: GoogleFonts.ysabeau(fontSize: 14)),
            onTap: () {
              _scrollToSection(_offeringKey);
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            title: Text('Contact', style: GoogleFonts.ysabeau(fontSize: 14)),
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
