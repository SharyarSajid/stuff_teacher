import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class ClassSectionScreen extends StatelessWidget {
  const ClassSectionScreen({super.key});

  final List<Map<String, String>> _classes = const [
    {
      'className': 'Class 5',
      'section': 'A',
      'subject': 'Mathematics',
      'students': '32',
      'room': '101'
    },
    {
      'className': 'Class 6',
      'section': 'B',
      'subject': 'Science',
      'students': '28',
      'room': 'Lab 2'
    },
    {
      'className': 'Class 8',
      'section': 'C',
      'subject': 'History',
      'students': '30',
      'room': '304'
    },
    {
      'className': 'Class 7',
      'section': 'A',
      'subject': 'Geography',
      'students': '35',
      'room': '202'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Class Section',
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
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: _classes.length,
        itemBuilder: (context, index) {
          final cls = _classes[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.grey.shade100),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cls['className']} - ${cls['section']}',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                        Text(
                          cls['subject']!,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: const Color(0xFF265D82),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F8F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.people_alt_outlined, color: const Color(0xFF265D82)),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildInfoBadge(Icons.groups_outlined, '${cls['students']} Students'),
                    const SizedBox(width: 12),
                    _buildInfoBadge(Icons.meeting_room_outlined, 'Room ${cls['room']}'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFCE8F0), // Light pinkish for accent or use grey
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: AppColors.primaryText),
          const SizedBox(width: 4),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: AppColors.primaryText,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
