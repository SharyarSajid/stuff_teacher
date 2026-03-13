import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Change Language Screen
class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Change Language'),
      body: Center(child: Text('Language Settings', style: GoogleFonts.poppins())),
    );
  }
}

// About Us Screen
class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'About Us'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Staff Teacher App v1.0.0',
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Empowering teachers with digital tools.',
              style: GoogleFonts.poppins(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// Contact Us Screen
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Contact Us'),
      body: Center(child: Text('Contact support@school.com', style: GoogleFonts.poppins())),
    );
  }
}

// Privacy Policy Screen
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Privacy Policy'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Text(
          'Privacy Policy text goes here...',
          style: GoogleFonts.poppins(),
        ),
      ),
    );
  }
}

// Terms & Conditions Screen
class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Terms & Conditions'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Text(
          'Terms and Conditions text goes here...',
          style: GoogleFonts.poppins(),
        ),
      ),
    );
  }
}

// Rate Us Screen
class RateUsScreen extends StatelessWidget {
  const RateUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Rate Us'),
      body: Center(child: Text('Rate Us feature coming soon!', style: GoogleFonts.poppins())),
    );
  }
}

// Share App Screen
class ShareAppScreen extends StatelessWidget {
  const ShareAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Share App'),
      body: Center(child: Text('Share App feature coming soon!', style: GoogleFonts.poppins())),
    );
  }
}


AppBar _buildAppBar(BuildContext context, String title) {
  return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
}
