import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import '../constants/app_colors.dart';

class ChatDetailScreen extends StatefulWidget {
  final String userName;
  final String userImage;

  const ChatDetailScreen({
    super.key,
    required this.userName,
    required this.userImage,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
      {'text': 'bonjour', 'isMe': true, 'time': '06:06 AM', 'status': 'read'},
      {'date': '15-02-2025'},
      {'text': 'hi', 'isMe': true, 'time': '01:58 AM', 'status': 'read'},
      {'text': 'hello', 'isMe': true, 'time': '03:36 PM', 'status': 'read'},
      {'date': '18-02-2025'},
      {'text': 'hi', 'isMe': false, 'time': '12:17 PM', 'status': 'read'},
      {'date': '20-02-2025'},
      {'text': 'j8', 'isMe': true, 'time': '02:49 AM', 'status': 'read'},
      {'date': '25-02-2025'},
       {'text': 'h', 'isMe': true, 'time': '07:09 PM', 'status': 'read'},
  ];

  void _showAttachmentModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Important for custom shape
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFEAF2F8), // Light blueish background from screenshot
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAttachmentOption(
                icon: Icons.upload_file,
                label: 'Document',
                color: const Color(0xFFD6E4EE),
                iconColor: const Color(0xFF265D82),
              ),
              _buildAttachmentOption(
                icon: Icons.camera_alt_outlined,
                label: 'Camera',
                color: const Color(0xFFD6E4EE),
                iconColor: const Color(0xFF265D82),
              ),
              _buildAttachmentOption(
                icon: Icons.photo_outlined, // Icon for Gallery
                label: 'Gallery',
                color: const Color(0xFFD6E4EE),
                iconColor: const Color(0xFF265D82),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAttachmentOption({
    required IconData icon,
    required String label,
    required Color color,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        // Handle action
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: iconColor, size: 30),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryText,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FC), // Light chat background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
             CircleAvatar(
              backgroundImage: NetworkImage(widget.userImage),
              radius: 18,
            ),
            const SizedBox(width: 10),
            Text(
              widget.userName,
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                if (msg.containsKey('date')) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        msg['date'],
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF265D82),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }
                return _buildMessageBubble(msg);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> msg) {
    final bool isMe = msg['isMe'];
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isMe ? Colors.white : const Color(0xFF265D82),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: isMe ? const Radius.circular(16) : Radius.zero,
                bottomRight: isMe ? Radius.zero : const Radius.circular(16),
              ),
               boxShadow: [
                BoxShadow( 
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                )
              ]
            ),
            child: Text(
              msg['text'],
              style: GoogleFonts.poppins(
                color: isMe ? Colors.black : Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                msg['time'],
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: Colors.grey,
                ),
              ),
              if (isMe) ...[
                const SizedBox(width: 4),
                const Icon(Icons.done_all, size: 14, color: Colors.black), // Checkmark
              ]
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Reduced vertical padding
      color: Colors.white,
      child: SafeArea(
        child: Row(
          children: [
            Container(
               decoration: const BoxDecoration(
                 color: Color(0xFF265D82),
                 shape: BoxShape.circle,
               ),
               child: IconButton(
                icon: const Icon(Icons.attach_file, color: Colors.white, size: 20),
                onPressed: _showAttachmentModal,
                constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                           ),
             ),
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F9FC),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    hintStyle: GoogleFonts.poppins(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
             const SizedBox(width: 10),
             IconButton(
               onPressed: () {},
                icon: const Icon(Icons.send_rounded, color: Colors.black), // Send icon
             )
          ],
        ),
      ),
    );
  }
}
