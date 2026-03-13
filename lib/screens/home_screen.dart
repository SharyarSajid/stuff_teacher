
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/overview_card.dart';
import '../widgets/timetable_item.dart';
import '../widgets/holiday_card.dart';
import '../constants/app_colors.dart';
import 'notification_screen.dart';
import 'leaves_screen.dart';
import 'holidays_screen.dart';
import 'students_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showAllTimetable = false;

  final List<Map<String, String>> _allTimetableItems = [
    {
      'startTime': '7:00 AM',
      'endTime': '7:30 AM',
      'subject': 'English',
      'className': '1',
      'classSection': 'A',
    },
    {
      'startTime': '7:00 AM',
      'endTime': '8:00 AM',
      'subject': 'English',
      'className': '1',
      'classSection': 'B',
    },
    {
      'startTime': '8:30 AM',
      'endTime': '9:00 AM',
      'subject': 'English',
      'className': '3',
      'classSection': 'A',
    },
  ];
  
  // Sample data for holidays on home screen
  final List<Map<String, String>> _homeHolidays = [
    {
      'day': '11',
      'month': 'June',
      'title': "1. New Year's Day",
      'description': "Celebrate the beginning of a brand new year filled with hope...",
    },
     {
      'day': '25',
      'month': 'Dec',
      'title': "Christmas",
      'description': "Celebration of the birth of Jesus Christ.",
    },
  ];

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
                "Celebrate the beginning of a brand new year filled with hope, resolutions, and fresh starts. A time to rest, reflect, and recharge.",
                 // Using full text as per screenshot example for the modal
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
    // Determine which items to show
    final displayedItems = _showAllTimetable
        ? _allTimetableItems
        : _allTimetableItems.take(2).toList(); 

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Header
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(
                                  'https://i.pravatar.cc/150?img=11'), // Placeholder
                              backgroundColor: Colors.grey,
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hi, welcome!',
                                  style: GoogleFonts.poppins(
                                    color: AppColors.secondaryText,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  'Tony Patel',
                                  style: GoogleFonts.poppins(
                                    color: AppColors.primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.notifications_outlined),
                            color: Colors.black,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NotificationScreen()),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Overview Section Title
                    Text(
                      'Overview',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                      ),
                    ),
                    const SizedBox(height: 16),
                    OverviewCard(
                      onViewStudents: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentsScreen()));
                      },
                    ),
                    const SizedBox(height: 30),

                    // Timetable Section Title
                    Text(
                      "Today's Timetable",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...displayedItems.map((item) {
                      return TimetableItem(
                        startTime: item['startTime']!,
                        endTime: item['endTime']!,
                        subject: item['subject']!,
                        className: item['className']!,
                        classSection: item['classSection']!,
                      );
                    }),

                    Center(
                      child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            _showAllTimetable = !_showAllTimetable;
                          });
                        },
                        icon: Icon(
                          _showAllTimetable
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: const Color(0xFF0F52BA),
                        ),
                        label: Text(
                          _showAllTimetable ? 'View Less' : 'View More',
                          style: GoogleFonts.poppins(
                            color: const Color(0xFF0F52BA),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                    
                    // Leaves Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Leaves',
                           style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                         GestureDetector(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => const LeavesScreen()));
                           },
                           child: Row(
                             children: [
                               Text(
                                  'View More',
                                   style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColors.secondaryText,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.arrow_forward, size: 14, color: AppColors.secondaryText),
                             ],
                           ),
                         ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16), // keeping vertical padding for spacing
                      child: Text(
                        'Everyone is present today',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Holidays Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Holidays',
                           style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryText,
                          ),
                        ),
                         GestureDetector(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => const HolidaysScreen()));
                           },
                           child: Row(
                             children: [
                               Text(
                                  'View More',
                                   style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: AppColors.secondaryText,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Icon(Icons.arrow_forward, size: 14, color: AppColors.secondaryText),
                             ],
                           ),
                         ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ], // Children of inner column
                ),
              ),
              
             
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _homeHolidays.map((holiday) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: HolidayCard(
                          width: 300,
                          dateDay: holiday['day']!,
                          dateMonth: holiday['month']!,
                          title: holiday['title']!,
                          description: holiday['description']!,
                          onReadMore: () => _showHolidayDetail(context, holiday),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
