import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ruralclap_app/controllers/user.dart';
import 'package:ruralclap_app/models/job.dart';
import 'package:ruralclap_app/models/user.dart';
import 'package:ruralclap_app/controllers/job.dart';
import '../widgets/errorSnackBar.dart';

class CreateJobPage extends StatefulWidget {
  const CreateJobPage({super.key});

  @override
  State<CreateJobPage> createState() => _CreateJobPageState();
}

class _CreateJobPageState extends State<CreateJobPage> {
  final Job _job = Job();
  final _formKey = GlobalKey<FormState>();
  final _jobController = JobController();
  final _userController = UserController();
  final User _user = User();

  @override
  void initState() {
    super.initState();

    if (_userController.user.id != null) {
      _jobController.job.employer = _userController.user.id;
      _job.employer = _userController.user.id;
    }

    _jobController.job.status = "Hiring";
    _job.status = "Hiring";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
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
                const Text(
                  'Create Job',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text('Job Title'),
                TextFormField(
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
                const Text('Job Type'),
                TextFormField(
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
                const Text('Company'),
                TextFormField(
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
                const Text('Location'),
                TextFormField(
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
                const Text('Duration'),
                TextFormField(
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
                const Text('Total Pay'),
                TextFormField(
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
                const Text('Required Skills'),
                TextFormField(
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
                const Text('Description'),
                TextFormField(
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
                  onPressed: () {
                    print("okayy");
                    print(_user.id);
                    if (_formKey.currentState!.validate()) {
                      final job = Job();
                      print(_userController.user.id);
                      print(_jobController.job.employer);
                      print("okay");
                      print(_job.employer);
                      _jobController.submitJob(jobData: _job);
                    } else {
                      errorSnackBar(content: 'Please enter valid data');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Post Job'),
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
