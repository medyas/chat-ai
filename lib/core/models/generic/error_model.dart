class ErrorModel {
  ErrorModel({
    required this.status,
    required this.timestamp,
    required this.error,
    required this.code,
  });
  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        status: json["status"] as String,
        timestamp: DateTime.parse(json["timestamp"] as String),
        error: json["error"] as String,
        code: json["code"] as int,
      );
  final String status;
  final DateTime timestamp;
  final String error;
  final int code;
  Map<String, dynamic> toJson() => {
        "status": status,
        "timestamp": timestamp.toIso8601String(),
        "error": error,
        "code": code,
      };
}
