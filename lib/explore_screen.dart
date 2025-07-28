import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int _selectedFilterIndex = 0;

  // ═══════════════════════════════════════════════════════════
  // DATA SECTION: FILTER OPTIONS
  // ═══════════════════════════════════════════════════════════
  final List<String> _filterOptions = [
    'ALL',
    'POSTS',
    'PAGES',
    'USERS',
    'HASHTAGS',
  ];

  // ═══════════════════════════════════════════════════════════
  // DATA SECTION: TRENDING HASHTAGS
  // ═══════════════════════════════════════════════════════════
  final List<Map<String, String>> _trendingHashtags = [
    {
      'hashtag': '#interior',
      'subtitle': '123 Videos',
      'image':
          'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=400&h=600&fit=crop',
    },
    {
      'hashtag': '#interior',
      'subtitle': '123 Videos',
      'image':
          'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=400&h=600&fit=crop',
    },
    {
      'hashtag': '#interior',
      'subtitle': '123 Videos',
      'image':
          'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=400&h=600&fit=crop',
    },
  ];

  // ═══════════════════════════════════════════════════════════
  // DATA SECTION: TRENDING POSTS
  // ═══════════════════════════════════════════════════════════
  final List<String> _trendingPosts = [
    'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=400&h=400&fit=crop',
    'https://images.unsplash.com/photo-1544636331-e26879cd4d9b?w=400&h=400&fit=crop',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // ═══════════════════════════════════════════════════════════
            // SECTION 1: SEARCH BAR (369x46)
            // ═══════════════════════════════════════════════════════════
            _buildSearchBar(),
            const SizedBox(height: 16),

            // ═══════════════════════════════════════════════════════════
            // SECTION 2: FILTER CHIPS ROW
            // ═══════════════════════════════════════════════════════════
            _buildFilterChips(),
            const SizedBox(height: 24),

            // ═══════════════════════════════════════════════════════════
            // SECTION 3: TRENDING HASHTAGS
            // ═══════════════════════════════════════════════════════════
            _buildTrendingHashtags(),
            const SizedBox(height: 32),

            // ═══════════════════════════════════════════════════════════
            // SECTION 4: TRENDING POSTS GRID
            // ═══════════════════════════════════════════════════════════
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTrendingPosts(),
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

  // ═══════════════════════════════════════════════════════════
  // SECTION 1 METHOD: SEARCH BAR
  // Size: 369x46 pixels
  // ═══════════════════════════════════════════════════════════
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: 369,
        height: 46,
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(23),
        ),
        child: const TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search for page, post or hashtags',
            hintStyle: TextStyle(
              color: Color(0xFF888888),
              fontSize: 16,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Icon(
                Icons.search,
                color: Color(0xFF888888),
                size: 20,
              ),
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 13,
            ),
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 2 METHOD: FILTER CHIPS ROW
  // Size: 335x25 pixels
  // Options: ALL, POSTS, PAGES, USERS, HASHTAGS
  // ═══════════════════════════════════════════════════════════
  Widget _buildFilterChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: 335,
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _filterOptions.length,
          itemBuilder: (context, index) {
            final isSelected = index == _selectedFilterIndex;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedFilterIndex = index;
                  });
                },
                child: Container(
                  height: 25,
                  constraints: isSelected
                      ? BoxConstraints(
                          minWidth:
                              _filterOptions[index] == 'HASHTAGS' ? 110 : 60)
                      : null,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    gradient: isSelected
                        ? const LinearGradient(
                            colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )
                        : null,
                    color: isSelected ? null : Colors.transparent,
                    borderRadius: BorderRadius.circular(12.5),
                    border: isSelected
                        ? null
                        : Border.all(color: Colors.transparent),
                  ),
                  child: Center(
                    child: Text(
                      _filterOptions[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            isSelected ? Colors.white : const Color(0xFF888888),
                        fontSize: 12,
                        fontWeight:
                            isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 3 METHOD: TRENDING HASHTAGS
  // Size: 128x202 pixels per card
  // Horizontal scroll cards with sports car images
  // ═══════════════════════════════════════════════════════════
  Widget _buildTrendingHashtags() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Trending Hashtags',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Horizontal Scroll Cards
        SizedBox(
          height: 202,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _trendingHashtags.length,
            itemBuilder: (context, index) {
              final hashtag = _trendingHashtags[index];
              return Container(
                width: 128,
                height: 202,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A1A),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    // Full Image Background
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        hashtag['image']!,
                        width: 128,
                        height: 202,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 128,
                            height: 202,
                            color: const Color(0xFF2A2A2A),
                            child: const Icon(
                              Icons.image,
                              color: Color(0xFF888888),
                              size: 30,
                            ),
                          );
                        },
                      ),
                    ),

                    // Gradient Overlay
                    Container(
                      width: 128,
                      height: 202,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
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

                    // Text Content Overlaid at Bottom
                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            hashtag['hashtag']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            hashtag['subtitle']!,
                            style: const TextStyle(
                              color: Color(0xFFCCCCCC),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 4 METHOD: TRENDING POSTS STAGGERED GRID
  // 2-column staggered grid with variable heights
  // ═══════════════════════════════════════════════════════════
  Widget _buildTrendingPosts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        const Text(
          'Trending Posts',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),

        // Staggered Grid Layout
        _buildStaggeredGrid(),
      ],
    );
  }

  Widget _buildStaggeredGrid() {
    // Alternating short and long pattern in each column
    final List<double> leftColumnHeights = [
      140,
      220,
      150
    ]; // short, long, short
    final List<double> rightColumnHeights = [
      200,
      160,
      240
    ]; // long, short, long

    return Row(
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
                  height: leftColumnHeights[0], // 160
                  child: _buildPostItem(0),
                ),
                const SizedBox(height: 8),
                // Left Item 2
                SizedBox(
                  height: leftColumnHeights[1], // 200
                  child: _buildPostItem(2),
                ),
                const SizedBox(height: 8),
                // Left Item 3
                SizedBox(
                  height: leftColumnHeights[2], // 180
                  child: _buildPostItem(4),
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
                  height: rightColumnHeights[0], // 220
                  child: _buildPostItem(1),
                ),
                const SizedBox(height: 8),
                // Right Item 2
                SizedBox(
                  height: rightColumnHeights[1], // 140
                  child: _buildPostItem(3),
                ),
                const SizedBox(height: 8),
                // Right Item 3
                SizedBox(
                  height: rightColumnHeights[2], // 190
                  child: _buildPostItem(5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPostItem(int index) {
    if (index >= _trendingPosts.length) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(16),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        _trendingPosts[index],
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.image,
              color: Color(0xFF888888),
              size: 40,
            ),
          );
        },
      ),
    );
  }
}
