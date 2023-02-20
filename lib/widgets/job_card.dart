import 'package:flutter/material.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            debugPrint('Card tapped.');
          },
          child:  Hero(
            tag: 'ListTile-Hero',
            // Wrap the ListTile in a Material widget so the ListTile has someplace
            // to draw the animated colors during the hero transition.
            child: Material(
              child: ListTile(
                leading: Icon(Icons.business, size:45),
                title: Text('Position'),
                subtitle:
                Text('Company \t rating \nLocation'),
                isThreeLine: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<Widget>(builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          leading: IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.black),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          title: Text(
                            "Jobs",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Roboto',
                            ),
                          ),
                          centerTitle: false,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                        ),
                        body: Center(
                          child: Hero(
                            tag: 'ListTile-Hero',
                            child: Material(
                              child: ListTile(
                                title: const Text('Job information'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}