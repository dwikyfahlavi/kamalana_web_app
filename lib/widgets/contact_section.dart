import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    final double padding = isMobile ? 20 : 60;

    return Container(
      padding: EdgeInsets.all(padding),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get in Touch',
            style: GoogleFonts.montserrat(
              fontSize: isMobile ? 28 : 38,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _buildContactContent(context, isMobile),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _buildContactContent(context, isMobile),
                ),
        ],
      ),
    );
  }

  List<Widget> _buildContactContent(BuildContext context, bool isMobile) {
    return [
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment:
              isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            _buildContactInfo(
              context,
              Icons.email_outlined,
              'Email Us',
              'hello@architectstudio.com',
              isMobile,
            ),
            SizedBox(height: isMobile ? 20 : 30),
            _buildContactInfo(
              context,
              Icons.phone_outlined,
              'Call Us',
              '+62 812-3456-7890', // Example Indonesian number
              isMobile,
            ),
            SizedBox(height: isMobile ? 20 : 30),
            _buildContactInfo(
              context,
              Icons.location_on_outlined,
              'Visit Our Studio',
              'Jl. Arsitek No. 123, Bandung, West Java, Indonesia',
              isMobile,
            ),
          ],
        ),
      ),
      SizedBox(width: isMobile ? 0 : 60, height: isMobile ? 40 : 0),
      Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send us a message:',
              style: GoogleFonts.montserrat(
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey[800],
              ),
              textAlign: isMobile ? TextAlign.center : TextAlign.left,
            ),
            SizedBox(height: isMobile ? 20 : 25),
            TextFormField(
              decoration:
                  _inputDecoration(context, 'Your Name', Icons.person_outline),
              style: GoogleFonts.openSans(),
            ),
            SizedBox(height: isMobile ? 15 : 20),
            TextFormField(
              decoration:
                  _inputDecoration(context, 'Your Email', Icons.email_outlined),
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.openSans(),
            ),
            SizedBox(height: isMobile ? 15 : 20),
            TextFormField(
              maxLines: 6,
              decoration: _inputDecoration(
                  context, 'Your Message', Icons.message_outlined),
              style: GoogleFonts.openSans(),
            ),
            SizedBox(height: isMobile ? 20 : 30),
            Center(
              // Center the button on mobile
              child: ElevatedButton.icon(
                onPressed: () {
                  // Implement form submission logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Message sent! Thank you.')),
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text('Send Message'),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  Widget _buildContactInfo(BuildContext context, IconData icon, String title,
      String value, bool isMobile) {
    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon,
            size: isMobile ? 28 : 32, color: Theme.of(context).primaryColor),
        SizedBox(width: isMobile ? 10 : 20),
        Flexible(
          // Use Flexible to prevent overflow on small screens
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: isMobile ? 18 : 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[800],
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: GoogleFonts.openSans(
                  fontSize: isMobile ? 15 : 16,
                  color: Colors.grey[700],
                ),
                softWrap: true, // Allow text to wrap
              ),
            ],
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(
      BuildContext context, String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      hintStyle: GoogleFonts.openSans(color: Colors.grey[500]),
      labelStyle: GoogleFonts.openSans(color: Colors.grey[700]),
      prefixIcon: Icon(icon,
          color: Theme.of(context).hintColor), // Use accent color for icons
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey[400]!),
      ),
      filled: true,
      fillColor: Colors.grey[50],
      contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    );
  }
}
