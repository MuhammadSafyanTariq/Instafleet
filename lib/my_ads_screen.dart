import 'package:flutter/material.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen> {
  final List<Map<String, dynamic>> _adsList = [
    {
      'title': 'Summer Sale',
      'status': 'Active',
      'action': 'Edit',
      'icon': 'assets/icons/summer_sale.png',
      'iconColor': const Color(0xFF90EE90),
    },
    {
      'title': 'Back to School',
      'status': 'Ended',
      'action': 'View',
      'icon': 'assets/icons/back_to_school.png',
      'iconColor': const Color(0xFF20B2AA),
    },
    {
      'title': 'Holiday Special',
      'status': 'Active',
      'action': 'Pause',
      'icon': 'assets/icons/holiday_special.png',
      'iconColor': Colors.white,
    },
    {
      'title': 'Spring Collection',
      'status': 'Ended',
      'action': 'View',
      'icon': 'assets/icons/spring_collection.png',
      'iconColor': const Color(0xFF32CD32),
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

            // Ads List
            _buildAdsList(),
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
                'My Ads',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Add Button
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/create-add');
            },
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdsList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _adsList.map((ad) => _buildAdItem(ad)).toList(),
      ),
    );
  }

  Widget _buildAdItem(Map<String, dynamic> ad) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          // Ad Icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: ad['iconColor'],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: _buildAdIcon(ad['title']),
            ),
          ),

          const SizedBox(width: 12),

          // Ad Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ad['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ad['status'],
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Action Button
          Container(
            width: 84,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                ad['action'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdIcon(String title) {
    switch (title) {
      case 'Summer Sale':
        return const Icon(
          Icons.local_florist,
          color: Colors.orange,
          size: 32,
        );
      case 'Back to School':
        return const Text(
          'BACK TO SCHOOL',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        );
      case 'Holiday Special':
        return Container(
          width: 24,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Center(
            child: Icon(
              Icons.card_giftcard,
              color: Colors.grey,
              size: 20,
            ),
          ),
        );
      case 'Spring Collection':
        return const Icon(
          Icons.eco,
          color: Colors.green,
          size: 32,
        );
      default:
        return const Icon(
          Icons.campaign,
          color: Colors.white,
          size: 32,
        );
    }
  }
}
