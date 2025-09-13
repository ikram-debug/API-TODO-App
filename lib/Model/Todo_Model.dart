
class TodoModel {
  String? title;
  String? discriptaion;
  String? id;

  TodoModel({this.title, this.discriptaion, this.id});

  TodoModel.fromJson(Map<String, dynamic> json) {
    title = json['Title'];
    discriptaion = json['Discriptaion'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Title'] = this.title;
    data['Discriptaion'] = this.discriptaion;
    data['id'] = this.id;
    return data;
  }
}