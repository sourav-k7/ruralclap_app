import 'package:ruralclap_app/models/user.dart';

class Job {
  int? id;
  String? title;
  String? description;
  String? location;
  int? pay;
  String? requiredSkills;
  String? status;
  int? employer;
  User? serviceProvider;
  String? category;

  Job(
      {this.id,
      this.title,
      this.description,
      this.pay,
      this.requiredSkills,
      this.status,
      this.employer,
      this.serviceProvider,
      this.category,
      this.location});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    pay = json['pay'];
    requiredSkills = json['required_skills'];
    status = json['status'];
    employer = json['employer'];
    if (json['service_provider'] != null) {
      serviceProvider = User.fromJson(json['service_provider']);
    }
    category = json['category'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['pay'] = pay;
    data['required_skills'] = requiredSkills;
    data['status'] = status;
    data['employer'] = employer;
    // data['service_provider'] = serviceProvider;
    data['category'] = category;
    data['location'] = location;
    return data;
  }
}
