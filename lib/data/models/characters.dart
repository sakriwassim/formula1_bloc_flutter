class Character {
  int? id;
  int? ranking;
  String? fullName;
  String? title;
  String? imageUrl;

  Character({this.id, this.ranking, this.fullName, this.title, this.imageUrl});

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ranking = json['ranking'];
    fullName = json['fullName'];
    title = json['title'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ranking'] = this.ranking;
    data['fullName'] = this.fullName;
    data['title'] = this.title;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
