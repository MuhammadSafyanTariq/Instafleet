import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════
// COMMUNITY MEMBERS SCREEN - Main Screen Widget
// ═══════════════════════════════════════════════════════════
class CommunityMembersScreen extends StatefulWidget {
  const CommunityMembersScreen({super.key});

  @override
  State<CommunityMembersScreen> createState() => _CommunityMembersScreenState();
}

class _CommunityMembersScreenState extends State<CommunityMembersScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
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
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',
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
                  Colors.black.withOpacity(0.8),
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
  // TABS WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildTabs() {
    return Container(
      color: Colors.black,
      child: TabBar(
        controller: _tabController,
        indicatorColor: const Color(0xFF6B73FF),
        indicatorWeight: 2,
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
        tabs: const [
          Tab(
            icon: Icon(Icons.article_outlined, size: 20),
            text: 'Posts',
          ),
          Tab(
            icon: Icon(Icons.people_outline, size: 20),
            text: 'Members',
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'View community posts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFB968C7),
                    Color(0xFF6B73FF),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, '/community_detail');
                  },
                  child: const Center(
                    child: Text(
                      'View Posts',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
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
            width: 80,
            height: 32,
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
