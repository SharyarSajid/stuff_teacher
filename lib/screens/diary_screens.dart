import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AddStudentDiaryScreen extends StatelessWidget {
  const AddStudentDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Student Diary',
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
               decoration: _inputDecoration('Select Class'),
               items: ['Class 5', 'Class 6', 'Class 7'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
               onChanged: (v) {},
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
               decoration: _inputDecoration('Select Section'),
               items: ['A', 'B', 'C'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
               onChanged: (v) {},
            ),
             const SizedBox(height: 16),
             DropdownButtonFormField<String>(
               decoration: _inputDecoration('Select Subject'),
               items: ['Math', 'Science', 'English'].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
               onChanged: (v) {},
            ),
             const SizedBox(height: 16),
             TextFormField(
               maxLines: 4,
               decoration: _inputDecoration('Note / Homework'),
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
                   'Add Diary Note',
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
}
