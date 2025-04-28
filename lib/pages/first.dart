import 'package:flutter/material.dart';
import 'package:gym/pages/BMICalculator.dart';
import 'package:gym/pages/GymInfoCard.dart';
import 'package:gym/pages/crud_gym.dart';
import 'package:gym/pages/exercise/AbdominalBench.dart';
import 'package:gym/pages/exercise/BarbellRow.dart';
import 'package:gym/pages/exercise/BenchPress.dart';
import 'package:gym/pages/exercise/InclineBench.dart';
import 'package:gym/pages/exercise/LegPress.dart';
import 'package:gym/pages/exercise/SmithMachine.dart';
import 'package:gym/pages/exercise/Treadmil.dart';
import 'package:gym/pages/exercise/UprightBike.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

final Map<String, Widget Function()> exercisePages = {
  'Back Barbell Row': () => const BarbellRow(),
  'Treadmil': () => const treadmilPage(),
  'Incline Bench Press': () => const inclineBench(),
  'Leg Press Machine': () => const legPress(),
  'Smith Machine': () => const smithMachine(),
  'Bench Press': () => const benchPres(),
  'Abdominal Bench': () => const abdominalBench(),
  'Upright Exercise Bike': () => const uprightBike(),
};

class _firstPageState extends State<firstPage> {
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> allExercises = [
    {
      'title': 'Back Barbell Row',
      'image': 'assets/back_row.jpg',
      'category': ['Bicep', 'Back', 'Tricep'],
    },
    {
      'title': 'Leg Press Machine',
      'image': 'assets/leg_press.jpg',
      'category': ['Leg'],
    },
    {
      'title': 'Smith Machine',
      'image': 'assets/smith_machine_chest.jpg',
      'category': ['Chest', 'Shoulder', 'Tricep'],
    },
    {
      'title': 'Upright Exercise Bike',
      'image': 'assets/bike_gym.jpg',
      'category': ['Cardio', 'Leg'],
    },
    {
      'title': 'Treadmil',
      'image': 'assets/treadmil.jpg',
      'category': ['Cardio'],
    },
    {
      'title': 'Incline Bench Press',
      'image': 'assets/incline_bench.jpg',
      'category': ['Chest', 'Shoulder', 'Tricep', 'Bicep'],
    },
    {
      'title': 'Bench Press',
      'image': 'assets/bench_press.jpg',
      'category': ['Chest', 'Shoulder', 'Tricep'],
    },
    {
      'title': 'Abdominal Bench',
      'image': 'assets/abdominal_bench.jpg',
      'category': ['Abs'],
    },
  ];

  List<Map<String, dynamic>> get filteredExercises {
    if (selectedCategory == 'All') return allExercises;
    return allExercises.where((item) {
      List<String> categories = List<String>.from(item['category']);
      return categories.contains(selectedCategory);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(icon: ImageIcon(AssetImage('assets/calculator.png'))),
              Tab(
                icon: ImageIcon(AssetImage('assets/notes.png')),
              ),
            ],
          ),
          title: const Text("workout page"),
        ),
        body: TabBarView(
          children: [
            // Tab pertama (Home)
            ColoredBox(
              color: Colors.white, // Background putih
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Menyesuaikan posisi ke kiri
                    children: [
                      Text(
                        "Category", // Teks kategori
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ), // Jarak antara teks dan kartu
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (var category in [
                              'All',
                              'Bicep',
                              'Tricep',
                              'Back',
                              'Chest',
                              'Shoulder',
                              'Leg',
                              'Cardio',
                              'Abs',
                            ])
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.black)),
                                  onPressed: () {
                                    setState(() {
                                      selectedCategory = category;
                                    });
                                  },
                                  child: Text(
                                    category,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Gerakan",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      SizedBox(height: 5),
                      Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: filteredExercises.map((exercise) {
                              return SizedBox(
                                width: 160,
                                child: GestureDetector(
                                  onTap: () {
                                    final title = exercise['title'];
                                    if (exercisePages.containsKey(title)) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                exercisePages[title]!()),
                                      );
                                    } else {
                                      print('Tidak Tersedia');
                                    }
                                  },
                                  child: GymInfoCard(
                                    title: exercise['title']!,
                                    imageUrl: exercise['image']!,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Tab kedua (BMI) -> Gambar sendiri
            ColoredBox(
              color: Colors.white,
              child: BMICalculator(),
            ),

            // Tab ketiga (Person) -> Gambar sendiri
            ColoredBox(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notes Gym',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: crudGym()
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
