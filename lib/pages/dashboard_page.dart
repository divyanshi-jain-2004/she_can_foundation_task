import 'package:flutter/material.dart';
import 'leaderboard_page.dart';
import 'announcements_page.dart';
import '../widgets/reward_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    const String internName = "Divyanshi Jain";
    const String referralCode = "divyanshi2025";
    const int totalDonations = 5000;
    const int goal = 10000; // fundraising goal

    double progress = totalDonations / goal;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Intern Dashboard",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: "Inter"
        ),),
        backgroundColor: Color(0xFF6C7C9A),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Divyanshi Jain"),
              accountEmail: const Text("intern@fundraise.org"),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpg'), // Use your asset
              ),
              decoration: const BoxDecoration(color: Color(0xFF6C7C9A)),
            ),
            ListTile(
              leading: const Icon(Icons.leaderboard),
              title: const Text("Leaderboard"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LeaderboardPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.announcement),
              title: const Text("Announcements"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AnnouncementsPage()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("👋 Welcome, $internName",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 12),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("🎯 Fundraising Progress",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 10),
                    Text("₹$totalDonations raised out of ₹$goal"),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: progress,
                      color: Color(0xFF322D31),
                      backgroundColor: Colors.grey[300],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildStatCard("📌 Referral Code", referralCode),
                _buildStatCard("💰 Donations", "₹$totalDonations"),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "🎁 Rewards & Unlockables",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                RewardCard(icon: Icons.emoji_events, label: "Bronze"),
                RewardCard(icon: Icons.stars, label: "Silver"),
                RewardCard(icon: Icons.workspace_premium, label: "Gold"),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "📢 Quick Announcements",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            _buildAnnouncementCard(
                "🎉 New Reward Tier Unlocked!",
                "Interns who raise more than ₹7,500 will now unlock the 'Platinum Badge'."),
            const SizedBox(height: 10),
            _buildAnnouncementCard(
                "📣 Referral Boost!",
                "Share your referral code and earn bonus rewards when your referral signs up."),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard(String title, String message) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: const Icon(Icons.campaign, color: Color(0xFF322D31)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message),
      ),
    );
  }
}
