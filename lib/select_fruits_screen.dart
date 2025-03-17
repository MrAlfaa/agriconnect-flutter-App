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
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/415/415682.png',
      color: Colors.red,
    ),
    FruitItem(
      name: 'Banana',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/3143/3143645.png',
      color: Colors.yellow,
    ),
    FruitItem(
      name: 'Orange',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/415/415733.png',
      color: Colors.orange,
    ),
    FruitItem(
      name: 'Grapes',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2224/2224241.png',
      color: Colors.purple,
    ),
    FruitItem(
      name: 'Strawberry',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/590/590685.png',
      color: Colors.red,
    ),
    FruitItem(
      name: 'Mango',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/6866/6866569.png',
      color: Colors.amber,
    ),
    FruitItem(
      name: 'Pineapple',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/3137/3137038.png',
      color: Colors.amber.shade800,
    ),
    FruitItem(
      name: 'Watermelon',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/874/874997.png',
      color: Colors.green,
    ),

    // Additional Fruits
    FruitItem(
      name: 'Kiwi',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2224/2224118.png',
      color: Colors.green.shade800,
    ),
    FruitItem(
      name: 'Papaya',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/6866/6866522.png',
      color: Colors.orange.shade300,
    ),
    FruitItem(
      name: 'Pomegranate',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/6866/6866536.png',
      color: Colors.red.shade800,
    ),

    // Vegetables
    FruitItem(
      name: 'Tomato',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1412/1412511.png',
      color: Colors.red,
    ),
    FruitItem(
      name: 'Potato',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2224/2224187.png',
      color: Colors.brown.shade300,
    ),
    FruitItem(
      name: 'Onion',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2224/2224171.png',
      color: Colors.purple.shade200,
    ),
    FruitItem(
      name: 'Carrot',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1147/1147801.png',
      color: Colors.orange.shade700,
    ),
    FruitItem(
      name: 'Cucumber',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2224/2224112.png',
      color: Colors.green.shade600,
    ),
    FruitItem(
      name: 'Cabbage',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2224/2224229.png',
      color: Colors.green,
    ),
    FruitItem(
      name: 'Broccoli',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/1147/1147832.png',
      color: Colors.green.shade800,
    ),
    FruitItem(
      name: 'Eggplant',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2224/2224116.png',
      color: Colors.deepPurple,
    ),
    FruitItem(
      name: 'Bell Pepper',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2224/2224098.png',
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
            // Agriconnect aligned to left
            Container(
              alignment: Alignment.centerLeft,
              child: RichText(
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
            ),
            const SizedBox(height: 20),
            // "Set up your account" aligned to left
            const Text(
              'Set up your account',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 20),
            // "Select your produce" centered
            const Center(
              child: Text(
                'Select your produce',
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
  final String imageUrl;
  final Color color;
  bool isSelected;

  FruitItem({
    required this.name,
    required this.imageUrl,
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
            Image.network(
              fruit.imageUrl,
              height: 40,
              width: 40,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value:
                        loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                    color: fruit.color,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error, color: fruit.color);
              },
            ),
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
