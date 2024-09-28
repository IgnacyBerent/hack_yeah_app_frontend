import 'package:hack_yeah_app_frontend/models/project.dart';

Project projectMock = Project(
  title: "Neighborhood Playground Renovation",
  photo: "https://example.com/images/playground_renovation.jpg",
  category: "Sports and Recreation",
  abstract:
      "Renovating the old playground with new equipment and safety features.",
  detailedDesc:
      "The current playground is outdated and in need of new equipment. This project involves replacing old slides, swings, and adding new safety features such as soft ground mats to ensure children can play safely. We also plan to add a small section for younger children and a shaded seating area for parents.",
  location: "Elm Street Park, Neighborhood B",
  coordinates: "51.5074, -0.1278",
  isVerified: false,
  statusOfProject: "project in progres",
  dateAdded: DateTime.parse("2024-07-01"),
  dateEnded: DateTime.parse("2024-12-01"),
  cost: 15000,
  gatheredMoney: 8500,
  fundedMoney: 12000,
  id: 2,
  votes: 42,
);
