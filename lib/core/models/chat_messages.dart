import 'package:equatable/equatable.dart';

class ChatMessages extends Equatable {
  final List<Message> messages;

  const ChatMessages({
    required this.messages,
  });

  factory ChatMessages.fromJson(Map<String, dynamic> json) => ChatMessages(
        messages: List<Message>.from(
          json["messages"].map(
            (x) => Message.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [messages];
}

enum MessageStatus { sending, sent, error }

class Message extends Equatable {
  final String messageId;
  final String messageRole;
  final String messageContent;
  final int messageDate;
  final List<String> imageUrls;
  final MessageStatus status;

  bool get isUser => messageRole == "user";

  const Message({
    required this.messageId,
    required this.messageRole,
    required this.messageContent,
    required this.messageDate,
    required this.imageUrls,
    this.status = MessageStatus.sent,
  });

  factory Message.newMessage(String message, messageId) => Message(
        messageId: messageId,
        messageRole: "user",
        messageContent: message,
        messageDate: DateTime.now().millisecondsSinceEpoch,
        imageUrls: [],
        status: MessageStatus.sending,
      );

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        messageId: json["message_id"] ?? json["id"],
        messageRole: json["message_role"] ?? json["role"],
        messageContent: json["message_content"] ?? json["content"],
        messageDate: json["message_date"] ?? json["date"],
        imageUrls: List<String>.from(json["image_urls"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "message_id": messageId,
        "message_role": messageRole,
        "message_content": messageContent,
        "message_date": messageDate,
        "image_urls": List<dynamic>.from(imageUrls.map((x) => x)),
      };

  @override
  List<Object> get props => [
        messageId,
        messageRole,
        messageContent,
        messageDate,
        imageUrls,
        status,
      ];

  Message copyWith({
    String? messageId,
    String? messageRole,
    String? messageContent,
    int? messageDate,
    List<String>? imageUrls,
    MessageStatus? status,
  }) =>
      Message(
        messageId: messageId ?? this.messageId,
        messageRole: messageRole ?? this.messageRole,
        messageContent: messageContent ?? this.messageContent,
        messageDate: messageDate ?? this.messageDate,
        imageUrls: imageUrls ?? this.imageUrls,
        status: status ?? this.status,
      );
}
