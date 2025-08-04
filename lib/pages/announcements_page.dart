import 'package:flutter/material.dart';

class AnnouncementsPage extends StatelessWidget {
  const AnnouncementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> announcements = [
      {
        "title": "📣 Campaign 'Water For All' starts next week!",
        "date": "01 Aug 2025",
      },
      {
        "title": "📢 Submit your weekly report by Friday.",
        "date": "30 July 2025",
      },
      {
        "title": "🎉 New reward tier unlocked: Gold Star!",
        "date": "28 July 2025",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Announcements",
        style: TextStyle(
          color: Colors.white,
          fontFamily: "Inter",
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        backgroundColor: Color(0xFF6C7C9A),
        elevation: 3,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: announcements.length,
        itemBuilder: (context, index) {
          final item = announcements[index];

          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.campaign, color: Color(0xFF322D31)),
              title: Text(
                item["title"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                "🗓️ ${item["date"]}",
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
              onTap: () {
                // You can show a dialog or expanded detail here
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Announcement"),
                    content: Text(item["title"]!),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text("Close"),
                      )
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
