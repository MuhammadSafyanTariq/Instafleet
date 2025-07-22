import 'package:flutter/material.dart';

class SendIconButton extends StatefulWidget {
  final VoidCallback onTap;
  final double iconSize;
  final List<Color> glowColors;
  final double buttonSize;

  const SendIconButton({
    super.key,
    required this.onTap,
    this.iconSize = 20.0,
    this.glowColors = const [Color(0xFFB968C7), Color(0xFF6B73FF)],
    this.buttonSize = 40.0,
  });

  @override
  State<SendIconButton> createState() => _SendIconButtonState();
}

class _SendIconButtonState extends State<SendIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _animationController.reverse();
    widget.onTap();
  }

  void _handleTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              width: widget.buttonSize,
              height: widget.buttonSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: widget.glowColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.glowColors[0].withOpacity(0.4),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                  BoxShadow(
                    color: widget.glowColors[1].withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Container(
                margin: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Color(0xFF1A1A1A), // Dark gray center
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.send,
                    size: widget.iconSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
