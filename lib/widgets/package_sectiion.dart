import 'package:flutter/material.dart';

class OfferingsSection extends StatelessWidget {
  const OfferingsSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Offerings',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _OfferingCard(
              title: 'Offering 1',
              description: 'Description for offering 1.',
              icon: Icons.star,
            ),
            _OfferingCard(
              title: 'Offering 2',
              description: 'Description for offering 2.',
              icon: Icons.favorite,
            ),
            _OfferingCard(
              title: 'Offering 3',
              description: 'Description for offering 3.',
              icon: Icons.lightbulb,
            ),
          ],
        ),
      ],
    );
  }
}

class _OfferingCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _OfferingCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 200,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, size: 48),
            SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            SizedBox(height: 8),
            Text(description, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
