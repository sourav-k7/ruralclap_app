class Job {
  int? id;
  String? title;
  String? type;
  String? description;
  String? company;
  String? location;
  int? duration;
  int? pay;
  String? requiredSkills;
  String? status;
  int? employer;
  int? serviceProvider;
  int? category;

  Job(
      {this.id,
      this.title,
      this.type,
      this.description,
      this.company,
      this.location,
      this.duration,
      this.pay,
      this.requiredSkills,
      this.status,
      this.employer,
      this.serviceProvider,
      this.category});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    type = json['type'];
    description = json['description'];
    company = json['company'];
    location = json['location'];
    duration = json['duration'];
    pay = json['pay'];
    requiredSkills = json['required_skills'];
    status = json['status'];
    employer = json['employer'];
    serviceProvider = json['service_provider'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['type'] = type;
    data['description'] = description;
    data['company'] = company;
    data['location'] = location;
    data['duration'] = duration;
    data['pay'] = pay;
    data['required_skills'] = requiredSkills;
    data['status'] = status;
    data['employer'] = employer;
    data['service_provider'] = serviceProvider;
    data['category'] = category;
    return data;
  }
}
