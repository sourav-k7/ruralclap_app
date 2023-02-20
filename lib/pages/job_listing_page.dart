import 'package:flutter/material.dart';
import '/widgets/search_bar.dart';
import '/widgets/job_card.dart';
import '/widgets/bottom_navbar.dart';

class JobListing extends StatefulWidget{
  @override
  _JobListingState createState() => _JobListingState();
}

class _JobListingState extends State<JobListing> {
  @override
  Widget build(BuildContext context) {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SearchBar(),
          SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left:16), //apply padding to some sides only
            child: Text(
              "Jobs based on your profile",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          SizedBox(height: 15.0),
          JobCard(),
        ],
      ),
    );
  }
}



