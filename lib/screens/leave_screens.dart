import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class ApplyLeaveScreen extends StatelessWidget {
  const ApplyLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Apply Leave'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
             TextFormField(
               decoration: _inputDecoration('Leave Title'),
             ),
             const SizedBox(height: 16),
             TextFormField(
               maxLines: 4,
               decoration: _inputDecoration('Reason'),
             ),
             const SizedBox(height: 16),
             Row(
               children: [
                 Expanded(child: TextFormField(decoration: _inputDecoration('From Date'))),
                 const SizedBox(width: 16),
                 Expanded(child: TextFormField(decoration: _inputDecoration('To Date'))),
               ],
             ),
             const SizedBox(height: 30),
             SizedBox(
               width: double.infinity,
               child: ElevatedButton(
                 onPressed: () {},
                 style: ElevatedButton.styleFrom(
                   backgroundColor: const Color(0xFF265D82),
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                 ),
                 child: Text(
                   'Submit Request',
                   style: GoogleFonts.poppins(
                     fontSize: 16,
                     fontWeight: FontWeight.w600,
                     color: Colors.white,
                   ),
                 ),
               ),
             ),
          ],
        ),
      ),
    );
  }
}

class MyLeaveScreen extends StatelessWidget {
  const MyLeaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'My Leaves'),
      body: Center(child: Text('Leave History Placeholder')),
    );
  }
}

PreferredSizeWidget _buildAppBar(BuildContext context, String title) {
  return AppBar(
      title: Text(
        title,
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
    );
}

InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: GoogleFonts.poppins(color: Colors.grey),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF265D82)),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }
