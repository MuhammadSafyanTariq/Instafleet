import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHeartIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double iconSize;
  final bool selected;

  const CustomHeartIconButton({
    super.key,
    this.onTap,
    this.iconSize = 30.0,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: iconSize,
        height: iconSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Main heart icon with gradient and outline
            _buildHeartIcon(),

            // Bottom-right arrow overlay
            if (selected) _buildArrowOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeartIcon() {
    return Container(
      width: iconSize * 0.8, // 24px for 30px container
      height: iconSize * 0.8,
      decoration: BoxDecoration(
        // Subtle drop shadow behind the icon
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // White outline layer (slightly larger)
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: _buildHeartShape(iconSize * 0.8 + 2), // +2px for outline
          ),

          // Gradient heart fill
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFF69B4), // Pink
                  Color(0xFF6B73FF), // Blue/Purple
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              shape: BoxShape.circle,
            ),
            child: _buildHeartShape(iconSize * 0.8),
          ),
        ],
      ),
    );
  }

  Widget _buildHeartShape(double size) {
    // Using custom heart shape or SVG
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: HeartPainter(),
      ),
    );
  }

  Widget _buildArrowOverlay() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        width: iconSize * 0.4, // 12px for 30px container
        height: iconSize * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(
          Icons.keyboard_arrow_up,
          color: Colors.black87,
          size: iconSize * 0.25, // 7.5px for 30px container
        ),
      ),
    );
  }
}

// Custom heart shape painter
class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;

    final path = Path();

    // Create heart shape path
    final width = size.width;
    final height = size.height;

    // Start from bottom point
    path.moveTo(width * 0.5, height * 0.9);

    // Left curve
    path.cubicTo(
      width * 0.1,
      height * 0.6,
      width * 0.1,
      height * 0.3,
      width * 0.3,
      height * 0.3,
    );

    // Top left curve
    path.cubicTo(
      width * 0.4,
      height * 0.1,
      width * 0.6,
      height * 0.1,
      width * 0.7,
      height * 0.3,
    );

    // Top right curve
    path.cubicTo(
      width * 0.9,
      height * 0.3,
      width * 0.9,
      height * 0.6,
      width * 0.5,
      height * 0.9,
    );

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Alternative implementation using SVG (if you prefer)
class CustomHeartIconButtonSVG extends StatelessWidget {
  final VoidCallback? onTap;
  final double iconSize;
  final bool selected;
  final String? customHeartAsset; // Path to custom heart SVG/PNG

  const CustomHeartIconButtonSVG({
    super.key,
    this.onTap,
    this.iconSize = 30.0,
    this.selected = false,
    this.customHeartAsset,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: iconSize,
        height: iconSize,
        decoration: BoxDecoration(
          // Subtle drop shadow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // White outline layer
            if (customHeartAsset != null)
              SvgPicture.asset(
                customHeartAsset!,
                width: iconSize * 0.85,
                height: iconSize * 0.85,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              )
            else
              Icon(
                Icons.favorite,
                size: iconSize * 0.85,
                color: Colors.white,
              ),

            // Gradient heart fill
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  Color(0xFFFF69B4), // Pink
                  Color(0xFF6B73FF), // Blue/Purple
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds),
              child: customHeartAsset != null
                  ? SvgPicture.asset(
                      customHeartAsset!,
                      width: iconSize * 0.8,
                      height: iconSize * 0.8,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    )
                  : Icon(
                      Icons.favorite,
                      size: iconSize * 0.8,
                      color: Colors.white,
                    ),
            ),

            // Bottom-right arrow overlay
            if (selected)
              Positioned(
                right: 2,
                bottom: 2,
                child: Container(
                  width: iconSize * 0.35,
                  height: iconSize * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_up,
                    color: Colors.black87,
                    size: iconSize * 0.2,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Usage example widget
class HeartIconButtonExample extends StatefulWidget {
  const HeartIconButtonExample({super.key});

  @override
  State<HeartIconButtonExample> createState() => _HeartIconButtonExampleState();
}

class _HeartIconButtonExampleState extends State<HeartIconButtonExample> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Custom painted version
            CustomHeartIconButton(
              iconSize: 30,
              selected: _isSelected,
              onTap: () {
                setState(() {
                  _isSelected = !_isSelected;
                });
              },
            ),

            const SizedBox(height: 40),

            // SVG version (with your custom asset)
            CustomHeartIconButtonSVG(
              iconSize: 30,
              selected: _isSelected,
              customHeartAsset:
                  'assets/icons/votingfill.svg', // Your custom heart
              onTap: () {
                setState(() {
                  _isSelected = !_isSelected;
                });
              },
            ),

            const SizedBox(height: 20),

            Text(
              _isSelected ? 'Selected' : 'Not Selected',
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
