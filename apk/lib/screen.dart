import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String? text = "raunakdubey681@gmail.com";
  

    Future<void> _launchUrl(Uri _url) async {
    if (await canLaunchUrl(_url)) {
      await launchUrl(
        _url,
        mode: LaunchMode.platformDefault, // Automatically handles web and mobile
      );
    } else {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        // Custom App Bar
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFF141414), // Dark Background Color
              borderRadius: BorderRadius.circular(50), // Rounded edges
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo Section
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white10,
                  child: Icon(Icons.apps, color: Colors.redAccent),
                ),

                // Navigation Items
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavItem(title: "ABOUT", isSelected: true),
                    // const SizedBox(width: 20),
                    // NavItem(title: "PORTFOLIO"),
                    const SizedBox(width: 20),
                    NavItem(title: "CONTACT"),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Body Content
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Card with Profile Details
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Availability Badge
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.circle,
                                    color: Colors.redAccent, size: 10),
                                SizedBox(width: 5),
                                Text(
                                  "AVAILABLE FOR JOB",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Job Title
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "APP DEVELOPER",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white70),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Profile Image
                        CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOH2aZnIHWjMQj2lQUOWIL2f4Hljgab0ecZQ&s") // Avatar image
                            ),
                        const SizedBox(height: 10),

                        // Name
                        const Text(
                          "I'm Raunak dubey",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),

                        // Description
                        const Text(
                          "I design  products with great experience.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Hire Me Action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Text(
                                "Hire me",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton.icon(
                              onPressed: () {
                                if (text != null) {
                                  Clipboard.setData(
                                    ClipboardData(
                                        text:
                                            text!), // Use the dynamic variable here
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Email Copied: $text')),
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              icon: const Icon(Icons.copy, color: Colors.white),
                              label: const Text(
                                "Copy Email",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 10),
              _buildRecentWorkSection(),
              const SizedBox(height: 20),
              _buildSkillCards(),
              const SizedBox(height: 20),
              _buildProjectHighlight(),
              ],
            ),
          ),
        ));
  }

    // Recent Work Section
  Widget _buildRecentWorkSection() {
    return Card(
      color: const Color(0xFF141414),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "• Recent Work",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildWorkItem("App Developer", "2024 - Present", "Sun Technologies Pvt Ltd", Colors.redAccent),
            // _buildWorkItem("UI/UX designer", "2021 - 2022", "Google", Colors.white),
            // _buildWorkItem("Product designer", "2023 - Present", "Figma", Colors.redAccent),
            // _buildWorkItem("Product designer", "2023 - Present", "Figma", Colors.redAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkItem(String title, String duration, String company, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                duration,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
          Text(
            company,
            style: const TextStyle(color: Colors.white54, fontSize: 14),
          ),
        ],

      ),
    );
  }

  // Skill Cards Section
  Widget _buildSkillCards() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 3,
      children: [
        _buildSkillCard("Product design"),
        _buildSkillCard("User Experience"),
        // _buildSkillCard("NoCode develop"),
      ],
    );
  }

  Widget _buildSkillCard(String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.redAccent.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }

  // Project Highlight Section
  Widget _buildProjectHighlight() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(12),
      ),
      child:  Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "GO COLORS CLONE",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 5),
            Text(
              "With Backend",
              style: TextStyle(fontSize: 14, color: Colors.white54),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Colors.redAccent,
                child: IconButton(
            onPressed: () {
              final Uri _url =
                  Uri.parse("https://github.com/Lucifer-Aspire-A315/myapp.git");
              _launchUrl(_url);
            },
            icon: const Icon(Icons.arrow_outward, color: Colors.white),
          ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class NavItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const NavItem({
    Key? key,
    required this.title,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        color: isSelected ? Colors.redAccent : Colors.white,
        letterSpacing: 1.2,
      ),
    );
  }
}
