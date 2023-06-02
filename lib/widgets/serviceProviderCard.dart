import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

class ServiceProviderCard extends StatelessWidget {
  ServiceProviderCard({
    super.key,
    required this.name,
    required this.jobTitle,
    required this.description,
    required this.rating,
    this.onHire,
  });

  final String name, jobTitle, description;
  final double rating;
  Function()? onHire;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          RandomAvatar(name, height: 50, width: 50),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  jobTitle,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Rating: $rating',
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          onHire != null
              ? ElevatedButton(
                  onPressed: onHire,
                  style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text('Hire me'),
                )
              : const SizedBox()
        ]),
      ),
    );
  }
}
