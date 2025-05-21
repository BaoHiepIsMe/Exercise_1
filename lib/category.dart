import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: <Widget>[
             Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Store',
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 10) ,
                crossAxisCount: 2,
                childAspectRatio: 7 / 8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                         color: Colors.green,
                         width: 1, 
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 110,
                         // color: Colors.red,
                          child: Image.asset("image/rau.png"),
                        ),
                        SizedBox(height: 12,),
                        Text("Frash Fruits \n& Vegetable",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                         ),
                         textAlign: TextAlign.center,   
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                         color: Colors.orange,
                         width: 1, 
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 110,
                         // color: Colors.red,
                          child: Image.asset("image/dau1.png"),
                        ),
                        SizedBox(height: 12,),
                        Text("Cooking Oil \n& Ghee",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                         ),
                         textAlign: TextAlign.center,   
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                         color: Colors.red,
                         width: 1, 
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 110,
                         // color: Colors.red,
                          child: Image.asset("image/ca.png"),
                        ),
                        SizedBox(height: 12,),
                        Text("Meat & Fish",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                         ),
                         textAlign: TextAlign.center,   
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                         color: Colors.purple,
                         width: 1, 
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 110,
                         // color: Colors.red,
                          child: Image.asset("image/banhmy.png"),
                        ),
                        SizedBox(height: 12,),
                        Text("Bakery & Snack",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                         ),
                         textAlign: TextAlign.center,   
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellowAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                         color: Colors.yellow,
                         width: 1, 
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 110,
                         // color: Colors.red,
                          child: Image.asset("image/sua.png"),
                        ),
                        SizedBox(height: 12,),
                        Text("Dairy & Eggs",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                         ),
                         textAlign: TextAlign.center,   
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                         color: Colors.blue,
                         width: 1, 
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 80,
                          width: 110,
                         // color: Colors.red,
                          child: Image.asset("image/nuocngot.png"),
                        ),
                        SizedBox(height: 12,),
                        Text("Beverages",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                         ),
                         textAlign: TextAlign.center,   
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                         color: Colors.deepOrange,
                         width: 1, 
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.pink.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                         color: Colors.pinkAccent,
                         width: 1, 
                      ),
                    ),
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