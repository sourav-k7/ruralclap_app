import 'package:flutter/material.dart';

class CreateJobPage extends StatefulWidget {
  const CreateJobPage({super.key});

  @override
  State<CreateJobPage> createState() => _CreateJobPageState();
}

class _CreateJobPageState extends State<CreateJobPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
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
                TextFormField(),
                const SizedBox(
                  height: 10,
                ),
                const Text('Job Type'),
                TextFormField(),
                const SizedBox(
                  height: 10,
                ),
                const Text('Company'),
                TextFormField(),
                const SizedBox(
                  height: 10,
                ),
                const Text('Location'),
                TextFormField(),
                const SizedBox(
                  height: 10,
                ),
                const Text('Duration'),
                TextFormField(),
                const SizedBox(
                  height: 10,
                ),
                const Text('Total Pay'),
                TextFormField(),
                const SizedBox(
                  height: 10,
                ),
                const Text('Required Skills'),
                TextFormField(),
                const SizedBox(
                  height: 10,
                ),
                const Text('Description'),
                TextFormField(),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
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
