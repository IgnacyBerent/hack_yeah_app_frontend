class Project {
  String id;
  String title;
  String photo;
  String category;
  String abstract;
  String detailedDesc;
  String location;
  String coordinates;
  bool isVerified;
  String statusOfProject;
  String dateAdded;
  String dateEnded;
  int cost;
  String userName;
  String userId;
  int gatheredMoney;
  int fundedMoney;
  int projectId;
  int votes;

  Project({
    required this.id,
    required this.title,
    required this.photo,
    required this.category,
    required this.abstract,
    required this.detailedDesc,
    required this.location,
    required this.coordinates,
    required this.isVerified,
    required this.statusOfProject,
    required this.dateAdded,
    required this.dateEnded,
    required this.cost,
    required this.userName,
    required this.userId,
    required this.gatheredMoney,
    required this.fundedMoney,
    required this.projectId,
    this.votes = 0,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['_id'],
      title: json['title'],
      photo: json['photo'],
      category: json['category'],
      abstract: json['abstract'],
      detailedDesc: json['detailed_desc'],
      location: json['location'],
      coordinates: json['coordinates'],
      isVerified: json['is_verified'],
      statusOfProject: json['status_of_project'],
      dateAdded: json['date_added'],
      dateEnded: json['date_ended'],
      cost: json['cost'],
      userName: json['user_name'],
      userId: json['user_id'],
      gatheredMoney: json['gathered_money'],
      fundedMoney: json['funded_money'],
      projectId: json['ID'],
      votes: 0,
    );
  }
}
