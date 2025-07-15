import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 768;
    final double padding = isMobile ? 20 : 80;

    return Container(
      padding: EdgeInsets.all(padding),
      color: const Color(0xFF023131), // Deep indigo color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Text(
            '•   GET IN TOUCH  •',
            style: GoogleFonts.ysabeauInfant(
              fontSize: isMobile ? 28 : 38,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 70),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final messageController = TextEditingController();

    return [
      Flexible(
        flex: isMobile ? 0 : 2,
        child: Padding(
          padding: EdgeInsets.only(bottom: isMobile ? 30 : 0),
          child: Column(
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                  final Uri emailUri = Uri(
                    scheme: 'mailto',
                    path: 'kamalana.atelier@gmail.com',
                  );
                  if (await canLaunchUrl(emailUri)) {
                    await launchUrl(emailUri,
                        mode: LaunchMode.externalApplication);
                  }
                },
                child: _buildContactInfo(
                  context,
                  Icons.email_rounded,
                  'Email Us',
                  'kamalana.atelier@gmail.com',
                  isMobile,
                ),
              ),
              SizedBox(height: isMobile ? 20 : 30),
              GestureDetector(
                onTap: () async {
                  final Uri whatsappUrl = Uri.parse(
                      'https://wa.me/+6281912308055'); // 62 is Indonesia country code
                  // ignore: deprecated_member_use
                  launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
                },
                child: _buildContactInfo(
                  context,
                  Icons.call_rounded,
                  'Call Us',
                  '+62 819 - 1230 - 8055',
                  isMobile,
                ),
              ),
              SizedBox(height: isMobile ? 20 : 30),
              GestureDetector(
                onTap: () async {
                  const url = 'https://instagram.com/kamalana.atelier';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url),
                        mode: LaunchMode.externalApplication);
                  }
                },
                child: _buildContactInfo(
                  context,
                  Icons.camera,
                  'Instagram',
                  'kamalana.atelier',
                  isMobile,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        width: isMobile ? 0 : 80,
        height: isMobile ? 40 : 0,
      ),
      Flexible(
        flex: isMobile ? 0 : 3,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment:
                isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                'We’re Here to Listen:',
                style: GoogleFonts.ysabeau(
                  fontSize: isMobile ? 18 : 30,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: isMobile ? TextAlign.center : TextAlign.left,
              ),
              SizedBox(height: isMobile ? 16 : 25),
              TextFormField(
                controller: nameController,
                decoration: _inputDecoration(
                    context, 'Your Name', Icons.person_2_rounded),
                style: GoogleFonts.ysabeauInfant(),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter your name' : null,
              ),
              SizedBox(height: isMobile ? 20 : 20),
              TextFormField(
                controller: emailController,
                decoration: _inputDecoration(
                    context, 'Your Email (Optional)', Icons.email_rounded),
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.ysabeauInfant(),
              ),
              SizedBox(height: isMobile ? 20 : 20),
              TextFormField(
                controller: messageController,
                maxLines: 6,
                decoration: _inputDecoration(
                    context, 'Your Message', Icons.message_rounded),
                style: GoogleFonts.ysabeauInfant(),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter your message'
                    : null,
              ),
              SizedBox(height: isMobile ? 20 : 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      final name = nameController.text;
                      final email = emailController.text;
                      final message = messageController.text;
                      final whatsappNumber = '+6281912308055';
                      final text = Uri.encodeComponent(
                          'Hi Kamalana, saya $name ($email).\n$message');
                      final url =
                          'https://wa.me/${whatsappNumber.replaceAll('+', '')}?text=$text';
                      if (await canLaunchUrl(Uri.parse(url))) {
                        await launchUrl(Uri.parse(url),
                            mode: LaunchMode.externalApplication);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Could not open WhatsApp.')),
                        );
                      }
                    }
                  },
                  icon: const Icon(Icons.email),
                  label: Text('Send via WhatsApp',
                      selectionColor: Colors.white,
                      style: GoogleFonts.ysabeauInfant(
                          color: const Color.fromARGB(249, 255, 255, 255),
                          fontSize: isMobile ? 12 : 18,
                          fontWeight: FontWeight.w300)),
                ),
              ),
            ],
          ),
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
        Icon(icon, size: isMobile ? 28 : 32, color: Colors.white),
        SizedBox(width: isMobile ? 10 : 20),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.ysabeauInfant(
                  fontSize: isMobile ? 18 : 25,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                value,
                style: GoogleFonts.ysabeauInfant(
                  fontSize: isMobile ? 15 : 16,
                  fontWeight: FontWeight.w200,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                softWrap: true,
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
      hintStyle: GoogleFonts.ysabeauInfant(color: Colors.grey[500]),
      labelStyle: GoogleFonts.ysabeauInfant(color: Colors.grey[700]),
      prefixIcon: Icon(icon, color: Theme.of(context).hintColor),
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
