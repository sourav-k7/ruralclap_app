import 'package:flutter/material.dart';

class ServiceRequest extends StatefulWidget {
  const ServiceRequest({super.key});

  @override
  State<ServiceRequest> createState() => _CreateServiceRequest();
}

class _CreateServiceRequest extends State<ServiceRequest> {
  final _formKey = GlobalKey<FormState>();
  int counter = 0;
  String? _service_provider_id, _service_title, _service_details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Service Request Page"),
      ),
      body: ListView(children: <Widget>[
        const SizedBox(height: 55),
        const Text(
          textAlign: TextAlign.center,
          'Service Request',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        const SizedBox(height: 20),
        const Text(
          'Provide Information to Service Provide regarding the Job',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 35),
        Container(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                    key: _formKey,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Service Provider ID'),
                      TextFormField(
                        onSaved: (value) => _service_provider_id = value!,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text('Name or Title for Job'),
                      TextFormField(
                        onSaved: (value) => _service_title = value!,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 6,
                          decoration: InputDecoration(
                              hintText: "Enter details here",
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(width: 3, color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              )),
                          onSaved: (value) => _service_details = value!),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState?.save();
                          print("service Provider id: $_service_provider_id, \n Service Title: $_service_title, \n Details: $_service_details \n");
                        },
                        child: const Text("SAVE & PROCEED"),
                      )
                    ])))),
      ]),
    );
  }
}
