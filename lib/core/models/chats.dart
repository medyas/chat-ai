import 'package:equatable/equatable.dart';

class Chats extends Equatable {
  final List<ThreadList> threadList;

  const Chats({
    required this.threadList,
  });

  factory Chats.fromJson(Map<String, dynamic> json) => Chats(
        threadList: List<ThreadList>.from(
          json["thread_list"].map(
            (x) => ThreadList.fromJson(x),
          ),
        ).reversed.toList(),
      );

  Map<String, dynamic> toJson() => {
        "thread_list": List<dynamic>.from(threadList.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [threadList];
}

class ThreadList extends Equatable {
  final String id;
  final String name;

  const ThreadList({
    required this.id,
    required this.name,
  });

  factory ThreadList.fromJson(Map<String, dynamic> json) => ThreadList(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  List<Object> get props => [id, name];
}
