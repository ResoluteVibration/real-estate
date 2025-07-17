import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            const SizedBox(height: 10),
            _buildSectionTitle("Get started with", "Explore real estate options in top cities"),
            _buildQuickActions(),
            const SizedBox(height: 20),
            _buildSectionTitle("Insights & Utilities", "Go from browsing to buying", showViewAll: true),
            _buildInsightsGrid(),
            const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => _onTabTapped(2),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue[900],
      elevation: 0,
      title: const Text("A New Standard of Living", style: TextStyle(fontSize: 16)),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text("Post property", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search city, locality, projects...",
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle, {bool showViewAll = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 13)),
          ]),
          if (showViewAll)
            TextButton(
              onPressed: () {},
              child: const Text("View All", style: TextStyle(color: Colors.blue)),
            )
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    final List<Map<String, dynamic>> actions = [
      {'icon': Icons.home, 'label': 'Buy'},
      {'icon': Icons.key, 'label': 'Rent'},
      {'icon': Icons.insights, 'label': 'Insights'},
      {'icon': Icons.landscape, 'label': 'Plot / Land'},
      {'icon': Icons.domain, 'label': 'Commercial'},
      {'icon': Icons.group_work, 'label': 'Co-working'},
      {'icon': Icons.shopping_bag, 'label': 'Buy Commercial'},
    ];

    return SizedBox(
      height: 110,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: actions.map((action) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(16),
                splashColor: Colors.blue.withOpacity(0.2),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Icon(action['icon'], color: Colors.blue, size: 28),
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      width: 80,
                      child: Text(
                        action['label'],
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildInsightsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3,
        children: const [
          _InsightCard(title: "Price Trends", subtitle: "Check property rates and prices"),
          _InsightCard(title: "Locality Insights", subtitle: "Know more about different localities"),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.home, color: _selectedIndex == 0 ? Colors.blue : Colors.grey),
            onPressed: () => _onTabTapped(0),
          ),
          IconButton(
            icon: Icon(Icons.play_circle_fill, color: _selectedIndex == 1 ? Colors.blue : Colors.grey),
            onPressed: () => _onTabTapped(1),
          ),
          const SizedBox(width: 48),
          IconButton(
            icon: Icon(Icons.favorite_border, color: _selectedIndex == 3 ? Colors.blue : Colors.grey),
            onPressed: () => _onTabTapped(3),
          ),
          IconButton(
            icon: Icon(Icons.person_outline, color: _selectedIndex == 4 ? Colors.blue : Colors.grey),
            onPressed: () => _onTabTapped(4),
          ),
        ],
      ),
    );
  }
}
class _InsightCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const _InsightCard({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Text(
                subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

