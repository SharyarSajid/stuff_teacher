import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool _generalNotifications = true;
  bool _sound = true;
  bool _vibrate = true;
  bool _appUpdates = false;
  bool _newTips = true;

  @override
  Widget build(BuildContext context) {
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
          'Notification Settings',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildToggleItem(
              'General Notifications',
              _generalNotifications,
              (val) => setState(() => _generalNotifications = val),
            ),
            const Divider(height: 30),
            _buildToggleItem(
              'Sound',
              _sound,
              (val) => setState(() => _sound = val),
            ),
            const Divider(height: 30),
            _buildToggleItem(
              'Vibrate',
              _vibrate,
              (val) => setState(() => _vibrate = val),
            ),
            const Divider(height: 30),
            _buildToggleItem(
              'App Updates',
              _appUpdates,
              (val) => setState(() => _appUpdates = val),
            ),
            const Divider(height: 30),
            _buildToggleItem(
              'New Tips Available',
              _newTips,
              (val) => setState(() => _newTips = val),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleItem(
      String title, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: const Color(0xFF265D82),
        ),
      ],
    );
  }
}
