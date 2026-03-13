import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import 'my_timetable_screen.dart';
import 'class_section_screen.dart';
import 'attendance_screens.dart';
import 'subject_lesson_screens.dart';
import 'assignment_screens.dart';
import 'transportation_screen.dart';
import 'message_screens.dart';
import 'diary_screens.dart';
import 'exam_screens.dart';
import 'leave_screens.dart';
import 'payroll_screens.dart';

class AcademicsScreen extends StatelessWidget {
  const AcademicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Academics',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 30),
              
              _AcademicsSection(
                title: 'Timetable',
                items: [
                  _AcademicsItem(
                    icon: Icons.calendar_today_outlined,
                    label: 'My Timetable',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MyTimetableScreen()),
                      );
                    },
                  ),
                  _AcademicsItem(
                    icon: Icons.people_outline,
                    label: 'Class Section',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ClassSectionScreen()),
                      );
                    },
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              _AcademicsSection(
                title: 'Attendance',
                items: [
                  _AcademicsItem(
                    icon: Icons.assignment_outlined,
                    label: 'Add Attendance',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const AddAttendanceScreen()));
                    },
                  ),
                  _AcademicsItem(
                    icon: Icons.assignment_ind_outlined,
                    label: 'View Attendance',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const ViewAttendanceScreen()));
                    },
                  ),
                  _AcademicsItem(
                    icon: Icons.person_outline,
                    label: 'My Attendance',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const MyAttendanceScreen()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

               _AcademicsSection(
                title: 'Subject Lesson',
                items: [
                  _AcademicsItem(
                    icon: Icons.description_outlined,
                    label: 'Manage Lesson',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const ManageLessonScreen()));
                    },
                  ),
                  _AcademicsItem(
                    icon: Icons.topic_outlined,
                    label: 'Manage Topic',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const ManageTopicScreen()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

               _AcademicsSection(
                title: 'Student Assignment',
                items: [
                  _AcademicsItem(
                    icon: Icons.assignment_outlined,
                    label: 'Manage Assignment',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const ManageAssignmentScreen()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

              _AcademicsSection(
                title: 'Transportation',
                items: [
                  _AcademicsItem(
                    icon: CupertinoIcons.bus,
                    label: 'Transportation',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const TransportationScreen()));
                    },
                  ),
                ],
              ),

               const SizedBox(height: 30),

              _AcademicsSection(
                title: 'Message',
                items: [
                  _AcademicsItem(
                    icon: CupertinoIcons.speaker_2,
                    label: 'Manage Announcement',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const ManageAnnouncementScreen()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

               _AcademicsSection(
                title: 'Student Diary',
                items: [
                  _AcademicsItem(
                    icon: Icons.book_outlined,
                    label: 'Add Student Diary',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const AddStudentDiaryScreen()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

               _AcademicsSection(
                title: 'Offline Exam',
                items: [
                  _AcademicsItem(
                    icon: Icons.content_paste_outlined,
                    label: 'Exams',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const ExamsScreen()));
                    },
                  ),
                  _AcademicsItem(
                     icon: Icons.grade_outlined,
                    label: 'Exam Result',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const ExamResultScreen()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

               _AcademicsSection(
                title: 'Leave',
                items: [
                   _AcademicsItem(
                    icon: Icons.calendar_month_outlined,
                    label: 'Apply Leave',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const ApplyLeaveScreen()));
                    },
                  ),
                   _AcademicsItem(
                    icon: Icons.calendar_today_outlined,
                    label: 'My Leave',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const MyLeaveScreen()));
                    },
                  ),
                ],
              ),

              const SizedBox(height: 30),

               _AcademicsSection(
                title: 'Payroll',
                items: [
                   _AcademicsItem(
                    icon: Icons.receipt_long_outlined,
                    label: 'My Payroll Slips',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const MyPayrollSlipsScreen()));
                    },
                  ),
                   _AcademicsItem(
                    icon: Icons.currency_exchange,
                    label: 'Allowances & Deductions',
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => const AllowancesDeductionsScreen()));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _AcademicsSection extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const _AcademicsSection({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryText,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            // Adding a subtle shadow to separate from background if background is white
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
            children: items.map((item) {
              final isLast = item == items.last;
              return Column(
                children: [
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8), // Padding inside the container for the item
                    child: item,
                  ),
                  // Separator if not last? Screenshot doesn't clearly show lines, but usually they exist. 
                  // But looking at the generous spacing, maybe just padding.
                  // Let's rely on the item padding.
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _AcademicsItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _AcademicsItem({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8F9), // Light bg for icon
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF265D82), // Dark blue icon color
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: AppColors.primaryText,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF7F8F9),
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Color(0xFF265D82),
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
