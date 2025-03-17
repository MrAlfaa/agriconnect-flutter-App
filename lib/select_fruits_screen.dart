import 'package:flutter/material.dart';
import 'success_screen.dart';

class SelectFruitsScreen extends StatefulWidget {
  const SelectFruitsScreen({super.key});

  @override
  State<SelectFruitsScreen> createState() => _SelectFruitsScreenState();
}

class _SelectFruitsScreenState extends State<SelectFruitsScreen> {
  final List<FruitItem> produceItems = [
    // Fruits
    FruitItem(
      name: 'Apple',
      imagePath: 'assets/images/apple.png',
      color: Colors.red,
    ),
    FruitItem(
      name: 'Banana',
      imagePath: 'assets/images/apple.png',
      color: Colors.yellow,
    ),
    FruitItem(
      name: 'Orange',
      imagePath: 'assets/images/apple.png',
      color: Colors.orange,
    ),
    FruitItem(
      name: 'Grapes',
      imagePath: 'assets/images/apple.png',
      color: Colors.purple,
    ),
    FruitItem(
      name: 'Strawberry',
      imagePath: 'assets/images/apple.png',
      color: Colors.red,
    ),
    FruitItem(
      name: 'Mango',
      imagePath: 'assets/images/apple.png',
      color: Colors.amber,
    ),
    FruitItem(
      name: 'Pineapple',
      imagePath: 'assets/images/apple.png',
      color: Colors.amber.shade800,
    ),
    FruitItem(
      name: 'Watermelon',
      imagePath: 'assets/images/apple.png',
      color: Colors.green,
    ),

    // Additional Fruits
    FruitItem(
      name: 'Kiwi',
      imagePath: 'assets/images/apple.png',
      color: Colors.green.shade800,
    ),
    FruitItem(
      name: 'Papaya',
      imagePath: 'assets/images/apple.png',
      color: Colors.orange.shade300,
    ),
    FruitItem(
      name: 'Pomegranate',
      imagePath: 'assets/images/apple.png',
      color: Colors.red.shade800,
    ),

    // Vegetables
    FruitItem(
      name: 'Tomato',
      imagePath: 'assets/images/apple.png',
      color: Colors.red,
    ),
    FruitItem(
      name: 'Potato',
      imagePath: 'assets/images/apple.png',
      color: Colors.brown.shade300,
    ),
    FruitItem(
      name: 'Onion',
      imagePath: 'assets/images/apple.png',
      color: Colors.purple.shade200,
    ),
    FruitItem(
      name: 'Carrot',
      imagePath: 'assets/images/apple.png',
      color: Colors.orange.shade700,
    ),
    FruitItem(
      name: 'Cucumber',
      imagePath: 'assets/images/apple.png',
      color: Colors.green.shade600,
    ),
    FruitItem(
      name: 'Cabbage',
      imagePath: 'assets/images/apple.png',
      color: Colors.green,
    ),
    FruitItem(
      name: 'Broccoli',
      imagePath: 'assets/images/apple.png',
      color: Colors.green.shade800,
    ),
    FruitItem(
      name: 'Eggplant',
      imagePath: 'assets/images/apple.png',
      color: Colors.deepPurple,
    ),
    FruitItem(
      name: 'Bell Pepper',
      imagePath: 'assets/images/apple.png',
      color: Colors.red.shade600,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Removed the AppBar
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Changed from Center to align left
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Agri',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 30, // Increased font size
                    ),
                  ),
                  TextSpan(
                    text: 'connect',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30, // Increased font size
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Changed from Center to align left
            const Text(
              'Set up your account',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Keeping this centered
            const Center(
              child: Text(
                'Select your fruits',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: produceItems.length,
                itemBuilder: (context, index) {
                  return FruitSelectionTile(
                    fruit: produceItems[index],
                    onTap: () {
                      setState(() {
                        produceItems[index].isSelected =
                            !produceItems[index].isSelected;
                      });
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SuccessScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Continue'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FruitItem {
  final String name;
  final String imagePath;
  final Color color;
  bool isSelected;

  FruitItem({
    required this.name,
    required this.imagePath,
    required this.color,
    this.isSelected = false,
  });
}

class FruitSelectionTile extends StatelessWidget {
  final FruitItem fruit;
  final VoidCallback onTap;

  const FruitSelectionTile({
    super.key,
    required this.fruit,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: fruit.isSelected ? fruit.color.withOpacity(0.3) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: fruit.isSelected ? fruit.color : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(fruit.imagePath, height: 40, width: 40),
            const SizedBox(height: 8),
            Text(
              fruit.name,
              style: TextStyle(
                fontWeight:
                    fruit.isSelected ? FontWeight.bold : FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
