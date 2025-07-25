import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './voting_bottom_sheet.dart';
import './comments_bottom_sheet.dart';

class SocialFeedScreen extends StatefulWidget {
  const SocialFeedScreen({super.key});

  @override
  State<SocialFeedScreen> createState() => _SocialFeedScreenState();
}

class _SocialFeedScreenState extends State<SocialFeedScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Top Header
            const TopHeader(),
            const SizedBox(height: 16),
            // Stories Section
            const StoriesSection(),
            const SizedBox(height: 16),
            // Feed Posts
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  FeedPost(
                    userName: 'Kate Jackson',
                    location: 'NY, New York',
                    userAvatar:
                        'https://randomuser.me/api/portraits/women/44.jpg',
                    postImage:
                        'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=400',
                    likes: '100K',
                    comments: '2.5K',
                    shares: '20K',
                    saves: '45K',
                    caption: '@kate_jackson My New Campaign',
                  ),
                  FeedPost(
                    userName: 'Kate Jackson',
                    location: 'NY, New York',
                    userAvatar:
                        'https://randomuser.me/api/portraits/women/44.jpg',
                    postImage:
                        'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?w=400',
                    likes: '85K',
                    comments: '1.8K',
                    shares: '15K',
                    saves: '32K',
                    caption: '@kate_jackson Beautiful flowers',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

// Top Header Widget
class TopHeader extends StatelessWidget {
  const TopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Image.asset(
            'assets/images/logo.png',
            height: 55,
            width: 168,
          ),
          // Notification Icon
          NotificationButton(
            hasNotification: true,
            size: 30.0,
            onTap: () {
              // Navigate to notifications screen
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
    );
  }
}

// Stories Section Widget
class StoriesSection extends StatelessWidget {
  const StoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = [
      {'name': 'Add Item', 'image': '', 'isAddButton': true},
      {
        'name': 'Anna',
        'image': 'https://randomuser.me/api/portraits/women/1.jpg',
        'isAddButton': false
      },
      {
        'name': 'Bella',
        'image': 'https://randomuser.me/api/portraits/women/2.jpg',
        'isAddButton': false
      },
      {
        'name': 'Cathy',
        'image': 'https://randomuser.me/api/portraits/women/3.jpg',
        'isAddButton': false
      },
      {
        'name': 'Daisy',
        'image': 'https://randomuser.me/api/portraits/women/4.jpg',
        'isAddButton': false
      },
      {
        'name': 'Ella',
        'image': 'https://randomuser.me/api/portraits/women/5.jpg',
        'isAddButton': false
      },
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          final isAddButton = story['isAddButton'] as bool;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                GestureDetector(
                  onTap: isAddButton
                      ? () {
                          // Navigate to camera screen
                          Navigator.pushNamed(context, '/camera');
                        }
                      : () {
                          // Navigate to story viewer
                          Navigator.pushNamed(
                            context,
                            '/story',
                            arguments: {
                              'userName': story['name'] as String,
                              'userImage': story['image'] as String,
                              'storyImage':
                                  'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80', // Pink tulips image like in the reference
                            },
                          );
                        },
                  child: Container(
                    width: 66,
                    height: 79,
                    decoration: isAddButton
                        ? null // Remove old decoration for add button
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: const LinearGradient(
                              colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                    child: isAddButton
                        ? Container(
                            width: 66,
                            height: 79,
                            decoration: BoxDecoration(
                              color: const Color(0xFF2A2A2A),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            child: Center(
                              child: ShaderMask(
                                shaderCallback: (bounds) =>
                                    const LinearGradient(
                                  colors: [
                                    Color(0xFFFFFFFF),
                                    Color(0xFFF472B6),
                                    Color(0xFFE879F9),
                                    Color(0xFFD946EF),
                                    Color(0xFFA855F7),
                                    Color(0xFF8B5CF6),
                                    Color(0xFF6366F1),
                                    Color(0xFF3B82F6),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  stops: [
                                    0.0,
                                    0.2,
                                    0.3,
                                    0.4,
                                    0.5,
                                    0.6,
                                    0.8,
                                    1.0
                                  ],
                                ).createShader(bounds),
                                child: const Icon(
                                  Icons.add_rounded,
                                  size: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Stack(
                                children: [
                                  Image.network(
                                    story['image'] as String,
                                    fit: BoxFit.cover,
                                    width: 64,
                                    height: 77,
                                  ),
                                  Positioned(
                                    bottom: 4,
                                    left: 4,
                                    right: 4,
                                    child: Text(
                                      story['name'] as String,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Inter',
                                        shadows: [
                                          Shadow(
                                            color: Colors.black,
                                            offset: Offset(1, 1),
                                            blurRadius: 2,
                                          ),
                                        ],
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Feed Post Widget
class FeedPost extends StatelessWidget {
  final String userName;
  final String location;
  final String userAvatar;
  final String postImage;
  final String likes;
  final String comments;
  final String shares;
  final String saves;
  final String caption;

  const FeedPost({
    super.key,
    required this.userName,
    required this.location,
    required this.userAvatar,
    required this.postImage,
    required this.likes,
    required this.comments,
    required this.shares,
    required this.saves,
    required this.caption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Info Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(userAvatar),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 12,
                            color: Color(0xFF9E9E9E),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            location,
                            style: const TextStyle(
                              color:
                                  Color(0xFF9E9E9E), // Exact same color as icon
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Post Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Stack(
              children: [
                Image.network(
                  postImage,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                // Engagement Overlay
                Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Engagement Row
                      SizedBox(
                        width: 243,
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildLikeButton(likes),
                            _buildEngagementButton(
                              'assets/icons/comment.svg',
                              comments,
                              Colors.white,
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    child: CommentsBottomSheet(
                                      commentCount: comments,
                                    ),
                                  ),
                                );
                              },
                            ),
                            _buildEngagementButton(
                              'assets/icons/voting.svg',
                              shares,
                              Colors.white,
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    child: VotingBottomSheet(
                                      voteCount: shares,
                                    ),
                                  ),
                                );
                              },
                            ),
                            _buildEngagementButton(
                              'assets/icons/store.svg',
                              saves,
                              Colors.white,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Caption
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '@${userName.toLowerCase().replaceAll(' ', '_')} ',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const TextSpan(
                              text: 'My New Campaign',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLikeButton(String count) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.favorite,
          size: 24,
          color: Colors.red,
        ),
        const SizedBox(width: 4),
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildShareButton(String count) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFB968C7).withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
              BoxShadow(
                color: const Color(0xFF6B73FF).withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.all(1.5), // Creates the ring effect
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.share_outlined,
                size: 16,
                color: Colors.grey[400],
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildEngagementButton(String iconPath, String count, Color iconColor,
      {VoidCallback? onTap}) {
    Widget content = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          height: 16,
          width: 16,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        ),
        const SizedBox(width: 4),
        Text(
          count,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: content,
      );
    }

    return content;
  }
}

// Custom Bottom Navigation Bar
class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with TickerProviderStateMixin {
  late AnimationController _fabAnimationController;
  late Animation<double> _fabScaleAnimation;

  @override
  void initState() {
    super.initState();
    _fabAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _fabScaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _fabAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Custom Paint for Curve with dark background
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 80),
            painter: ModernBottomNavPainter(),
          ),
          // Navigation Items
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildNavItem(0, 'assets/icons/home.png', 'Home', true),
                  _buildNavItem(
                      1, 'assets/icons/explore.svg', 'Explore', false),
                  const SizedBox(width: 64), // Space for FAB
                  _buildNavItem(2, 'assets/icons/chat.svg', 'Chat', false),
                  _buildNavItem(
                      3, 'assets/icons/profile.svg', 'Profile', false),
                ],
              ),
            ),
          ),
          // Floating Action Button with glow
          Positioned(
            top: -12,
            left: MediaQuery.of(context).size.width / 2 - 24,
            child: GestureDetector(
              onTapDown: (_) => _fabAnimationController.forward(),
              onTapUp: (_) => _fabAnimationController.reverse(),
              onTapCancel: () => _fabAnimationController.reverse(),
              onTap: () {
                Navigator.of(context).pushNamed('/groups');
              },
              child: AnimatedBuilder(
                animation: _fabScaleAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _fabScaleAnimation.value,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFB968C7),
                            Color(0xFF6B73FF)
                          ], // Purple to Blue
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          // Glow effect
                          BoxShadow(
                            color: const Color(0xFFB968C7).withOpacity(0.4),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                            spreadRadius: 2,
                          ),
                          // Elevation shadow
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.storefront_rounded,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label, bool isPng) {
    final isSelected = widget.selectedIndex == index;

    return GestureDetector(
      onTap: () {
        if (index == 1) {
          // Explore button
          Navigator.of(context).pushNamed('/explore');
        } else if (index == 2) {
          // Chat button
          Navigator.of(context).pushNamed('/messages');
        } else {
          widget.onTap(index);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: isSelected ? 1.1 : 1.0,
              duration: const Duration(milliseconds: 200),
              child: isPng
                  ? Image.asset(
                      iconPath,
                      height: 24,
                      width: 24,
                      color:
                          isSelected ? const Color(0xFF9C27B0) : Colors.white,
                    )
                  : SvgPicture.asset(
                      iconPath,
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        isSelected ? const Color(0xFF9C27B0) : Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: isSelected ? const Color(0xFF9C27B0) : Colors.white,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}

// Modern Bottom Navigation Bar Painter
class ModernBottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1C1C1C) // Slightly lighter dark background
      ..style = PaintingStyle.fill;

    final path = Path();

    // Start from bottom left
    path.moveTo(0, size.height);
    path.lineTo(0, 15);

    // Left side to curve start
    path.lineTo(size.width * 0.38, 15);

    // Create subtle curved cutout for FAB
    path.quadraticBezierTo(size.width * 0.42, 15, size.width * 0.46, 8);
    path.quadraticBezierTo(size.width * 0.49, 3, size.width * 0.5, 3);
    path.quadraticBezierTo(size.width * 0.51, 3, size.width * 0.54, 8);
    path.quadraticBezierTo(size.width * 0.58, 15, size.width * 0.62, 15);

    // Right side
    path.lineTo(size.width, 15);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    // Add subtle shadow for depth
    canvas.drawShadow(path, Colors.black.withOpacity(0.2), 8, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom Send Button Widget
class SendButton extends StatefulWidget {
  final VoidCallback onTap;
  final double size;

  const SendButton({
    super.key,
    required this.onTap,
    this.size = 40.0,
  });

  @override
  State<SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _glowAnimation = Tween<double>(
      begin: 0.3,
      end: 0.6,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _animationController.forward(),
      onTapUp: (_) => _animationController.reverse(),
      onTapCancel: () => _animationController.reverse(),
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  // Glowing outer shadow
                  BoxShadow(
                    color: const Color(0xFFB968C7)
                        .withOpacity(_glowAnimation.value),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                    spreadRadius: 2,
                  ),
                  // Soft elevation shadow
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(2), // Creates the ring effect
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A1A), // Dark inner fill
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.send,
                    size: widget.size * 0.4, // Responsive icon size
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Custom Notification Button Widget
class NotificationButton extends StatelessWidget {
  final bool hasNotification;
  final VoidCallback onTap;
  final double size;

  const NotificationButton({
    super.key,
    required this.hasNotification,
    required this.onTap,
    this.size = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            // Main button with gradient border and black center
            Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFB968C7).withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                  BoxShadow(
                    color: const Color(0xFF6B73FF).withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(2), // Creates the ring effect
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.notifications_none,
                    size: size * 0.7, // Even larger bell icon
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            // Notification dot (aligned with bell outline)
            if (hasNotification)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 6.0, // Very small notification dot
                  height: 6.0,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFB968C7).withOpacity(0.6),
                        blurRadius: 6,
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
}
