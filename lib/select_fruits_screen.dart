import 'package:flutter/material.dart';
import 'success_screen.dart';

class SelectFruitsScreen extends StatefulWidget {
  const SelectFruitsScreen({Key? key}) : super(key: key);

  @override
  State<SelectFruitsScreen> createState() => _SelectFruitsScreenState();
}

class _SelectFruitsScreenState extends State<SelectFruitsScreen> {
  final List<FruitItem> fruits = [
    FruitItem(name: 'Apple', icon: Icons.apple, color: Colors.red),
    FruitItem(name: 'Banana', icon: Icons.water_drop, color: Colors.yellow),
    FruitItem(name: 'Orange', icon: Icons.circle, color: Colors.orange),
    FruitItem(name: 'Grapes', icon: Icons.grain, color: Colors.purple),
    FruitItem(name: 'Strawberry', icon: Icons.favorite, color: Colors.red),
    FruitItem(name: 'Mango', icon: Icons.egg, color: Colors.amber),
    FruitItem(name: 'Pineapple', icon: Icons.hexagon, color: Colors.amber.shade800),
    FruitItem(name: 'Watermelon', icon: Icons.circle, color: Colors.green),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agriconnect'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Set up your account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Select your fruits'),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: fruits.length,
                itemBuilder: (context, index) {
                  return FruitSelectionTile(
                    fruit: fruits[index],
                    onTap: () {
                      setState(() {
                        fruits[index].isSelected = !fruits[index].isSelected;
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
                    MaterialPageRoute(builder: (context) => const SuccessScreen()),
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
  final IconData icon;
  final Color color;
  bool isSelected;

  FruitItem({
    required this.name,
    required this.icon,
    required this.color,
    this.isSelected = false,
  });
}

class FruitSelectionTile extends StatelessWidget {
  final FruitItem fruit;
  final VoidCallback onTap;

  const FruitSelectionTile({
    Key? key,
    required this.fruit,
    required this.onTap,
  }) : super(key: key);

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
            Icon(
              fruit.icon,
              size: 40,
              color: fruit.color,
            ),
            const SizedBox(height: 8),
            Text(
              fruit.name,
              style: TextStyle(
                fontWeight: fruit.isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
