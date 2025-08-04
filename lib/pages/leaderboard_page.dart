import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> leaderboard = [
      {"name": "Aarav", "amount": 10000},
      {"name": "Divyanshi", "amount": 8000},
      {"name": "Kriti", "amount": 6000},
      {"name": "Rahul", "amount": 4500},
      {"name": "Simran", "amount": 3000},
    ];

    final List<IconData> medalIcons = [
      Icons.emoji_events, // Gold
      Icons.emoji_events, // Silver
      Icons.emoji_events, // Bronze
    ];

    final List<Color> medalColors = [
      Colors.amber.shade700,
      Colors.grey,
      Colors.brown,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("🏆 Leaderboard"),
        centerTitle: true,
        backgroundColor: Color(0xFF6C7C9A),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: leaderboard.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            final person = leaderboard[index];

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: ListTile(
                leading: index < 3
                    ? CircleAvatar(
                  backgroundColor: medalColors[index],
                  child: Icon(medalIcons[index], color: Colors.white),
                )
                    : CircleAvatar(
                  backgroundColor: Colors.grey.shade300,
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  person["name"],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text("Rank #${index + 1}"),
                trailing: Text(
                  "₹${person["amount"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
