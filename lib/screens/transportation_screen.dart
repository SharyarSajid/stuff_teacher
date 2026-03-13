import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class TransportationScreen extends StatelessWidget {
  const TransportationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transportation',
          style: GoogleFonts.poppins(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primaryText),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildInfoCard(
              icon: CupertinoIcons.bus,
              title: 'Route 5 - North City',
              subtitle: 'Bus No: KA-01-AB-1234',
              secondaryInfo: 'Driver: John Doe (+91 9876543210)',
            ),
            const SizedBox(height: 16),
            _buildInfoCard(
              icon: Icons.location_on_outlined,
              title: 'Current Stop',
              subtitle: 'Central Park Station',
              secondaryInfo: 'ETA: 10 mins',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required String subtitle, String? secondaryInfo}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        children: [
          Icon(icon, size: 40, color: const Color(0xFF265D82)),
          const SizedBox(height: 12),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryText,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: AppColors.secondaryText,
            ),
          ),
          if (secondaryInfo != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8F9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                secondaryInfo,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: const Color(0xFF265D82),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
