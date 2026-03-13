import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import 'login_screen.dart';
import 'edit_profile_screen.dart';
import 'change_password_screen.dart';
import 'notification_settings_screen.dart';
import 'more_settings_screens.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 10),
                     child: Text(
                      "Are you sure to logout?",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                                     ),
                   ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                           Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Text(
                          "Yes",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: const Color(0xFF265D82)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "No",
                          style: GoogleFonts.poppins(
                              fontSize: 16, color: const Color(0xFF265D82)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: false,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                   child: Image.network(
                    'https://i.pravatar.cc/150?img=11', // Placeholder
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 70,
                        height: 70,
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.person, size: 40, color: Colors.grey),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tony Patel',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Role : Teacher',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                       Text(
                        'Crestwood Academy (SCH2024...',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Personal Settings
            Text(
              'Personal Settings',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingItem(
              icon: Icons.person_outline,
              label: 'Edit Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildSettingItem(
              icon: Icons.password,
              label: 'Change Password',
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
                );
              },
            ),
             const SizedBox(height: 12),
            _buildSettingItem(
              icon: Icons.notifications_none,
              label: 'Notifications',
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationSettingsScreen()),
                );
              },
            ),

            const SizedBox(height: 30),

            // More Settings
            Text(
              'More Settings',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingItem(
              icon: Icons.translate,
              label: 'Change Language',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ChangeLanguageScreen()));
              },
            ),
            const SizedBox(height: 12),
             _buildSettingItem(
              icon: Icons.info_outline,
              label: 'About Us',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsScreen()));
              },
            ),
            const SizedBox(height: 12),
             _buildSettingItem(
              icon: Icons.phone_in_talk_outlined,
              label: 'Contact Us',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactUsScreen()));
              },
            ),
            const SizedBox(height: 12),
             _buildSettingItem(
              icon: Icons.privacy_tip_outlined,
              label: 'Privacy Policy',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()));
              },
            ),
             const SizedBox(height: 12),
             _buildSettingItem(
              icon: Icons.description_outlined,
              label: 'Terms & Condition',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsConditionsScreen()));
              },
            ),
             const SizedBox(height: 12),
             _buildSettingItem(
              icon: Icons.star_border,
              label: 'Rate Us',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RateUsScreen()));
              },
            ),
             const SizedBox(height: 12),
             _buildSettingItem(
              icon: Icons.share_outlined,
              label: 'Share App',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ShareAppScreen()));
              },
            ),


            const SizedBox(height: 30),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => _showLogoutDialog(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFB01D1D)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Logout',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFB01D1D),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Or a very light grey if needed to distinguish
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F9FD),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF265D82), size: 22),
        ),
        title: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Container(
             padding: const EdgeInsets.all(8),
             decoration: BoxDecoration(
               color: const Color(0xFFF5F9FD),
               shape: BoxShape.circle,
             ),
            child: const Icon(Icons.arrow_forward, size: 16, color: Color(0xFF265D82))),
        onTap: onTap,
      ),
    );
  }
}
