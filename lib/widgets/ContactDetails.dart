import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Email Address: utkr8402@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Contact Number: 7004114774',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Alternate Number: 9970184108',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.15,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
