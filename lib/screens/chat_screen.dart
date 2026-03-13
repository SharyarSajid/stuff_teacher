import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import 'contacts_screen.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Chat',
          style: GoogleFonts.poppins(
            color: AppColors.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
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
               child:  TabBar(
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
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildChatList('Student'),
                _buildChatList('Parent'),
                _buildChatList('Staff'),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ContactsScreen()),
          );
        },
        backgroundColor: const Color(0xFF265D82),
        child: const Icon(Icons.add_comment_rounded, color: Colors.white),
      ),
    );
  }

  Widget _buildChatList(String type) {
    // Mock Data
    final List<Map<String, dynamic>> chats = [
      {'name': 'Class 1 demo', 'msg': 'h', 'time': '08:58 AM', 'img': 'https://i.pravatar.cc/150?img=1'},
      {'name': 'Erick Pereira', 'msg': 'ndkfmd', 'time': '09:56 AM', 'img': 'https://i.pravatar.cc/150?img=2'},
      {'name': 'Marisa Barros', 'msg': 'hello', 'time': '01:11 PM', 'img': 'https://i.pravatar.cc/150?img=3'},
      {'name': 'Kauan Sousa', 'msg': 'Attachment', 'time': '11:18 PM', 'img': 'https://i.pravatar.cc/150?img=4', 'count': 1},
      {'name': 'Luís Azevedo', 'msg': 'hello', 'time': '10:06 PM', 'img': 'https://i.pravatar.cc/150?img=5'},
    ];

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: chats.length,
      separatorBuilder: (context, index) => Divider(color: Colors.grey.shade100),
      itemBuilder: (context, index) {
        final chat = chats[index];
        return ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatDetailScreen(
                  userName: chat['name'],
                  userImage: chat['img'],
                ),
              ),
            );
          },
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(chat['img']),
            backgroundColor: Colors.grey.shade200,
          ),
          title: Text(
            chat['name'],
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.primaryText,
            ),
          ),
          subtitle: Text(
            chat['msg'],
            style: GoogleFonts.poppins(
              color: AppColors.secondaryText,
              fontSize: 14,
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                chat['time'],
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: AppColors.secondaryText,
                ),
              ),
              if (chat['count'] != null) ...[
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    chat['count'].toString(),
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ]
            ],
          ),
        );
      },
    );
  }
}
