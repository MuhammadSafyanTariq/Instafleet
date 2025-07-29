import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      height: 65,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Custom Paint for Curve with dark background
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 65),
            painter: ModernBottomNavPainter(),
          ),
          // Navigation Items
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Left side - Home and Explore
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNavItem(0, 'assets/icons/home.png', 'Home', true),
                        _buildNavItem(
                            1, 'assets/icons/explore.svg', 'Explore', false),
                      ],
                    ),
                  ),
                  // Center space for the FAB
                  const SizedBox(width: 50),
                  // Right side - Messages and Profile
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildNavItem(
                            2, 'assets/icons/chat.png', 'Messages', true),
                        _buildNavItem(
                            3, 'assets/icons/profile.svg', 'Profile', false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Center Button with white circle background
          Positioned(
            top: 10,
            left: MediaQuery.of(context).size.width / 2 - 24,
            child: GestureDetector(
              onTapDown: (_) => _fabAnimationController.forward(),
              onTapUp: (_) => _fabAnimationController.reverse(),
              onTapCancel: () => _fabAnimationController.reverse(),
              onTap: () {
                Navigator.of(context).pushNamed('/contest');
              },
              child: AnimatedBuilder(
                animation: _fabScaleAnimation,
                builder: (context, child) {
                  final isGroupsActive = widget.selectedIndex == -1;
                  return Transform.scale(
                    scale: _fabScaleAnimation.value,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white.withOpacity(0.3),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(0.15),
                              width: 0.8,
                            ),
                          ),
                          child: Center(
                            child: isGroupsActive
                                ? ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        colors: [
                                          Color(0xFFEC008C),
                                          Color(0xFF00B5E2)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ).createShader(bounds);
                                    },
                                    child: SvgPicture.asset(
                                      'assets/icons/contest.svg',
                                      width: 18,
                                      height: 18,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  )
                                : SvgPicture.asset(
                                    'assets/icons/contest.svg',
                                    width: 18,
                                    height: 18,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                          ),
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
    final isSelected =
        widget.selectedIndex == index && widget.selectedIndex != -1;
    final isMaterialIcon = iconPath == 'chat';

    return GestureDetector(
      onTap: () {
        widget.onTap(index);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: AnimatedScale(
            scale: isSelected ? 1.1 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: isSelected
                ? ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [Color(0xFFEC008C), Color(0xFF00B5E2)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds);
                    },
                    child: isMaterialIcon
                        ? const Icon(
                            Icons.chat_bubble_outline,
                            size: 24,
                            color: Colors.white,
                          )
                        : isPng
                            ? Image.asset(
                                iconPath,
                                height: 24,
                                width: 24,
                                fit: BoxFit.contain,
                              )
                            : SvgPicture.asset(
                                iconPath,
                                height: 24,
                                width: 24,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                  )
                : isMaterialIcon
                    ? Icon(
                        Icons.chat_bubble_outline,
                        size: 24,
                        color: Colors.white.withOpacity(0.7),
                      )
                    : isPng
                        ? Image.asset(
                            iconPath,
                            height: 24,
                            width: 24,
                            fit: BoxFit.contain,
                          )
                        : SvgPicture.asset(
                            iconPath,
                            height: 24,
                            width: 24,
                            colorFilter: ColorFilter.mode(
                              Colors.white.withOpacity(0.7),
                              BlendMode.srcIn,
                            ),
                          ),
          ),
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

    // Create a simple rectangular background
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
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
