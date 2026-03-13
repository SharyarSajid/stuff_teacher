
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/holiday_card.dart';
import '../constants/app_colors.dart';

class HolidaysScreen extends StatelessWidget {
  const HolidaysScreen({super.key});

  void _showHolidayDetail(BuildContext context, Map<String, String> holiday) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Center(
                 child: Container(
                   width: 50,
                   height: 5,
                   decoration: BoxDecoration(
                     color: Colors.grey.shade300,
                     borderRadius: BorderRadius.circular(10),
                   ),
                 ),
               ),
               const SizedBox(height: 20),
              Text(
                'Holiday',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                 decoration: BoxDecoration(
                  color: const Color(0xFF265D82),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${holiday['day']} ${holiday['month']} 2025',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                holiday['title']!,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 12),
               Text(
                holiday['description']!, // Using description from the list
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  height: 1.5,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    
    // Sample data for holidays
    final List<Map<String, String>> holidays = [
      {
        'day': '11',
        'month': 'June',
        'title': "1. New Year's Day",
        'description': "Celebrate the beginning of a brand new year filled with hope, resolutions, and fresh starts. A time to rest, reflect, and recharge.",
      },
       {
        'day': '25',
        'month': 'Dec',
        'title': "Christmas",
        'description': "Celebration of the birth of Jesus Christ.",
      },
       {
        'day': '18',
        'month': 'June',
        'title': "Holi - Festival of",
        'description': "A vibrant festival symbolizing the arrival of spring and the victory of good over evil, celebrated with colors and joy.",
      },
       {
        'day': '26',
        'month': 'June',
        'title': "Diwali - Festival of",
        'description': "A five-day celebration of light over darkness, knowledge over ignorance, and good over evil.",
      },
       {
        'day': '30',
        'month': 'June',
        'title': "Holi - Festival of",
        'description': "A vibrant festival symbolizing the arrival of spring and the victory of good over evil, celebrated with colors and joy.",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Holidays',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: holidays.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final holiday = holidays[index];
          return SizedBox(
              width: double.infinity, // Full width for vertical list
              child: HolidayCard(
                // No width passed, letting it take parent width or flexible
                dateDay: holiday['day']!,
                dateMonth: holiday['month']!,
                title: holiday['title']!,
                description: holiday['description']!,
                onReadMore: () => _showHolidayDetail(context, holiday),
              ),
          );
        },
      ),
    );
  }
}
