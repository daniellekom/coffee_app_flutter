import 'package:coffeeappui/util/coffe_tile.dart';
import 'package:coffeeappui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // list of coffee types
  final List coffeeType = [
    //[ coffee type, isSelectted ]
    [
      'Cappuccino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Espresso',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {

      // this for loop makes every selection false
      for(int i = 0; i < coffeeType.length; i++){
        coffeeType[i][1] = false;
      }
      coffeeType[index][1]= true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        ],
      ),
      body: Column(children: [
        // Find the best coffee for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Find the best coffee for you",
            style: GoogleFonts.bebasNeue(
              fontSize: 56,
            ),
          ),
        ),

        SizedBox(height: 25),

        // Search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextFormField(
            decoration: InputDecoration(
              prefix: const Icon(Icons.search),
              hintText: 'Find your Coffee ..',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 25,
        ),

        // Horizontal listview for specified coffee types
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: coffeeType.length,
              itemBuilder: (context,index){
            return CoffeeType(
                coffeeType: coffeeType[index][0],
                isSelected: coffeeType[index][1],
                onTap: (){
                   coffeeTypeSelected(index);
                },
            );
          })
        ),

        // Horizontal listview of coffee tiles
        Expanded(

          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              CoffeeTile(
                coffeeImagePath: 'lib/images/espresso.jpg',
                coffeeName: 'Cappucino',
                coffeePrice: '4.20',
              ),  CoffeeTile(
                coffeeImagePath: 'lib/images/coffeebeans.jpg',
                coffeeName: 'Coffee Beans',
                coffeePrice: '4.00',
              ),  CoffeeTile(
                coffeeImagePath: 'lib/images/espresso.jpg',
                coffeeName: 'Espresso',
                coffeePrice: '2.75',
              ),

            ],
          ),
        ),
      ]),
    );
  }
}
