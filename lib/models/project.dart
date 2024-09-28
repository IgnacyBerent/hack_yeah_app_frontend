class Project {
  String title;
  String photo;
  String category;
  String abstract;
  String detailedDesc;
  String location;
  String coordinates;
  bool isVerified;
  String statusOfProject;
  DateTime dateAdded;
  DateTime dateEnded;
  int cost;
  int gatheredMoney;
  int fundedMoney;
  int id;
  int votes;

  Project({
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
    required this.gatheredMoney,
    required this.fundedMoney,
    required this.id,
    required this.votes,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'],
      photo: json['photo'],
      category: json['category'],
      abstract: json['abstract'],
      detailedDesc: json['detailed_desc'],
      location: json['location'],
      coordinates: json['coordinates'],
      isVerified: json['is_verified'],
      statusOfProject: json['status_of_project'],
      dateAdded: DateTime.parse(json['date_added']),
      dateEnded: DateTime.parse(json['date_ended']),
      cost: json['cost'],
      gatheredMoney: json['gathered_money'],
      fundedMoney: json['funded_money'],
      id: json['ID'],
      votes: json['votes'],
    );
  }
}
