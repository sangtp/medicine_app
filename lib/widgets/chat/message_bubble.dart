import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String? message;
  final bool? isMe;
  final String? userName;

  const MessageBubble({
    Key? key,
    this.message,
    this.isMe,
    this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              isMe! ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color:
                    isMe! ? Colors.grey[300] : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12),
                  topRight: const Radius.circular(12),
                  bottomLeft: !isMe!
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                  bottomRight: isMe!
                      ? const Radius.circular(0)
                      : const Radius.circular(12),
                ),
              ),
              width: 140,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe! ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    userName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe!
                          ? Colors.black
                          : Theme.of(context).textTheme.headline1!.color,
                    ),
                  ),
                  Text(
                    message!,
                    style: TextStyle(
                      color: isMe!
                          ? Colors.black
                          : Theme.of(context).textTheme.headline1!.color,
                    ),
                    textAlign: isMe! ? TextAlign.end : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
