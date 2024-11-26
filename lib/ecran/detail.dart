import 'package:flutter/material.dart';
import 'package:iapp/ecran/home_page.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Ajout d'un scroll si le contenu est long
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          builder: (context) => const HomePage(),
                        ),
                      );
                    },
                  ),
                  const Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.file_upload_rounded,
                        size: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 450,
                    width: 380,
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
                        const Positioned(
                          bottom: 5,
                          right: 5,
                          child: Icon(
                            Icons.zoom_out_map_sharp,
                            color: Colors.grey,
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_control_sharp,
                  color: Colors.grey,
                  size: 50,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    'GURLI',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Onest'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Row(
                children: [
                  _buildBadge("Selection 97%", isActive: true),
                  const SizedBox(width: 10),
                  _buildBadge("Best product", icon: Icons.percent_rounded),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'A popular solid color cushion cover that can easily be combined with other solid or patterneg cushions ... Read more',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Onest',
                  color: Colors.black,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    '4.9',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'Onest',
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '(332)',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Onest',
                    ),
                  ),
                  SizedBox(width: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                        size: 20,
                      ),
                      Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Section ajoutée pour le prix, la réduction et les boutons
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          fixedSize: const Size(195, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Buy now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: 'Onest',
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          fixedSize: const Size(195, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          // Action pour "Book Now"
                        },
                        child: const Text(
                          'Add to cart',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              fontFamily: 'Onest'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text, {bool isActive = false, IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
      decoration: BoxDecoration(
        color: isActive ? Colors.grey[300] : Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          if (icon != null) const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: isActive ? Colors.black : Colors.black,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
