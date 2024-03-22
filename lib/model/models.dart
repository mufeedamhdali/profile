import 'package:flutter/widgets.dart';

class ExperienceModel {
  String? desig;
  String? compName;
  String? duration;
  String? location;
  Widget? points;

  ExperienceModel({this.desig, this.compName, this.duration, this.location, this.points});
}


class WorkModel {
  String? projectTitle;
  String? image;
  String? projectContent;
  String? link;
  String? tech1;
  String? tech2;
  String? tech3;

  WorkModel(
      {this.projectTitle,
        this.image,
        this.projectContent,
        this.link,
        this.tech1,
        this.tech2,
        this.tech3});
}
