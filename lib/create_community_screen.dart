import 'package:flutter/material.dart';

// ═══════════════════════════════════════════════════════════
// CREATE COMMUNITY SCREEN - Main Screen Widget
// ═══════════════════════════════════════════════════════════
class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends State<CreateCommunityScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          _buildHeader(),
          Stack(
            clipBehavior: Clip.none,
            children: [
              _buildImageSection(),
              Positioned(
                top: 220, // Moved lower from 209 to 220
                left: 20,
                child: _buildAvatarSection(),
              ),
              Positioned(
                top: 259, // 249 + 10 = 259 (image height plus 10px offset)
                right:
                    30, // Changed from 40 to 30 to align with new text field padding
                child: _buildEditPhotoButton(),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 80),
                        _buildFormSection(),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
                _buildCreateButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // HEADER WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildHeader() {
    return SafeArea(
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
                  color: Colors.grey[800],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              'Create Community',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // IMAGE SECTION WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildImageSection() {
    return Container(
      height: 249,
      width: 394,
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
              Colors.black.withOpacity(0.7),
            ],
          ),
        ),
        child: const SizedBox
            .shrink(), // Remove the Stack since button is now at higher level
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(14), // Slightly smaller to account for border
        child: Image.network(
          'https://images.unsplash.com/photo-1518895949257-7621c3c786d7?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80',
          fit: BoxFit.cover,
          width: 76, // Account for border
          height: 76,
        ),
      ),
    );
  }

  Widget _buildEditPhotoButton() {
    return Container(
      width: 155, // Changed from 140 to 155
      height: 46,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFB968C7), // Purple/Pink
            Color(0xFF6B73FF) // Blue
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text(
          'Edit photo or avatar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // FORM SECTION WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildFormSection() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10), // Reduced from 40 to 30 to increase text field width
        child: Column(
          children: [
            _buildTextField(
              controller: _nameController,
              hintText: 'Community Name',
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: _descriptionController,
              hintText: 'Community Description',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required int maxLines,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey[700]!,
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        keyboardType:
            maxLines > 1 ? TextInputType.multiline : TextInputType.text,
        textInputAction:
            maxLines > 1 ? TextInputAction.newline : TextInputAction.done,
        autocorrect: true,
        enableSuggestions: true,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
            fontSize: 16,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // CREATE BUTTON WIDGET
  // ═══════════════════════════════════════════════════════════
  Widget _buildCreateButton() {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: 328,
          height: 58,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFB968C7), // Purple/Pink
                Color(0xFF6B73FF) // Blue
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
              onTap: _handleCreateCommunity,
              child: const Center(
                child: Text(
                  'Create Community',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ═══════════════════════════════════════════════════════════
  // EVENT HANDLERS
  // ═══════════════════════════════════════════════════════════
  void _handleCreateCommunity() {
    // Handle create community logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Community created successfully!'),
        backgroundColor: Color(0xFF2A2A2A),
      ),
    );

    // Navigate back after creation
    Navigator.pop(context);
  }
}
