import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Exams'),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 3,
        itemBuilder: (context, index) {
          return _buildExamCard('Mid-Term Exam', '12 Oct 2025', 'Class 5', 'Science');
        },
      ),
    );
  }
}

class ExamResultScreen extends StatelessWidget {
  const ExamResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Exam Results'),
      body: Center(child: Text('Results List Placeholder')),
    );
  }
}

Widget _buildExamCard(String title, String date, String className, String subject) {
  return Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.primaryText)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Date: $date', style: GoogleFonts.poppins(fontSize: 14, color: AppColors.secondaryText)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(color: const Color(0xFFF7F8F9), borderRadius: BorderRadius.circular(4)),
              child: Text('$className - $subject', style: GoogleFonts.poppins(fontSize: 12, color: const Color(0xFF265D82))),
            )
          ],
        )
      ],
    ),
  );
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
