
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimetableItem extends StatelessWidget {
  final String startTime;
  final String? endTime;
  final String subject;
  final String className;
  final String classSection;
  final bool isLast;

  const TimetableItem({
    super.key,
    required this.startTime,
    this.endTime,
    required this.subject,
    required this.className,
    required this.classSection,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time Column
          SizedBox(
            width: 70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  startTime,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                if (endTime != null) ...[
                  const Spacer(),
                  Text(
                    endTime!,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ],
            ),
          ),
          // Timeline Line
          Column(
            children: [
              Container(
                width: 2,
                height: 20,
                color: Colors.grey.shade300,
              ),
               // We might need a custom painter for strictly matching the design if it's connected
               // But for now, simple spacing works or a continuous line logic
            ],
          ),
          const SizedBox(width: 8), 
          // Card
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFF8F9FA), // Light gray background
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subject',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subject,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Class',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$className $classSection',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
