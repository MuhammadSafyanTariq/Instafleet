import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'create_community_screen.dart';
import 'chat_screen.dart';
import 'messages_screen.dart';
import 'widgets/custom_bottom_nav_bar.dart';

// ═══════════════════════════════════════════════════════════
// GROUPS SCREEN - Main Screen Widget
// ═══════════════════════════════════════════════════════════
class GroupsScreen extends StatefulWidget {
  final bool showBottomNav;

  const GroupsScreen({
    super.key,
    this.showBottomNav = true,
  });

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen> {
  int _selectedTabIndex = 0; // 0 for My Groups, 1 for Messages

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
            Expanded(
              child: _selectedTabIndex == 0
                  ? _buildGroupsList()
                  : _buildMessagesTab(),
            ),
          ],
        ),
      ),

      floatingActionButton: MediaQuery.of(context).viewInsets.bottom == 0
          ? _buildPlusButton()
          : null, // Hide plus button when keyboard is visible
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: widget.showBottomNav
          ? CustomBottomNavBar(
              selectedIndex: -1, // No tab selected for groups (center FAB)
              onTap: (index) {
                switch (index) {
                  case 0:
                    Navigator.pushReplacementNamed(context, '/home');
                    break;
                  case 1:
                    Navigator.pushReplacementNamed(context, '/explore');
                    break;
                  case 2:
                    // Messages icon - navigate to groups
                    Navigator.pushReplacementNamed(context, '/groups');
                    break;
                  case 3:
                    Navigator.pushReplacementNamed(context, '/profile');
                    break;
                }
              },
            )
          : null,
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
                  child: _buildTab('Messages', 1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Gradient line container
          Container(
            height: 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
            ),
            child: Row(
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
                // Right half - for "Messages"
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
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    final isSelected = _selectedTabIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
      },
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

  // ═══════════════════════════════════════════════════════════
  // MESSAGES TAB WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildMessagesTab() {
    return const MessagesScreen();
  }
}
