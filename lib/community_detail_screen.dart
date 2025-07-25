import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ═══════════════════════════════════════════════════════════
// COMMUNITY DETAIL SCREEN - Main Screen Widget
// ═══════════════════════════════════════════════════════════
class CommunityDetailScreen extends StatefulWidget {
  const CommunityDetailScreen({super.key});

  @override
  State<CommunityDetailScreen> createState() => _CommunityDetailScreenState();
}

class _CommunityDetailScreenState extends State<CommunityDetailScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _buildHeaderSection(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              _buildCommunityInfo(),
              Positioned(
                top: -20, // Position avatar lower to overlap the community info
                left: 20,
                child: _buildAvatarSection(),
              ),
            ],
          ),
          _buildDescription(),
          _buildTabs(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPostsTab(),
                _buildMembersTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // HEADER SECTION WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildHeaderSection() {
    return Stack(
      children: [
        Container(
          height: 249,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1522673607200-164d1b6ce486?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════
  // AVATAR SECTION WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildAvatarSection() {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(14), // Slightly smaller to account for border
        child: Image.network(
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80',
          fit: BoxFit.cover,
          width: 66, // Account for border
          height: 66,
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // COMMUNITY INFO WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildCommunityInfo() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
      child: Row(
        children: [
          const SizedBox(width: 86), // Space for avatar (70 + 16)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Design Community',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          '12,847 members',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 70,
                      height: 36,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFB968C7),
                            Color(0xFF6B73FF),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Joined community!'),
                                backgroundColor: Color(0xFF2A2A2A),
                              ),
                            );
                          },
                          child: const Center(
                            child: Text(
                              'Join',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // DESCRIPTION WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildDescription() {
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: const Text(
        'A vibrant community of designers sharing\ninspiration, resources, and creative ideas.',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 13,
          height: 1.4,
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // TABS WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildTabs() {
    return Container(
      height: 47,
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        border: Border(
          top: BorderSide(color: Color(0xFF111111), width: 1),
          bottom: BorderSide(color: Color(0xFF111111), width: 1),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        indicatorColor: const Color(0xFF6B73FF),
        indicatorWeight: 2,
        dividerColor: Colors.transparent,
        labelColor: const Color(0xFF6B73FF),
        unselectedLabelColor: Colors.grey,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        tabs: [
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.rotate(
                  angle: 0.2, // More tilt angle in radians
                  child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [
                        Color(0xFFB968C7),
                        Color(0xFF6B73FF),
                      ],
                    ).createShader(bounds),
                    child: Icon(Icons.article_outlined,
                        size: 20, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFFB968C7),
                      Color(0xFF6B73FF),
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    'Posts',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFFB968C7),
                      Color(0xFF6B73FF),
                    ],
                  ).createShader(bounds),
                  child:
                      Icon(Icons.people_outline, size: 20, color: Colors.white),
                ),
                const SizedBox(width: 8),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [
                      Color(0xFFB968C7),
                      Color(0xFF6B73FF),
                    ],
                  ).createShader(bounds),
                  child: const Text(
                    'Members',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
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

  // ═══════════════════════════════════════════════════════════
  // POSTS TAB WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildPostsTab() {
    return Container(
      color: Colors.black,
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildPostCard(),
        ],
      ),
    );
  }

  Widget _buildPostCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: const NetworkImage(
                    'https://randomuser.me/api/portraits/women/44.jpg',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kate Jackson',
                        style: TextStyle(
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
                          const Text(
                            'NY, New York',
                            style: TextStyle(
                              color: Color(0xFF9E9E9E),
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
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: Stack(
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1533473359331-0135ef1b58bf?w=400',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildLikeButton('100K'),
                          _buildEngagementButton(
                            'assets/icons/comment.svg',
                            '2.5K',
                            Colors.white,
                          ),
                          _buildEngagementButton(
                            'assets/icons/voting.svg',
                            '20K',
                            Colors.white,
                          ),
                          _buildEngagementButton(
                            'assets/icons/store.svg',
                            '45K',
                            Colors.white,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Caption
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: '@kate_jackson ',
                              style: TextStyle(
                                color: Color(0xFF9E9E9E),
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

  Widget _buildActionButton(IconData icon, String count, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 4),
        Text(
          count,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════
  // MEMBERS TAB WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildMembersTab() {
    return Container(
      color: Colors.black,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10, // Sample member count
        itemBuilder: (context, index) {
          return _buildMemberCard();
        },
      ),
    );
  }

  Widget _buildMemberCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tech Enthusiasts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Active 2 hours ago',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 72,
            height: 36,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFB968C7),
                  Color(0xFF6B73FF),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.pushNamed(context, '/chat');
                },
                child: const Center(
                  child: Text(
                    'Message',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
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
