import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "What do you mean?",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
    ),
    ChatMessage(
      text: "I think the idea that things are changing isnt good",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 8)),
    ),
    ChatMessage(
      text: "What do you mean?",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    ChatMessage(
      text: "I think the idea that things are changing isnt good",
      isMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
    ),
    ChatMessage(
      text: "What do you mean?",
      isMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 1)),
    ),
    ChatMessage(
      text: "I think the idea that things are changing isnt good",
      isMe: true,
      timestamp: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: _buildMessagesList(),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF2A2A2A),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?w=200&h=200&fit=crop',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          const Text(
            'Chanbon',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final reversedIndex = _messages.length - 1 - index;
        return _buildMessageBubble(_messages[reversedIndex]);
      },
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (message.isMe) const Spacer(flex: 2),
          Flexible(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: !message.isMe
                    ? const LinearGradient(
                        colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                color: !message.isMe ? null : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: message.isMe
                      ? const Radius.circular(20)
                      : const Radius.circular(4),
                  bottomRight: message.isMe
                      ? const Radius.circular(4)
                      : const Radius.circular(20),
                ),
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: message.isMe ? Colors.black : Colors.white,
                  fontSize: 16,
                  height: 1.3,
                ),
              ),
            ),
          ),
          if (!message.isMe) const Spacer(flex: 2),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF121212),
      child: Container(
        width: 354,
        height: 69,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey[800]!,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration: const InputDecoration(
                  hintText: 'Type here...',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'Space Grotesk',
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
                onSubmitted: _sendMessage,
              ),
            ),
            GestureDetector(
              onTap: () => _sendMessage(_messageController.text),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  blendMode: BlendMode.srcIn,
                  child: Transform.scale(
                    scaleY: 1.3, // Make the tip longer by stretching vertically
                    child: const Icon(
                      Icons.arrow_upward,
                      color: Colors.white,
                      size: 20,
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

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        ChatMessage(
          text: text.trim(),
          isMe: true,
          timestamp: DateTime.now(),
        ),
      );
    });

    _messageController.clear();
  }
}

class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isMe,
    required this.timestamp,
  });
}
