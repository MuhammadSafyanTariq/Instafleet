import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/custom_bottom_nav_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0D10),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileHeader(),
                    const SizedBox(height: 16),
                    StatsRow(),
                    const SizedBox(height: 24),
                    PhotoGrid(),
                    const SizedBox(height: 100), // Space for bottom nav
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// PROFILE HEADER WIDGET
// Cover image with avatar overlay and settings icon
// ═══════════════════════════════════════════════════════════
class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280, // Adjusted height for proper avatar positioning
      child: Stack(
        clipBehavior: Clip.none, // Allow children to extend beyond bounds
        children: [
          // Cover Image - 351x192
          Container(
            width: 351,
            height: 192,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=800',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Settings Icon (Top Right) - No container
          Positioned(
            top: 16,
            right: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/settings');
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
                  Icons.settings,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),

          // Profile Avatar (Bottom Right) - Half on image, half below
          Positioned(
            bottom: 40, // Moved even more upward
            right: 20,
            child: Stack(
              children: [
                // Avatar Circle
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF4E4C1), Color(0xFFE8D5B7)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Color(0xFF8B7355),
                    ),
                  ),
                ),
                // Edit Pencil Icon - No container
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/change-avatar');
                    },
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcIn,
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Username and Handle (Behind Avatar)
          Positioned(
            bottom: 2, // Adjusted position
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  'Cohn Joe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 3,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                const Text(
                  '@Cohn_Joe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 3,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Follow and Message Buttons (Bottom Left)
          Positioned(
            bottom: 20,
            left: 20,
            child: Row(
              children: [
                // Follow Button - 108x43
                SizedBox(
                  width: 108,
                  height: 43,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFEC008C).withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Follow',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Message Button - 108x43
                SizedBox(
                  width: 108,
                  height: 43,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Message',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// FOLLOW BUTTONS WIDGET
// Follow and Message buttons with proper styling - 111x43
// ═══════════════════════════════════════════════════════════
class FollowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          // Follow Button - 111x43
          SizedBox(
            width: 111,
            height: 43,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFEC008C).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Follow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Message Button - 111x43
          SizedBox(
            width: 111,
            height: 43,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
              child: const Center(
                child: Text(
                  'Message',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// STATS ROW WIDGET
// Follower and Following stats with flower icons - Responsive
// ═══════════════════════════════════════════════════════════
class StatsRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 68,
        child: Stack(
          children: [
            // Lower container (Following) - positioned on the right
            Positioned(
              right: 0,
              child: SizedBox(
                width: 155,
                height: 68,
                child: _buildStatCard('150k Following', Icons.local_florist),
              ),
            ),
            // Upper container (Followers) - overlapping on the left
            Positioned(
              left: 0,
              child: SizedBox(
                width: 155,
                height: 68,
                child: _buildStatCard('150k Followers', Icons.local_florist),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String text, IconData icon, {String count = '150k'}) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0xFF333333),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white,
          width: 0.5,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatars at the top
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(color: Colors.white, width: 2.5),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFEC008C).withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child:
                      const Icon(Icons.favorite, color: Colors.white, size: 8),
                ),
                // Second avatar (middle) - overlapping
                Transform.translate(
                  offset: const Offset(-8, 0),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(color: Colors.white, width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFEC008C).withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.favorite,
                        color: Colors.white, size: 8),
                  ),
                ),
                // Third avatar (rightmost) - overlapping
                Transform.translate(
                  offset: const Offset(-16, 0),
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xFF673AB7), Color(0xFFD1C4E9)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(color: Colors.white, width: 2.5),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF673AB7).withOpacity(0.3),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.favorite,
                        color: Colors.white, size: 8),
                  ),
                ),
              ],
            ),
          ),
          // Text below avatars
          SizedBox(height: 4),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '150k ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: text.replaceAll('150k ', ''),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// PHOTO GRID WIDGET
// 2-column grid with specific image sizes: Responsive
// ═══════════════════════════════════════════════════════════
class PhotoGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left Column
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 4),
              child: Column(
                children: [
                  // Left Item 1
                  SizedBox(
                    height: 145,
                    child: _buildPhotoItem(0),
                  ),
                  const SizedBox(height: 8),
                  // Left Item 2
                  SizedBox(
                    height: 145,
                    child: _buildPhotoItem(3),
                  ),
                  const SizedBox(height: 8),
                  // Left Item 3
                  SizedBox(
                    height: 145,
                    child: _buildPhotoItem(4),
                  ),
                ],
              ),
            ),
          ),

          // Right Column
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 4),
              child: Column(
                children: [
                  // Right Item 1
                  SizedBox(
                    height: 250,
                    child: _buildPhotoItem(1),
                  ),
                  const SizedBox(height: 8),
                  // Right Item 2
                  SizedBox(
                    height: 250,
                    child: _buildPhotoItem(2),
                  ),
                  const SizedBox(height: 8),
                  // Right Item 3
                  SizedBox(
                    height: 250,
                    child: _buildPhotoItem(5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoItem(int index) {
    final List<String> photoUrls = [
      'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=400',
      'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?w=400',
      'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400',
      'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?w=400',
      'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=400',
      'https://images.unsplash.com/photo-1490750967868-88aa4486c946?w=400',
    ];

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          photoUrls[index],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFF2A2A2A),
              child: const Icon(
                Icons.image,
                color: Color(0xFF888888),
                size: 40,
              ),
            );
          },
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════
// FOLLOWERS CARD WIDGET
// Reusable card with overlapping avatars and followers text
// ═══════════════════════════════════════════════════════════
class FollowersCard extends StatelessWidget {
  final String text;
  final List<String> avatarUrls;
  final VoidCallback? onTap;

  const FollowersCard({
    super.key,
    required this.text,
    this.avatarUrls = const [
      'https://via.placeholder.com/100x100/FF6B6B/FFFFFF?text=1',
      'https://via.placeholder.com/100x100/4ECDC4/FFFFFF?text=2',
      'https://via.placeholder.com/100x100/45B7D1/FFFFFF?text=3',
    ],
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 12,
              offset: const Offset(0, 4),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            // Overlapping avatars stack
            SizedBox(
              width: 80, // Fixed width to contain all avatars
              child: Stack(
                children: [
                  // First avatar (leftmost)
                  _buildAvatar(avatarUrls.isNotEmpty ? avatarUrls[0] : null, 0),
                  // Second avatar (middle)
                  _buildAvatar(
                      avatarUrls.length > 1 ? avatarUrls[1] : null, 20),
                  // Third avatar (rightmost)
                  _buildAvatar(
                      avatarUrls.length > 2 ? avatarUrls[2] : null, 40),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Text
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(String? imageUrl, double leftOffset) {
    return Positioned(
      left: leftOffset,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          image: imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {
                    // Handle image loading error
                  },
                )
              : null,
        ),
        child: imageUrl == null
            ? const Icon(
                Icons.person,
                color: Colors.grey,
                size: 16,
              )
            : null,
      ),
    );
  }
}
