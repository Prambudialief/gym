import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  // Variable to store the background
  // color of the BMI result container
  Color myColor = Colors.transparent;

  // Controllers for weight and height input fields
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  // Controller to display the BMI result
  var mainResult = TextEditingController();

  // Function to calculate BMI based
  // on weight and height
  void calculateBMI(String weight, String height) async {
    
    double myDoubleWeight = double.parse(weight);
    double myDoubleHeight = double.parse(height);

    // Calculate BMI
    var res = (myDoubleWeight / (myDoubleHeight * myDoubleHeight));

    setState(() {
      mainResult.text = res.toStringAsFixed(2);

      if (res < 18.5) {
        myColor = Colors.grey;
      } else if (res >= 18.5 && res <= 24.9) {
        myColor = Colors.green;
      } else if (res >= 25 && res <= 29.9) {
        myColor = Colors.yellow;
      } else if (res >= 30 && res <= 34.9) {
        myColor = Colors.orange;
      } else if (res >= 35) {
        myColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            height: height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                ],
              ),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "BMI Calculator",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 30),

                  // Weight input field
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: TextField(
                      controller: weightController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Masukkan berat badan (kg)",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  // Height input field
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 15),
                    child: TextField(
                      controller: heightController,
                      autofocus: false,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Masukkan Tinggi Badan (m)",
                         border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  // Calculate button
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: Center(
                      child: SizedBox(
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            calculateBMI(
                                weightController.text, heightController.text);
                          },
                          child: const Text(
                            "Calculate",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),

                  // BMI result display container
                  Center(
                    child: Container(
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                        color: myColor,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Center(
                        child: Text(
                          "BMI: " + mainResult.text,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),

                  // BMI category color indicators
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildCategoryIndicator(
                            Colors.grey, "Underweight"),
                        _buildCategoryIndicator(Colors.green, "Normal"),
                        _buildCategoryIndicator(
                            Colors.yellow, "Overweight"),
                        _buildCategoryIndicator(Colors.orange, "Obese"),
                        _buildCategoryIndicator(Colors.red, "Extreme"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper function to build a BMI
  // category indicator
  Widget _buildCategoryIndicator(Color color, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
