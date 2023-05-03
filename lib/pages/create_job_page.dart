import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/models/user.dart';
import 'package:ruralclap_app/controllers/job.dart';
import 'package:ruralclap_app/constant/theme_color.dart';

class CreateJobPage extends StatefulWidget {
  const CreateJobPage({super.key});

  @override
  State<CreateJobPage> createState() => _CreateJobPageState();
}

class _CreateJobPageState extends State<CreateJobPage> {
  final Job _job = Job();
  final _formKey = GlobalKey<FormState>();
  final UserController _userController = Get.find<UserController>();
  final _jobController = JobController();

  @override
  void initState() {
    super.initState();

    if (_userController.user.email != null) {
      _job.employer = _userController.user.id;
    }
    _job.status = "Hiring";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(), icon: const Icon(Icons.arrow_back)),
        title: const Text(
          'Create Job',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.lightBackgroundColor,
                          width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.primaryColor, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    labelText: "Job Title",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: ColorConstant.textPrimaryBlack,
                    ),
                    fillColor: ColorConstant.lightBackgroundColor,
                    focusColor: ColorConstant.lightBackgroundColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _job.title = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a job title';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.lightBackgroundColor,
                          width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.primaryColor, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    labelText: "Job Type",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: ColorConstant.textPrimaryBlack,
                    ),
                    fillColor: ColorConstant.lightBackgroundColor,
                    focusColor: ColorConstant.lightBackgroundColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _job.type = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a job type';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.lightBackgroundColor,
                          width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.primaryColor, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    labelText: "Company",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: ColorConstant.textPrimaryBlack,
                    ),
                    fillColor: ColorConstant.lightBackgroundColor,
                    focusColor: ColorConstant.lightBackgroundColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _job.company = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a company name';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.lightBackgroundColor,
                          width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.primaryColor, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    labelText: "Location",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: ColorConstant.textPrimaryBlack,
                    ),
                    fillColor: ColorConstant.lightBackgroundColor,
                    focusColor: ColorConstant.lightBackgroundColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _job.location = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter location';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.lightBackgroundColor,
                          width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.primaryColor, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    labelText: "Duration",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: ColorConstant.textPrimaryBlack,
                    ),
                    fillColor: ColorConstant.lightBackgroundColor,
                    focusColor: ColorConstant.lightBackgroundColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _job.duration = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid duration';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.lightBackgroundColor,
                          width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.primaryColor, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    labelText: "Total Pay",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: ColorConstant.textPrimaryBlack,
                    ),
                    fillColor: ColorConstant.lightBackgroundColor,
                    focusColor: ColorConstant.lightBackgroundColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _job.pay = int.parse(value);
                    });
                  },
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid duration';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.lightBackgroundColor,
                          width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.primaryColor, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    labelText: "Required Skills",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: ColorConstant.textPrimaryBlack,
                    ),
                    fillColor: ColorConstant.lightBackgroundColor,
                    focusColor: ColorConstant.lightBackgroundColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _job.requiredSkills = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your skills';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.lightBackgroundColor,
                          width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: ColorConstant.primaryColor, width: 1.5),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: ColorConstant.error, width: 1.5),
                    ),
                    labelText: "Description",
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.2,
                      color: ColorConstant.textPrimaryBlack,
                    ),
                    fillColor: ColorConstant.lightBackgroundColor,
                    focusColor: ColorConstant.lightBackgroundColor,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _job.description = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter valid duration';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // print("okayy");
                    // print(_user.id);
                    if (_formKey.currentState!.validate()) {
                      await _jobController.submitJob(jobData: _job);
                    }
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Create new Job'),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
