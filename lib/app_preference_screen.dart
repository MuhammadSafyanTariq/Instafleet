import 'package:flutter/material.dart';

class AppPreferenceScreen extends StatefulWidget {
  const AppPreferenceScreen({super.key});

  @override
  State<AppPreferenceScreen> createState() => _AppPreferenceScreenState();
}

class _AppPreferenceScreenState extends State<AppPreferenceScreen> {
  final List<Map<String, dynamic>> _preferenceItems = [
    {
      'title': 'Theme',
      'subtitle': 'System default',
      'icon': 'assets/icons/app-preferences1.png',
      'type': 'navigation',
    },
    {
      'title': 'Notifications',
      'subtitle': '',
      'icon': 'assets/icons/app-preferences2.png',
      'type': 'toggle',
      'value': true,
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

            // App Preference Settings List
            Expanded(
              child: _buildPreferenceList(),
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
                border: Border.all(color: Colors.white, width: 0.5),
              ),
              child: const Center(
                child: Align(
                  alignment: Alignment(0.2, 0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),

          // Title
          Expanded(
            child: Center(
              child: const Text(
                'App Preference',
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

  Widget _buildPreferenceList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _preferenceItems.length,
      itemBuilder: (context, index) {
        final item = _preferenceItems[index];
        return _buildPreferenceItem(item, index);
      },
    );
  }

  Widget _buildPreferenceItem(Map<String, dynamic> item, int index) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Image.asset(
            item['icon'],
            width: 16,
            height: 16,
            color: Colors.white,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
      title: Text(
        item['title'],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: item['subtitle'].isNotEmpty
          ? Text(
              item['subtitle'],
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 12,
              ),
            )
          : null,
      trailing: item['type'] == 'toggle'
          ? _buildCustomSwitch(
              value: item['value'] ?? false,
              onChanged: (value) {
                setState(() {
                  item['value'] = value;
                });
              },
            )
          : const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 16,
            ),
      onTap: () {
        _handlePreferenceTap(item, index);
      },
    );
  }

  Widget _buildCustomSwitch({
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 50,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: value
              ? const LinearGradient(
                  colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          color: value ? null : Colors.grey[600],
        ),
        child: Stack(
          children: [
            // Track
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            // Thumb
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              left: value ? 22 : 2,
              top: 2,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: value ? Colors.white : null,
                  gradient: value
                      ? null
                      : const LinearGradient(
                          colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                  borderRadius: BorderRadius.circular(13),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handlePreferenceTap(Map<String, dynamic> item, int index) {
    switch (item['title']) {
      case 'Theme':
        // Navigate to theme settings
        break;
      case 'Notifications':
        // Toggle handled by Switch
        break;
    }
  }
}
