import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class MyTimetableScreen extends StatefulWidget {
  const MyTimetableScreen({super.key});

  @override
  State<MyTimetableScreen> createState() => _MyTimetableScreenState();
}

class _MyTimetableScreenState extends State<MyTimetableScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  // Sample data structure for the timetable
  final Map<String, List<Map<String, String>>> _timetableData = {
    'Mon': [
      {
        'startTime': '09:00 AM',
        'endTime': '09:45 AM',
        'subject': 'Mathematics',
        'class': 'Class 5',
        'section': 'A',
        'room': 'Room 101',
      },
      {
        'startTime': '10:00 AM',
        'endTime': '10:45 AM',
        'subject': 'Science',
        'class': 'Class 6',
        'section': 'B',
        'room': 'Lab 2',
      },
       {
        'startTime': '11:00 AM',
        'endTime': '11:45 AM',
        'subject': 'English',
        'class': 'Class 5',
        'section': 'A',
         'room': 'Room 101',
      },
    ],
    'Tue': [
       {
        'startTime': '09:00 AM',
        'endTime': '09:45 AM',
        'subject': 'Science',
        'class': 'Class 6',
        'section': 'B',
        'room': 'Lab 101',
      },
      {
        'startTime': '10:00 AM',
        'endTime': '10:45 AM',
        'subject': 'Mathematics',
        'class': 'Class 5',
        'section': 'A',
        'room': 'Room 203',
      },
    ],
    // Add more days as needed, defaulting others to empty or repetitive data for demo
    'Wed': [],
    'Thu': [],
    'Fri': [],
    'Sat': [],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _days.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'My Timetable',
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
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF265D82),
          unselectedLabelColor: Colors.grey,
          labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
          indicatorColor: const Color(0xFF265D82),
          indicatorWeight: 3,
          isScrollable: true, // Allows scrolling if screens are small
          padding: const EdgeInsets.symmetric(horizontal: 10),
          tabAlignment: TabAlignment.start, 
          tabs: _days.map((day) => Tab(text: day)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _days.map((day) => _buildDaySchedule(day)).toList(),
      ),
    );
  }

  Widget _buildDaySchedule(String day) {
    final schedule = _timetableData[day] ?? [];
    
    if (schedule.isEmpty) {
      if (day == 'Wed' || day == 'Thu' || day == 'Fri' || day == 'Sat') {
         // Show some dummy data for other days so it's not empty for the user
         return _buildList([
            {
              'startTime': '09:00 AM',
              'endTime': '09:45 AM',
              'subject': 'History',
              'class': 'Class 8',
              'section': 'C',
              'room': 'Room 304',
            },
            {
              'startTime': '11:00 AM',
              'endTime': '11:45 AM',
              'subject': 'Geography',
              'class': 'Class 7',
              'section': 'A',
              'room': 'Room 202',
            },
         ]);
      }
      return Center(
        child: Text(
          'No classes scheduled',
          style: GoogleFonts.poppins(color: Colors.grey),
        ),
      );
    }

    return _buildList(schedule);
  }

  Widget _buildList(List<Map<String, String>> schedule) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: schedule.length,
      itemBuilder: (context, index) {
        final item = schedule[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Row(
            children: [
              // Time Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['startTime']!,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryText,
                    ),
                  ),
                  Text(
                    item['endTime']!,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              // Vertical Divider
              Container(
                height: 50,
                width: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFF265D82),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 16),
              // Details Column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['subject']!,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                         Icon(Icons.class_outlined, size: 14, color: AppColors.secondaryText),
                         const SizedBox(width: 4),
                        Text(
                          '${item['class']} - ${item['section']}',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.secondaryText,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.location_on_outlined, size: 14, color: AppColors.secondaryText),
                         const SizedBox(width: 4),
                        Text(
                          item['room']!,
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: AppColors.secondaryText,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
