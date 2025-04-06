import 'package:Ab_delivery/Pages/nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatefulWidget {
  
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  // Declare `_selectedIndex` to track the selected tab
  int _selectedIndex = 0;


  final List<Widget> _pages = [
   // const HomePage(),
    const ExplorePage(),
    const SettingsPage(),
  ];
  // Callback to handle navigation item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "FoodGo",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text("Order Your Favorite Food"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 35),
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
                      width: 275,
                      height: 50,
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
              const ButtonRow(), // Scrollable buttons with color change
              const SizedBox(height: 0),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two cards per row
                    crossAxisSpacing: 10, // Space between cards horizontally
                    mainAxisSpacing: 5, // Space between cards vertically
                    childAspectRatio: 0.95, // Aspect ratio for card layout
                  ),
                  itemCount: 8, // Total number of cards
                  itemBuilder: (context, index) {
                    return BurgerCard(

                      title: ['Cheesy Burger', 'Veggie Delight', 'Chicken Supreme', 'Beef Classic','Cheesy Burger', 'Veggie Delight', 'Chicken Supreme', 'Beef Classic'][index],
                   //   description: [
                     //   'Loaded with cheese and delicious toppings!',
                       // 'Fresh vegetables packed in a tasty burger!',
                //        'Juicy chicken paired with fresh veggies!',
                  //      'Succulent beef cooked to perfection!',
                    //    'Loaded with cheese and delicious toppings!',
                      //  'Fresh vegetables packed in a tasty burger!',
            //            'Juicy chicken paired with fresh veggies!',
              //          'Succulent beef cooked to perfection!',
                //      ][index],
                      price: ['\$7.99', '\$6.99', '\$8.49', '\$9.49','\$7.99', '\$6.99', '\$8.49', '\$9.49'][index],
                      rate: ['4.9', '3.5', '4.2', '4.7','4.8', '4.0', '4.1', '4.9'][index],

                      imageUrl: 'lib/assets/Images/burger.jpg',

                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _selectedIndex, // Pass the selected index
          onItemTapped:_onItemTapped, // Pass the callback
        ),
      ),
    );
  }


  }


class ButtonRow extends StatefulWidget {
  const ButtonRow({super.key});

  @override
  _ButtonRowState createState() => _ButtonRowState();
}

class _ButtonRowState extends State<ButtonRow> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
 // int _selectedIndex = 0;
  List<bool> buttonStates = [true, false, false, false, false]; // Track active button

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
                  backgroundColor: buttonStates[index] ? Colors.orange : Colors.grey[200],
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

class BurgerCard extends StatelessWidget {
  
  final String title;
 // final String description;
  final String price;
  final String imageUrl;
  final IconData favoriteIcon;
  final String rate;

  const BurgerCard({
    required this.title,
   // required this.description,
    required this.price,
    required this.rate,
    required this.imageUrl,
    this.favoriteIcon = Icons.favorite_border,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     // height: 40, // Total height of the card
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                imageUrl,
                width: double.infinity, // Stretch image horizontally
                height: 90, // Fixed height for the image
                fit: BoxFit.cover, // Ensures the image covers its area
              ),
            ),
            const SizedBox(height: 5), // Space below the image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // Prevent text overflow
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
       //     Padding(
         //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
           //   child: Text(
             //   description,
               // style: const TextStyle(
                 // fontSize: 12,
                  //color: Colors.grey,
                //),
                //maxLines: 2,
                //overflow: TextOverflow.ellipsis, // Prevent text overflow
             // ),
            //),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Positioned(
                      top: 10,
                     // right: 10,
                      child: Icon(
                       Icons.star_rate, // Use the passed-in icon
                        size: 14,
                        color: Colors.orange,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Text(
                        rate,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),

                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(
                    favoriteIcon, // Use the passed-in icon
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }

}


