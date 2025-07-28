import 'package:flutter/material.dart';

class ChangeAvatarScreen extends StatefulWidget {
  const ChangeAvatarScreen({super.key});

  @override
  State<ChangeAvatarScreen> createState() => _ChangeAvatarScreenState();
}

class _ChangeAvatarScreenState extends State<ChangeAvatarScreen> {
  int _selectedAvatarIndex = 0;

  final List<Map<String, dynamic>> _avatars = [
    {
      'name': 'Emoji 1',
      'image': 'assets/images/emoji1.png',
      'description': 'First emoji avatar',
    },
    {
      'name': 'Emoji 2',
      'image': 'assets/images/emoji2.png',
      'description': 'Second emoji avatar',
    },
    {
      'name': 'Emoji 3',
      'image': 'assets/images/emoji3.png',
      'description': 'Third emoji avatar',
    },
    {
      'name': 'Emoji 4',
      'image': 'assets/images/emoji4.png',
      'description': 'Fourth emoji avatar',
    },
    {
      'name': 'Emoji 5',
      'image': 'assets/images/emoji5.png',
      'description': 'Fifth emoji avatar',
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

            // Current Avatar Display Area
            _buildCurrentAvatarDisplay(),

            // Avatar Selection Grid
            Expanded(
              child: Container(
                color: Colors.black,
                child: _buildAvatarSelectionGrid(),
              ),
            ),

            // Update Button
            _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: Colors.white,
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
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),

          // Title
          Expanded(
            child: Center(
              child: const Text(
                'Change Avatar',
                style: TextStyle(
                  color: Colors.black,
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

  Widget _buildCurrentAvatarDisplay() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 0, bottom: 0),
      child: Stack(
        children: [
          // Large Avatar
          Center(
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Color(0xFF87CEEB), Color(0xFF98FB98)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: _buildAvatarImage(_selectedAvatarIndex, size: 100),
            ),
          ),

          // Sparkle icons
          Positioned(
            top: 60,
            left: 60,
            child: Icon(
              Icons.star,
              color: Colors.yellow,
              size: 16,
            ),
          ),
          Positioned(
            top: 80,
            right: 80,
            child: Icon(
              Icons.star,
              color: Colors.yellow,
              size: 12,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 80,
            child: Icon(
              Icons.star,
              color: Colors.yellow,
              size: 14,
            ),
          ),

          // Heart icon
          Positioned(
            bottom: 80,
            left: 60,
            child: Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarSelectionGrid() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Top Row (3 avatars)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAvatarOption(0),
              _buildAvatarOption(1),
              _buildAvatarOption(2),
            ],
          ),

          const SizedBox(height: 20),

          // Bottom Row (2 avatars)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildAvatarOption(3),
              _buildAvatarOption(4),
              const SizedBox(width: 80), // Balance the layout
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarOption(int index) {
    final isSelected = _selectedAvatarIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedAvatarIndex = index;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                isSelected ? Colors.transparent : Colors.grey.withOpacity(0.2),
            width: 1,
          ),
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
        ),
        child: Container(
          margin: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: _buildAvatarImage(index, size: 90),
        ),
      ),
    );
  }

  Widget _buildAvatarImage(int index, {double size = 80}) {
    // Use the emoji images from assets
    final emojiImages = [
      'assets/images/emoji1.png',
      'assets/images/emoji2.png',
      'assets/images/emoji3.png',
      'assets/images/emoji4.png',
      'assets/images/emoji5.png',
    ];

    return Container(
      width: size,
      height: size,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size / 2),
        child: Image.asset(
          emojiImages[index % emojiImages.length],
          width: size,
          height: size,
          fit: BoxFit.contain,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }

  Widget _buildUpdateButton() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: 328,
        height: 58,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Center(
          child: Text(
            'Update',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
