class User {
  int? id;
  String? name;
  String? description;
  String? skills;
  String? email;
  int? phone;
  int? rating;
  String? location;
  int? age;
  String? language;
  String? gender;
  int? expectedPayment;
  bool? isEmployer;

  User({
    this.id,
    this.name,
    this.description,
    this.skills,
    this.email,
    this.phone,
    this.rating,
    this.location,
    this.age,
    this.language,
    this.gender,
    this.expectedPayment,
    this.isEmployer,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    skills = json['skills'];
    email = json['email'];
    phone = json['phone'];
    rating = json['rating'];
    location = json['location'];
    age = json['age'];
    language = json['language'];
    gender = json['gender'];
    expectedPayment = json['expectedPayment'];
    isEmployer = json['isEmployer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['skills'] = skills;
    data['phone'] = phone;
    data['email'] = email;
    data['rating'] = rating;
    data['location'] = location;
    data['age'] = age;
    data['language'] = language;
    data['gender'] = gender;
    data['expectedPayment'] = expectedPayment;
    data['isEmployer'] = isEmployer;
    return data;
  }
}
