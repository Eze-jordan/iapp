import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iapp/ecran/detail.dart';
import 'package:iapp/ecran/welcome_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Fonction pour construire chaque conteneur
  Widget buildContainer(String text, String imagePath) {
    return Container(
      height: 140,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFF3F3F7),
      ),
      child: Row(
        children: [
          // Texte aligné en haut à gauche
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Onest',
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          // Image alignée au centre à droite
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 100,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_sharp,
                      size: 30,
                    ),
                    color: const Color(0xFF000000),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const WelcomePage(),
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  const Text(
                    'Home goods',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Onest',
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Contenus principaux
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildContainer('Textile', 'asset/img/textile.png'),
                        const SizedBox(width: 10),
                        buildContainer('Dishes', 'asset/img/Dishes.png'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildContainer('Furniture', 'asset/img/Furniture.png'),
                        const SizedBox(width: 10),
                        buildContainer('Light', 'asset/img/Light.png'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildContainer('Decor', 'asset/img/Decor.png'),
                        const SizedBox(width: 10),
                        buildContainer('Plants', 'asset/img/plant.png'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Text('Popular brands',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Onest',
                          fontSize: 20)),
                  SizedBox(
                    width: 100,
                  ),
                  Text(
                    "View all",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 16),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(children: [
                  Container(
                    height: 230,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFCDC9C9),
                    ),
                    child: Stack(
                      children: [
                        // Image qui remplit tout le conteneur
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "asset/img/KOPPARBJORK.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                        ),
                        // Texte centré sur l'image
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'KOPPARBJORK',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Onest',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Detail()),
                      );
                    },
                    child: Container(
                      height: 230,
                      width: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFCDC9C9),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "asset/img/IVAG.jpg",
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'IVARIKEAL',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                fontFamily: 'Onest',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
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
