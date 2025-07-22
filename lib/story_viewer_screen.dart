import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradientHeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [
          Color(0xFFB968C7), // Purple/pink
          Color(0xFF6B73FF), // Blue
          Color(0xFF37ACE2), // Light blue
        ],
        stops: [0.0, 0.5, 1.0],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final path = Path();
    final width = size.width;
    final height = size.height;

    // Create heart shape path
    path.moveTo(width * 0.5, height * 0.25);
    path.cubicTo(width * 0.2, height * 0.1, width * 0.1, height * 0.3,
        width * 0.1, height * 0.45);
    path.cubicTo(width * 0.1, height * 0.6, width * 0.5, height * 0.9,
        width * 0.5, height * 0.9);
    path.cubicTo(width * 0.5, height * 0.9, width * 0.9, height * 0.6,
        width * 0.9, height * 0.45);
    path.cubicTo(width * 0.9, height * 0.3, width * 0.8, height * 0.1,
        width * 0.5, height * 0.25);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class StoryViewerScreen extends StatefulWidget {
  final String userName;
  final String userImage;
  final String storyImage;

  const StoryViewerScreen({
    super.key,
    required this.userName,
    required this.userImage,
    required this.storyImage,
  });

  @override
  State<StoryViewerScreen> createState() => _StoryViewerScreenState();
}

class _StoryViewerScreenState extends State<StoryViewerScreen> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    // Set status bar to light content for this dark screen
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
  }

  @override
  void dispose() {
    // Reset status bar when leaving
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Full screen story image
          Positioned.fill(
            child: Image.network(
              widget.storyImage,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[800],
                  child: const Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                );
              },
            ),
          ),

          // Top gradient overlay
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Bottom gradient overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.black.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Story progress bar
          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            left: 16,
            right: 16,
            child: Container(
              height: 3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(1.5),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.7, // 70% progress
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFB968C7), // Purple/pink
                        Color(0xFF6B73FF), // Blue
                        Color(0xFF37ACE2), // Light blue
                      ],
                      stops: [0.0, 0.5, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(1.5),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFB968C7).withOpacity(0.4),
                        blurRadius: 6,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Top user info and close button
          Positioned(
            top: MediaQuery.of(context).padding.top + 20,
            left: 16,
            right: 16,
            child: Row(
              children: [
                // User avatar
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(widget.userImage),
                  backgroundColor: Colors.grey[600],
                ),
                const SizedBox(width: 12),

                // Username
                Expanded(
                  child: Text(
                    widget.userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),

                // Close button
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 28, // Made bigger than previous 24px
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom heart button
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 30,
            right: 20,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isLiked = !isLiked;
                });

                // Show feedback
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(isLiked ? 'Story liked!' : 'Story unliked!'),
                    duration: const Duration(seconds: 1),
                    backgroundColor: isLiked ? Colors.purple : Colors.grey,
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                child: isLiked
                    ? CustomPaint(
                        size: const Size(28, 28),
                        painter: GradientHeartPainter(),
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 28,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
