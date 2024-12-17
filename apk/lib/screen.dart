import 'package:apk/animatedskillcard.dart';
import 'package:apk/projectcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioScreen extends StatefulWidget {
  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String? text = "raunakdubey681@gmail.com";
  final List<ProjectData> projects = [
    ProjectData(
      title: "GO COLORS CLONE",
      description: "With Backend",
      url: "https://github.com/Lucifer-Aspire-A315/myapp.git",
      
    ),
    ProjectData(
      title: "UI Design",
      description: "UI Case Study",
      url: "https://github.com/raunak581/Testomkar.git",
    ),
    ProjectData(
      title: "Portfolio App",
      description: "Built with Flutter",
      url: "https://github.com/raunak581/Portfolio.git",
    ),
  ];

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
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white12,
                  child: Icon(Icons.apps, color: Colors.redAccent),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavItem(title: "ABOUT", isSelected: true),
                    SizedBox(width: 20),
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }

  // Recent Work Section
  Widget _buildRecentWorkSection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          colors: [Colors.black, const Color(0xFF1C1C1C)], // Subtle gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Title
              const Text(
                "• Recent Work",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              // Recent Work Items
              _buildWorkItem(
                "App Developer",
                "2024 - Present",
                "Sun Technologies Pvt Ltd",
                Colors.redAccent,
              ),
              const Divider(color: Colors.white24, thickness: 1),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWorkItem(
      String title, String duration, String company, Color color) {
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
      childAspectRatio: 3 / 2,
      children: [
        AnimatedSkillCard(
          title: "Product design",
          imageUrl:
              "https://images.unsplash.com/photo-1507238691740-187a5b1d37b8?q=80&w=1655&auto=format&fit=crop",
        ),
        AnimatedSkillCard(
          title: "User Experience",
          imageUrl:
              "https://plus.unsplash.com/premium_photo-1720287601300-cf423c3d6760?q=80&w=1740&auto=format&fit=crop",
        ),
      ],
    );
  }

  Widget _buildSkillCard(String title, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Colors.black.withOpacity(0.4), Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          // Title Text
          Center(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Project Highlight Section
  Widget _buildProjectHighlight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: projects.map((project) {
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1C1C),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 6,
                spreadRadius: 1,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: AnimatedProjectCard(
            title: project.title,
            description: project.description,
            url: project.url,
          ),
        );
      }).toList(),
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
