import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import 'chat_detail_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  
  String _selectedClass = '2 A - English'; // Default selected class
  final List<String> _classes = [
    '2 A - English',
    '4 A - English',
    '2 C - English',
    '3 C - English',
    '10 A - English',
    '1 A - English',
    '1 B - English',
    '3 A - English',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Filter By : Class',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Flexible(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _classes.length,
                      itemBuilder: (context, index) {
                        final className = _classes[index];
                        return RadioListTile<String>(
                          title: Text(
                            className,
                            style: GoogleFonts.poppins(
                              color: AppColors.primaryText,
                              fontSize: 16,
                            ),
                          ),
                          value: className,
                          groupValue: _selectedClass,
                          activeColor: const Color(0xFF265D82),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                          dense: true,
                          onChanged: (String? value) {
                            if (value != null) {
                              setModalState(() {
                                _selectedClass = value;
                              });
                              setState(() {
                                _selectedClass = value;
                              });
                              Navigator.pop(context);
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Contacts',
          style: GoogleFonts.poppins(
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
           Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: const Color(0xFF265D82),
                  borderRadius: BorderRadius.circular(8),
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: 'Students'),
                  Tab(text: 'Parents'),
                  Tab(text: 'Staffs'),
                ],
              ),
            ),
          ),
          
          // Class Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Class',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                  ),
                ),
                InkWell(
                  onTap: _showFilterModal,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          _selectedClass,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: AppColors.primaryText,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_drop_down, color: Colors.black),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: GoogleFonts.poppins(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey), // Should use trailing icon if following exactly? Screenshot has search icon on right usually but standard is left. Screenshot shows only text 'Search' and search icon on right!
                // Wait, examining screenshot 3 'Contacts' search bar: It says "Search" on left, search icon on RIGHT.
                suffixIcon: const Icon(Icons.search, color: Colors.grey),
                icon: null, // Removing default prefix icon if we want suffix
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              ),
              onChanged: (text) {
                setState(() {}); // Rebuild to filter
              },
            ),
          ),
          
          const SizedBox(height: 20),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildContactList('Student'),
                _buildContactList('Parent'),
                _buildContactList('Staff'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactList(String type) {
    // Mock Data
    final List<Map<String, String>> contacts = [
      {'name': 'Marisa Barros', 'img': 'https://i.pravatar.cc/150?img=3'},
      {'name': 'Lucas Sousa', 'img': 'https://i.pravatar.cc/150?img=6'},
      {'name': 'Alex Almeida', 'img': 'https://i.pravatar.cc/150?img=7'},
      {'name': 'Pedro Sousa', 'img': 'https://i.pravatar.cc/150?img=8'},
      {'name': 'Estevan Pinto', 'img': 'https://i.pravatar.cc/150?img=9'},
      {'name': 'Diego Martins', 'img': 'https://i.pravatar.cc/150?img=10'},
    ];

    // Filter
    final filteredContacts = contacts.where((contact) {
      final name = contact['name']!.toLowerCase();
      final query = _searchController.text.toLowerCase();
      return name.contains(query);
    }).toList();

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: filteredContacts.length,
      separatorBuilder: (context, index) => Divider(color: Colors.grey.shade100),
      itemBuilder: (context, index) {
        final contact = filteredContacts[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.grey.shade100, // Light background for avatar
              borderRadius: BorderRadius.circular(12), // Squircle shape as per design
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // Inner radius
             
              child: const Icon(Icons.person, size: 30, color: Colors.black), 
             
            ),
          ),
        
          
          
          title: Text(
            contact['name']!,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: AppColors.primaryText,
            ),
          ),
          onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailScreen(
                  userName: contact['name']!,
                  userImage: contact['img']!,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
