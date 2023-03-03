class Job {
  int? id;
  String? title;
  String? description;
  int? pay;
  String? requiredSkills;
  String? status;
  int? employer;
  int? serviceProvider;
  int? category;

  Job(
      {this.id,
      this.title,
      this.description,
      this.pay,
      this.requiredSkills,
      this.status,
      this.employer,
      this.serviceProvider,
      this.category});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
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
    data['description'] = description;
    data['pay'] = pay;
    data['required_skills'] = requiredSkills;
    data['status'] = status;
    data['employer'] = employer;
    data['service_provider'] = serviceProvider;
    data['category'] = category;
    return data;
  }
}
