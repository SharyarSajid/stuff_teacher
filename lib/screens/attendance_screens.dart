import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

// 1. Add Attendance
class AddAttendanceScreen extends StatelessWidget {
  const AddAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'Add Attendance'),
      body: Center(child: Text('Add Attendance Form Placeholder')),
    );
  }
}

// 2. View Attendance
class ViewAttendanceScreen extends StatelessWidget {
  const ViewAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'View Attendance'),
      body: Center(child: Text('Attendance Records Placeholder')),
    );
  }
}

// 3. My Attendance
class MyAttendanceScreen extends StatelessWidget {
  const MyAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context, 'My Attendance'),
      body: Center(child: Text('My Attendance Stats Placeholder')),
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
