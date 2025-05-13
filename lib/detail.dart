import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + favorite icon
            Stack(
              alignment: Alignment.topRight,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/415/415682.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Text(
              'Mayumi Red Apple',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('\$4.99',
                style: TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 8),

            Row(
              children: List.generate(
                5,
                (index) => Icon(Icons.star, color: Colors.orange),
              ),
            ),

            SizedBox(height: 20),

            // Quantity selector
            Row(
              children: [
                Text(
                  'Số lượng:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) {
                      setState(() {
                        quantity--;
                      });
                    }
                  },
                ),
                Text(quantity.toString(), style: TextStyle(fontSize: 18)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      quantity++;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 30),

            // Add to cart button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green),
                onPressed: () {
                  // TODO: Add to cart logic
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom actions
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.green),
              onPressed: () {
                // TODO: chuyển thành mua hàng
              },
            ),
          ],
        ),
      ),
    );
  }
}
