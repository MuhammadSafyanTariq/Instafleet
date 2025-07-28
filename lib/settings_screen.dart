import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = true;

  final List<Map<String, dynamic>> _settingsItems = [
    {
      'title': 'Account',
      'subtitle': 'Edit Profile and name username and password',
      'icon': 'assets/icons/account.png',
      'type': 'navigation',
    },
    {
      'title': 'Privacy',
      'subtitle': 'Profile Visibility set as private or public',
      'icon': 'assets/icons/privacy.png',
      'type': 'navigation',
    },
    {
      'title': 'Avatar',
      'subtitle': 'Create, edit, profile photo or avatar',
      'icon': 'assets/icons/avatar.png',
      'type': 'navigation',
    },
    {
      'title': 'App Preferences',
      'subtitle': 'Select theme as dark mode or light mode',
      'icon': 'assets/icons/app-preferences.png',
      'type': 'navigation',
    },
    {
      'title': 'Help',
      'subtitle': 'Help center for customer to contact anytime',
      'icon': 'assets/icons/help.png',
      'type': 'navigation',
    },
    {
      'title': 'Ads Setting',
      'subtitle': 'Boost your posts using Ads',
      'icon': 'assets/icons/ads-setting.png',
      'type': 'navigation',
    },
    {
      'title': 'Logout',
      'subtitle': 'Logout from the app',
      'icon': 'assets/icons/logout.png',
      'type': 'logout',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),

            // Settings List
            Expanded(
              child: _buildSettingsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          // Back Button
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white,
                  width: 0.5,
                ),
              ),
              child: Align(
                alignment: const Alignment(0.2, 0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),

          // Title
          Expanded(
            child: Center(
              child: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          // Placeholder for balance
          const SizedBox(width: 40),
        ],
      ),
    );
  }

  Widget _buildSettingsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _settingsItems.length,
      itemBuilder: (context, index) {
        final item = _settingsItems[index];
        return _buildSettingsItem(item, index);
      },
    );
  }

  Widget _buildSettingsItem(Map<String, dynamic> item, int index) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Image.asset(
        item['icon'],
        width: 24,
        height: 24,
        color: Colors.white,
        filterQuality: FilterQuality.high,
        fit: BoxFit.contain,
      ),
      title: Text(
        item['title'],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        item['subtitle'],
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 12,
        ),
      ),
      onTap: () {
        _handleSettingsTap(item, index);
      },
    );
  }

  void _handleSettingsTap(Map<String, dynamic> item, int index) {
    switch (item['title']) {
      case 'Account':
        Navigator.pushNamed(context, '/edit-profile');
        break;
      case 'Avatar':
        Navigator.pushNamed(context, '/change-avatar');
        break;
      case 'Privacy':
        Navigator.pushNamed(context, '/privacy');
        break;
      case 'App Preferences':
        Navigator.pushNamed(context, '/app-preference');
        break;
      case 'Help':
        Navigator.pushNamed(context, '/help-support');
        break;
      case 'Ads Setting':
        Navigator.pushNamed(context, '/my-ads');
        break;
      case 'Logout':
        _showLogoutDialog();
        break;
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1A1A1A),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: const Text(
            'Are you sure you want to logout?',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Handle logout logic here
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
