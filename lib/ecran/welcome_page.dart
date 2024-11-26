import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iapp/ecran/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 10),
              _buildSearchBar(),
              const SizedBox(height: 10),
              _buildCategoryRow(context),
              const SizedBox(height: 10),
              _buildPromoBanner(),
              const SizedBox(height: 10),
              _buildBadgesSection(),
              const SizedBox(height: 15),
              _buildProductRow(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.location_on, color: Color(0xFF3FCA75), size: 40),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Express delivery",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontFamily: 'Onest',
                    ),
                  ),
                  Text(
                    "Leipzig Street, 21",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Onest',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.notifications_none, size: 40),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search_rounded, color: Colors.black),
          hintText: "Search",
          filled: true,
          suffixIcon: const Icon(Icons.qr_code_scanner, color: Colors.black),
          fillColor: const Color(0XFFF5F5F5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryRow(BuildContext context) {
    List<Map<String, String>> categories = [
      {"name": "Home", "image": "asset/img/chaises.jpg"},
      {"name": "Clothes", "image": "asset/img/clothe.jpg"},
      {"name": "Electronics", "image": "asset/img/electronics.jpg"},
      {"name": "Offices", "image": "asset/img/offices.jpg"},
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(9.0),
      child: Row(
        children: categories.map((category) {
          return _buildCategoryCard(
            context: context,
            name: category['name']!,
            image: category['image']!,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required String name,
    required String image,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
        child: Column(
          children: [
            Container(
              height: 160,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Onest',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFF011D12),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Down payment 0%",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'Onest',
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Action from 1 - 30 April",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontFamily: 'Onest',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "LokkeStore",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Onest',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _buildBadge("For you", isActive: true),
              const SizedBox(width: 10),
              _buildBadge("Prices of the day", icon: Icons.percent_rounded),
            ],
          ),
          const Row(
            children: [
              Text(
                "View all",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Onest',
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded, size: 16),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String text, {bool isActive = false, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (icon != null)
            Icon(icon, size: 16, color: isActive ? Colors.white : Colors.green),
          if (icon != null) const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductRow() {
    List<Map<String, String>> products = [
      {"image": "asset/img/glass.jpg", "name": "Glass, light blue\n4€"},
      {"image": "asset/img/swivel chair.jpg", "name": "Swivel Chair\n120€"}
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: products.map((product) {
          return _buildProductCard(
            image: product['image']!,
            name: product['name']!,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductCard({required String image, required String name}) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height: 300,
        width: 190,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black12,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
                const Positioned(
                  top: 5,
                  right: 5,
                  child: Icon(Icons.favorite_border, color: Colors.black),
                ),
                const Positioned(
                  bottom: 5,
                  right: 5,
                  child:
                      Icon(Icons.keyboard_control_sharp, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Onest',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      color: Colors.white,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
          gap: 8,
          activeColor: Color(0xFF000000),
          color: Color(0x89656161),
          padding: EdgeInsets.all(12),
          tabs: [
            GButton(
              icon: Icons.home_sharp,
              iconSize: 35,
            ),
            GButton(
              icon: Icons.account_balance_wallet_outlined,
              iconSize: 35,
            ),
            GButton(
              icon: Icons.card_travel_sharp,
              iconSize: 35,
            ),
            GButton(
              icon: Icons.favorite_outline,
              iconSize: 35,
            ),
            GButton(
              icon: Icons.settings_outlined,
              iconSize: 35,
            ),
          ],
        ),
      ),
    );
  }
}
