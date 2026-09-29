import 'package:flutter/material.dart';
import 'package:fuel_calc/screens/result_screen.dart';
import 'package:fuel_calc/widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int distance = 50;
  double fuel = 6.5;
  double liter_cost = 3.5;
  int people = 4;

  double calculateCostPerPerson() {
    double totalFuel = (distance * fuel) / 100;
    double totalCost = totalFuel * liter_cost;
    return totalCost / people;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'اعدادات الرحلة'),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "المسافة(كم)",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            showValueIndicator:
                                ShowValueIndicator.alwaysVisible,
                            valueIndicatorColor:  Color(
                              0xFF2C4472,
                            ),
                            valueIndicatorTextStyle:  TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            valueIndicatorShape:
                                RectangularSliderValueIndicatorShape(),
                          ),
                          child: Slider(
                            value: distance.toDouble(),
                            activeColor: Color(0xff1E3A8A),
                            inactiveColor: Colors.grey,
                            min: 0,
                            max: 1000,
                            label:
                                '${distance.round()} كم',
                            onChanged: (value) {
                              setState(() {
                                distance = value.toInt();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "استهلاك الوقود(لتر/100كم)",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.directions_car_rounded,
                        color: Color(0xff1E3A8A),
                        size: 24,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton.small(
                        onPressed: (){
                          fuel -= 0.5;
                          setState(() {

                          });
                        },
                        child: Icon(Icons.remove,color: Colors.white),
                        backgroundColor: Color(0xff1E3A8A),
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Color(0xff1E3A8A)
                          )
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xff1E3A8A),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "$fuel",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ),
                        ),
                      ),
                      FloatingActionButton.small(
                        onPressed: (){
                          fuel += 0.5;
                          setState(() {

                          });
                        },
                        child: Icon(Icons.add, color: Colors.white),
                        backgroundColor: Color(0xff1E3A8A),
                        shape: CircleBorder(
                            side: BorderSide(
                                color: Color(0xff1E3A8A)
                            )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "سعر اللتر",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            showValueIndicator:
                            ShowValueIndicator.alwaysVisible,
                            valueIndicatorColor:  Color(
                              0xFF2C4472,
                            ),
                            valueIndicatorTextStyle:  TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            valueIndicatorShape:
                            RectangularSliderValueIndicatorShape(),
                          ),
                          child: Slider(
                            value: liter_cost,
                            activeColor: Color(0xff1E3A8A),
                            inactiveColor: Colors.grey,
                            min: 0,
                            max: 20,
                            divisions: 200,
                            label:
                            'شيكل ${liter_cost.toStringAsFixed(2)}',
                            onChanged: (value) {
                              setState(() {
                                liter_cost = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ], 
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "عدد الأشخاص",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.people,
                        color: Color(0xff1E3A8A),
                        size: 24,
                      )
                    ],
                  ),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.small(
                        onPressed: (){
                          people--;
                          setState(() {

                          });
                        },
                        child: Icon(Icons.remove,color: Colors.white),
                        backgroundColor: Color(0xff1E3A8A),
                        shape: CircleBorder(
                            side: BorderSide(
                                color: Color(0xff1E3A8A)
                            )
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Color(0xff1E3A8A),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "$people",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                      ),
                      FloatingActionButton.small(
                        onPressed: (){
                          people++;
                          setState(() {

                          });
                        },
                        child: Icon(Icons.add, color: Colors.white),
                        backgroundColor: Color(0xff1E3A8A),
                        shape: CircleBorder(
                            side: BorderSide(
                                color: Color(0xff1E3A8A)
                            )
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                double finalCost = calculateCostPerPerson();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(cost_per_person: finalCost),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff1E3A8A),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 12),
                    Text(
                      "احسب التكلفة",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


