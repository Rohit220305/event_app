import 'package:flutter/material.dart';
import '../../models/club_model.dart';
import '../../widgets/club_card.dart';

class RecommendedClubSection extends StatelessWidget {
  const RecommendedClubSection({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy club data
    final clubs = [
      const Club(name: 'ISTE', college: 'JJMCOE'),
      const Club(name: 'SORT', college: 'JJMCOE'),
      const Club(name: 'Media Club', college: 'JJMCOE'),
      const Club(name: 'NSS', college: 'JJMCOE'),
      const Club(name: 'GDG', college: 'JJMCOE'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   'Recommended Clubs',
        //   style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        // ),
        const SizedBox(height: 12),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: clubs.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              return ClubCard(club: clubs[index]);
            },
          ),
        ),
      ],
    );
  }
}

