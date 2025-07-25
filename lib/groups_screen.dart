import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'create_community_screen.dart';

// ═══════════════════════════════════════════════════════════
// GROUPS SCREEN - Main Screen Widget
// ═══════════════════════════════════════════════════════════
class GroupsScreen extends StatefulWidget {
  const GroupsScreen({super.key});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  int _selectedTabIndex = 0;

  // Sample groups data
  final List<Map<String, String>> _groups = [
    {
      'name': 'Tech Enthusiasts',
      'members': '1,234 members',
      'activity': 'Active 2 hours ago',
      'image':
          'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
    },
    {
      'name': 'Tech Enthusiasts',
      'members': '1,234 members',
      'activity': 'Active 2 hours ago',
      'image':
          'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
    },
    {
      'name': 'Tech Enthusiasts',
      'members': '1,234 members',
      'activity': 'Active 2 hours ago',
      'image':
          'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0D10),
      resizeToAvoidBottomInset:
          false, // Prevents layout shift when keyboard appears
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 24),
            _buildTabs(),
            const SizedBox(height: 24),
            Expanded(child: _buildGroupsList()),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
          ? _buildPlusButton()
          : null, // Hide plus button when keyboard is visible
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SEARCH BAR WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Center(
        child: Container(
          width: 369,
          height: 49,
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Color(0xFF8E8E93),
                fontSize: 16,
              ),
              prefixIcon: Container(
                margin: const EdgeInsets.all(6),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.search,
                  color: Color(0xFF8E8E93),
                  size: 20,
                ),
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // TABS WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Center(
                  child: _buildTab('My Groups', 0),
                ),
              ),
              Expanded(
                child: Center(
                  child: _buildTab('Discover', 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Split gradient line - 50% for each tab
          Row(
            children: [
              // Left half - for "My Groups"
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _selectedTabIndex == 0 ? 2 : 0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFB968C7), // Purple/Pink
                        Color(0xFF6B73FF) // Blue
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              // Right half - for "Discover"
              Expanded(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _selectedTabIndex == 1 ? 2 : 0,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFB968C7), // Purple/Pink
                        Color(0xFF6B73FF) // Blue
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTabIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _selectedTabIndex = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            fontSize: 18,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            color: Colors.white, // This will be overridden by ShaderMask
          ),
          child: ShaderMask(
            shaderCallback: (bounds) => LinearGradient(
              colors: isSelected
                  ? [
                      const Color(0xFFB968C7), // Purple/Pink
                      const Color(0xFF6B73FF) // Blue
                    ]
                  : [
                      const Color(0xFF6B6B6B),
                      const Color(0xFF6B6B6B)
                    ], // Faded gray
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(bounds),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // GROUPS LIST WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildGroupsList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: _groups.length,
      itemBuilder: (context, index) => _buildGroupCard(_groups[index]),
    );
  }

  Widget _buildGroupCard(Map<String, String> group) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFF333333),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Group Image
          _buildGroupImage(group['image']!),
          const SizedBox(width: 16),

          // Group Info
          Expanded(child: _buildGroupInfo(group)),

          // View Button
          _buildViewButton(),
        ],
      ),
    );
  }

  Widget _buildGroupImage(String imageUrl) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGroupInfo(Map<String, String> group) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          group['name']!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          group['members']!,
          style: const TextStyle(
            color: Color(0xFF8E8E93),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          group['activity']!,
          style: const TextStyle(
            color: Color(0xFF8E8E93),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildViewButton() {
    return Container(
      width: 65,
      height: 36,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            Navigator.pushNamed(context, '/community_detail');
          },
          child: const Center(
            child: Text(
              'View',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // FLOATING ACTION BUTTON
  // ═══════════════════════════════════════════════════════════
  Widget _buildPlusButton() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFD946EF), Color(0xFF3B82F6)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
          BoxShadow(
            color: const Color(0xFFD946EF).withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: _handleCreateGroup,
          child: const Center(
            child: Icon(
              Icons.add,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // BOTTOM NAVIGATION BAR
  // ═══════════════════════════════════════════════════════════
  Widget _buildBottomNavBar() {
    return CustomBottomNavBar(
      selectedIndex: 2, // Groups is selected (center button index)
      onTap: _handleNavigation,
    );
  }

  // ═══════════════════════════════════════════════════════════
  // EVENT HANDLERS
  // ═══════════════════════════════════════════════════════════
  void _handleCreateGroup() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateCommunityScreen(),
      ),
    );
  }

  void _handleNavigation(int index) {
    if (index == 0) {
      Navigator.of(context).pushReplacementNamed('/home');
    }
    // Handle other navigation as needed
  }
}

// ═══════════════════════════════════════════════════════════
// CUSTOM BOTTOM NAVIGATION BAR
// ═══════════════════════════════════════════════════════════
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
    _initializeAnimations();
  }

  @override
  void dispose() {
    _fabAnimationController.dispose();
    super.dispose();
  }

  void _initializeAnimations() {
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
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildCustomPaint(),
          _buildNavigationItems(),
          _buildCenterFloatingButton(),
        ],
      ),
    );
  }

  Widget _buildCustomPaint() {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 80),
      painter: ModernBottomNavPainter(),
    );
  }

  Widget _buildNavigationItems() {
    return Positioned(
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
            _buildNavItem(1, 'assets/icons/explore.svg', 'Explore', false),
            const SizedBox(width: 64), // Space for FAB
            _buildNavItem(2, 'assets/icons/chat.svg', 'Chat', false),
            _buildNavItem(3, 'assets/icons/profile.svg', 'Profile', false),
          ],
        ),
      ),
    );
  }

  Widget _buildCenterFloatingButton() {
    return Positioned(
      top: -12,
      left: MediaQuery.of(context).size.width / 2 - 24,
      child: GestureDetector(
        onTapDown: (_) => _fabAnimationController.forward(),
        onTapUp: (_) => _fabAnimationController.reverse(),
        onTapCancel: () => _fabAnimationController.reverse(),
        onTap: () {}, // Already on groups screen
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
                    colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFB968C7).withOpacity(0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                      spreadRadius: 2,
                    ),
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
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label, bool isPng) {
    final isSelected = widget.selectedIndex == index;

    return GestureDetector(
      onTap: () => _handleNavItemTap(index),
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
              child: _buildNavIcon(iconPath, isSelected, isPng),
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

  Widget _buildNavIcon(String iconPath, bool isSelected, bool isPng) {
    final color = isSelected ? const Color(0xFF9C27B0) : Colors.white;

    return isPng
        ? Image.asset(iconPath, height: 24, width: 24, color: color)
        : SvgPicture.asset(
            iconPath,
            height: 24,
            width: 24,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          );
  }

  void _handleNavItemTap(int index) {
    switch (index) {
      case 0:
        Navigator.of(context).pushReplacementNamed('/home');
        break;
      case 1:
        Navigator.of(context).pushNamed('/explore');
        break;
      case 2:
        Navigator.of(context).pushNamed('/messages');
        break;
      default:
        widget.onTap(index);
    }
  }
}

// ═══════════════════════════════════════════════════════════
// MODERN BOTTOM NAVIGATION PAINTER
// ═══════════════════════════════════════════════════════════
class ModernBottomNavPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1C1C1C)
      ..style = PaintingStyle.fill;

    final path = _createNavBarPath(size);

    // Add shadow for depth
    canvas.drawShadow(path, Colors.black.withOpacity(0.2), 8, false);
    canvas.drawPath(path, paint);
  }

  Path _createNavBarPath(Size size) {
    final path = Path();

    // Start from bottom left
    path.moveTo(0, size.height);
    path.lineTo(0, 15);

    // Left side to curve start
    path.lineTo(size.width * 0.38, 15);

    // Create curved cutout for FAB
    path.quadraticBezierTo(size.width * 0.42, 15, size.width * 0.46, 8);
    path.quadraticBezierTo(size.width * 0.49, 3, size.width * 0.5, 3);
    path.quadraticBezierTo(size.width * 0.51, 3, size.width * 0.54, 8);
    path.quadraticBezierTo(size.width * 0.58, 15, size.width * 0.62, 15);

    // Right side
    path.lineTo(size.width, 15);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
