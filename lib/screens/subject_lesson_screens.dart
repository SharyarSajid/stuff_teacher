import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

// 1. Manage Lesson
class ManageLessonScreen extends StatelessWidget {
  const ManageLessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Manage Lesson'),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        separatorBuilder: (ctx, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return _buildListItem('Lesson ${index + 1}', 'Chapter ${index + 1} - Introduction');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF265D82),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// 2. Manage Topic
class ManageTopicScreen extends StatelessWidget {
  const ManageTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Manage Topic'),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 5,
        separatorBuilder: (ctx, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          return _buildListItem('Topic ${index + 1}', 'Detailed explanation of topic ${index + 1}');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF265D82),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

Widget _buildListItem(String title, String subtitle) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade200),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.03),
          blurRadius: 5,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
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
