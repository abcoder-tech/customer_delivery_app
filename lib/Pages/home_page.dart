import 'package:flutter/material.dart';
import 'package:Ab_delivery/Pages/responsive.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get device dimensions and text scale factor.
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final double textScale = MediaQuery.of(context).textScaleFactor;

    // When textScale is high, use a single column and boost sizes.
    final bool useSingleColumn = textScale >= 1.1;
    final double fontMultiplier = useSingleColumn ? 1.2 : 1.0;

    // "FoodGo" font size equal to 10% of the device width.
    var aa = screenWidth * 0.05;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Section
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "FoodGo",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: aa,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Order Your Favorite Food",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 35),
        // Search Bar Section
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                width: screenWidth *0.8 ,
                height: screenHeight *0.09 ,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search...',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: Colors.red,
                ),
                height: 50,
                width: 50,
                child: const Icon(
                  Icons.filter_list,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 35),
        // Button Row Section
        const ButtonRow(),
        const SizedBox(height: 0),
        // Grid of BurgerCards: use one column if needed.
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.all(15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: useSingleColumn ? 1 : 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 5,
              childAspectRatio:2.0,
            ),
            itemCount: 8,
            itemBuilder: (context, index) {
              return BurgerCard(
                title: [
                  'Cheesy Burger',
                  'Veggie Delight',
                  'Chicken Supreme',
                  'Beef Classic',
                  'Cheesy Burger',
                  'Veggie Delight',
                  'Chicken Supreme',
                  'Beef Classic'
                ][index],
                price: [
                  '\$7.99',
                  '\$6.99',
                  '\$8.49',
                  '\$9.49',
                  '\$7.99',
                  '\$6.99',
                  '\$8.49',
                  '\$9.49'
                ][index],
                rate: [
                  '4.9',
                  '3.5',
                  '4.2',
                  '4.7',
                  '4.9',
                  '3.5',
                  '4.2',
                  '4.7'
                ][index],
                imageUrl: [
                  'lib/assets/Images/burger.jpg',
                  'lib/assets/Images/burger1.jpg',
                  'lib/assets/Images/burger2.jpg',
                  'lib/assets/Images/burger3.jpg',
                  'lib/assets/Images/burger.jpg',
                  'lib/assets/Images/burger1.jpg',
                  'lib/assets/Images/burger2.jpg',
                  'lib/assets/Images/burger3.jpg'
                ][index],
                fontMultiplier: fontMultiplier,
                isSingleColumn: useSingleColumn,
              );
            },
          ),
        ),
      ],
    );
  }
}

class ButtonRow extends StatefulWidget {
  const ButtonRow({super.key});

  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  List<bool> buttonStates = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: List.generate(buttonStates.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonStates[index]
                      ? Colors.orange
                      : Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  minimumSize: const Size(100, 50),
                ),
                onPressed: () {
                  setState(() {
                    for (int i = 0; i < buttonStates.length; i++) {
                      buttonStates[i] = i == index;
                    }
                  });
                },
                child: Text(
                  ['All', 'New', 'Most', 'Combo', 'Sliders'][index],
                  style: TextStyle(
                    color: buttonStates[index] ? Colors.white : Colors.grey,
                    fontSize: 17,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

// Updated BurgerCard widget
class BurgerCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final IconData favoriteIcon;
  final String rate;
  // Multiplier to increase text/image sizes.
  final double fontMultiplier;
  // New flag: if true, we use one column layout.
  final bool isSingleColumn;

  const BurgerCard({
    required this.title,
    required this.price,
    required this.rate,
    required this.imageUrl,
    this.favoriteIcon = Icons.favorite_border,
    this.fontMultiplier = 1.0,
    this.isSingleColumn = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // When in single column mode, we want the card to have a fixed height.
    // For example, set the card's total height to 35% of screen height.
    final double cardHeight;
    if (isSingleColumn) {
      cardHeight = screenHeight * 0.45;
    } else {
      cardHeight = screenHeight * 0.1;
    }

    // If in single column mode, let the image be exactly half of the card height.
    // Otherwise, use the default image height multiplied by the fontMultiplier.
    final double imageHeight =cardHeight * 0.5;
    isSingleColumn ? (cardHeight / 2) : 90 * fontMultiplier;

    final cardContent = Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          // Image section
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 5),
          // Title text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16 * fontMultiplier,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Price text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16 * fontMultiplier,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Row for rating and favorite icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.star_rate,
                    size: 14 * fontMultiplier,
                    color: Colors.orange,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Text(
                      rate,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14 * fontMultiplier,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              Icon(
                favoriteIcon,
                size: 20 * fontMultiplier,
                color: Colors.black,
              ),
            ],
          ),
        ],
      ),
    );

    // When in single column mode, wrap the card with a fixed height.
    return isSingleColumn
        ? SizedBox(height: cardHeight, child: cardContent)
        : cardContent;
  }
}
