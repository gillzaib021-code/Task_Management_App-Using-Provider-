class TaskModel {
  String title;
  bool isdone;
  TaskModel({required this.title, this.isdone = false});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isdone': isdone,
    };
  }


  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'],
      isdone: map['isdone'],
    );
  }
}