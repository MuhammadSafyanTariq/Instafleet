import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './send_icon_button.dart';

class CommentsBottomSheet extends StatefulWidget {
  final String commentCount;

  const CommentsBottomSheet({
    super.key,
    required this.commentCount,
  });

  @override
  State<CommentsBottomSheet> createState() => _CommentsBottomSheetState();
}

class _CommentsBottomSheetState extends State<CommentsBottomSheet> {
  final TextEditingController _messageController = TextEditingController();

  // Sample comments data
  final List<Map<String, String>> _comments = [
    {
      'name': '@JeanetteGottlieb',
      'image':
          'https://images.unsplash.com/photo-1494790108755-2616b612b47c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
      'comment':
          'This sunflower is so vibrant! The colors just pop. It makes me feel so cheerful!'
    },
    {
      'name': '@JeanetteGottlieb',
      'image':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
      'comment':
          'This sunflower is so vibrant! The colors just pop. It makes me feel so cheerful!'
    },
    {
      'name': '@JeanetteGottlieb',
      'image':
          'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
      'comment':
          'This sunflower is so vibrant! The colors just pop. It makes me feel so cheerful!'
    },
    {
      'name': '@JeanetteGottlieb',
      'image':
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1000&q=80',
      'comment':
          'This sunflower is so vibrant! The colors just pop. It makes me feel so cheerful!'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF0D0D0D),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ═══════════════════════════════════════════════════════════
            // SECTION 1: DRAG HANDLE
            // ═══════════════════════════════════════════════════════════
            _buildDragHandle(),

            // ═══════════════════════════════════════════════════════════
            // SECTION 2: COMMENTS HEADER
            // ═══════════════════════════════════════════════════════════
            _buildCommentsHeader(),

            // ═══════════════════════════════════════════════════════════
            // SECTION 3: COMMENTS LIST
            // ═══════════════════════════════════════════════════════════
            Expanded(
              child: _buildCommentsList(),
            ),

            // ═══════════════════════════════════════════════════════════
            // SECTION 4: MESSAGE INPUT
            // ═══════════════════════════════════════════════════════════
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 1 METHOD: DRAG HANDLE
  // ═══════════════════════════════════════════════════════════
  Widget _buildDragHandle() {
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 8),
      height: 4,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 2 METHOD: COMMENTS HEADER
  // ═══════════════════════════════════════════════════════════
  Widget _buildCommentsHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Comments Count with Gradient
        Container(
          margin: const EdgeInsets.all(16),
          child: Row(
            children: [
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
                        text: widget.commentCount,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const TextSpan(
                        text: ' COMMENTS',
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
            ],
          ),
        ),

        // Separator Line below comments header
        _buildSeparatorLine(),
      ],
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 2.5 METHOD: SEPARATOR LINE
  // ═══════════════════════════════════════════════════════════
  Widget _buildSeparatorLine() {
    return Container(
      width: double.infinity,
      height: 1,
      margin: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 16),
      color: const Color(0xFF666666),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 3 METHOD: COMMENTS LIST
  // ═══════════════════════════════════════════════════════════
  Widget _buildCommentsList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _comments.length,
        itemBuilder: (context, index) {
          final comment = _comments[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User Avatar
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(comment['image']!),
                ),
                const SizedBox(width: 12),

                // Comment Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username
                      Text(
                        comment['name']!,
                        style: const TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // Comment Text
                      Text(
                        comment['comment']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1.4,
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
    );
  }

  // ═══════════════════════════════════════════════════════════
  // SECTION 4 METHOD: MESSAGE INPUT
  // ═══════════════════════════════════════════════════════════
  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF0D0D0D),
      ),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              // Message Input Field
              Expanded(
                child: TextField(
                  controller: _messageController,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Message',
                    hintStyle: TextStyle(
                      color: Color(0xFF888888),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 8, top: 1, bottom: 7),
                  ),
                  maxLines: null,
                ),
              ),

              // Send Icon Button
              GestureDetector(
                onTap: () {
                  // Handle send message
                  if (_messageController.text.trim().isNotEmpty) {
                    // Add message logic here
                    _messageController.clear();
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: const Icon(
                    Icons.send,
                    color: Color(0xFF888888),
                    size: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
