import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VotingBottomSheet extends StatefulWidget {
  final String voteCount;

  const VotingBottomSheet({
    super.key,
    required this.voteCount,
  });

  @override
  State<VotingBottomSheet> createState() => _VotingBottomSheetState();
}

class _VotingBottomSheetState extends State<VotingBottomSheet> {
  // ═══════════════════════════════════════════════════════════
  // DATA SECTION: VOTING USERS
  // ═══════════════════════════════════════════════════════════
  final List<Map<String, String>> _votingUsers = [
    {
      'name': 'Jeanette Gottlieb',
      'username': '@JeanetteGottlieb',
      'image':
          'https://images.unsplash.com/photo-1494790108755-2616b612b787?w=100&h=100&fit=crop&crop=face',
    },
    {
      'name': 'Jeanette Gottlieb',
      'username': '@JeanetteGottlieb',
      'image':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop&crop=face',
    },
    {
      'name': 'Jeanette Gottlieb',
      'username': '@JeanetteGottlieb',
      'image':
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop&crop=face',
    },
    {
      'name': 'Jeanette Gottlieb',
      'username': '@JeanetteGottlieb',
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF121212),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ═══════════════════════════════════════════════════════════
          // SECTION 1: DRAG HANDLE
          // ═══════════════════════════════════════════════════════════
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // ═══════════════════════════════════════════════════════════
          // SECTION 2: VOTES AND LEADERSHIP ROW
          // ═══════════════════════════════════════════════════════════
          _buildVotesLeadershipRow(),

          // ═══════════════════════════════════════════════════════════
          // SECTION 2.5: SEPARATOR LINE
          // ═══════════════════════════════════════════════════════════
          _buildSeparatorLine(),

          // ═══════════════════════════════════════════════════════════
          // SECTION 3: VOTING USERS LIST
          // ═══════════════════════════════════════════════════════════
          Expanded(
            child: _buildVotingUsersList(),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 2 METHOD: VOTES AND LEADERSHIP ROW
  // ═══════════════════════════════════════════════════════════
  Widget _buildVotesLeadershipRow() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Votes Count with Gradient
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.voteCount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(
                    text: ' Votes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Leadership Board Text with Gradient
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: const Text(
              'Leadership board',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 3 METHOD: VOTING USERS LIST
  // ═══════════════════════════════════════════════════════════
  Widget _buildVotingUsersList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _votingUsers.length,
        itemBuilder: (context, index) {
          final user = _votingUsers[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // User Avatar
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(user['image']!),
                ),
                const SizedBox(width: 12),

                // User Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user['name']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        user['username']!,
                        style: const TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                // Voting Icon with Gradient Shades (No Container)
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFFB968C7), Color(0xFF6B73FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: SvgPicture.asset(
                    'assets/icons/voting.svg',
                    height: 16,
                    width: 16,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 2.5 METHOD: SEPARATOR LINE
  // ═══════════════════════════════════════════════════════════
  Widget _buildSeparatorLine() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      height: 1,
      color: const Color(0xFF666666),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // STATIC METHOD: SHOW BOTTOM SHEET
  // ═══════════════════════════════════════════════════════════
  static void show(
    BuildContext context, {
    required String voteCount,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: VotingBottomSheet(
          voteCount: voteCount,
        ),
      ),
    );
  }
}
