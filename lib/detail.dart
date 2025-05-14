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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: double.infinity,
                height: 400,
                child: Center(
                  child: Image.asset('image/hinh-anh-qua-tao.png'),
                ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: GestureDetector(
                  onTap: onClickReturn,
                  child: Icon(Icons.arrow_back_ios_outlined, size: 40),
                ),
              ),
              Positioned(
                top: 40,
                right: 20,
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.ios_share_outlined, size: 40),
                ),
              ),
            ],
          ),

          // PHẦN TÊN VÀ ICON YÊU THÍCH
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Naturel Red Apple",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontFamily: "Arial",
                      ),
                    ),
                    Text(
                      "Fresh and tasty.",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                IconButton(
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
              ],
            ),
          ),

          // PHẦN CHỌN SỐ LƯỢNG VÀ GIÁ
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // Cụm nút số lượng
                Container(
                  width: 160,
                  decoration: BoxDecoration(
                    //color: Colors.red[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: (quantity ==1) 
                          ? null  
                          : () {
                              setState(() {
                                quantity--;
                              });
                            },
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed:  (quantity ==5) 
                          ? null  
                          : () {
                              setState(() {
                                quantity++;
                              });
                            },
                      ),
                    ],
                  ),
                ),

                // Giá tiền
                Text(
                  "\$4.99",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10,5,10,0),
              child: Divider(
                color: Colors.grey,  // Màu của đường kẻ
                thickness: 1.5,         // Độ dày của đường kẻ
                indent: 15,           // Khoảng cách từ đầu tới đường kẻ
                endIndent: 15,        // Khoảng cách từ đường kẻ đến cuối
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 50,
                 // color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Product Detail',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Icon(Icons.keyboard_arrow_down ,size:30),
                    ],
                  ),
                ),
                Text("Apple Are Nutritions. Apples May Be Good For Weight Loss. Apples May Be Good For Our Your Heart. As Part Off A Healthful And Varied Diet.",
                style: TextStyle(fontSize: 13.5),)
              ],
            ),
          ),
           Padding(
              padding: const EdgeInsets.fromLTRB(10,5,10,5),
              child: Divider(
                color: Colors.grey,  // Màu của đường kẻ
                thickness: 1.5,         // Độ dày của đường kẻ
                indent: 15,           // Khoảng cách từ đầu tới đường kẻ
                endIndent: 15,        // Khoảng cách từ đường kẻ đến cuối
              ),
            ),
          Padding(
            padding: EdgeInsets.fromLTRB(20,0,20,0),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   Text(
                        'Nutritions',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Container(
                        width: 80,
                       // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 30,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text("100gr",
                              style: TextStyle(fontSize: 8),),
                            ),
                            Icon(Icons.keyboard_arrow_right ,size:30),
                          ],
                        ),
                      ),
                ],
              ),
            ),
            ),
             Padding(
              padding: const EdgeInsets.fromLTRB(10,5,10,5),
              child: Divider(
                color: Colors.grey,  // Màu của đường kẻ
                thickness: 1.5,         // Độ dày của đường kẻ
                indent: 15,           // Khoảng cách từ đầu tới đường kẻ
                endIndent: 15,        // Khoảng cách từ đường kẻ đến cuối
              ),
            ),
               Padding(
            padding: EdgeInsets.fromLTRB(20,0,20,0),
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                   Text(
                        'Review',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      Container(
                        width: 120,
                       // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80,
                              height: 20,
                             // color: Colors.red,
                              alignment: Alignment.center,
                              
                              child:Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.yellow,size: 15,),
                                      Icon(Icons.star,color: Colors.yellow,size: 15,),
                                      Icon(Icons.star,color: Colors.yellow,size: 15,),
                                      Icon(Icons.star,color: Colors.yellow,size: 15,),
                                      Icon(Icons.star,color: Colors.yellow,size: 15,),
                                    ],
                                  ),
                                ],
                              ),            
                                                ),
                            Icon(Icons.keyboard_arrow_right ,size:30),
                          ],
                        ),
                      ),
                ],
              ),
            ),
            ),
              SizedBox(
                    width: 350,
                    height: 56,
                    child: ElevatedButton(     
                     style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                     ),
                      onPressed: onAddtoCart,
                      child: Text("Add To Basket", style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ) ,
               
        ],
      ),
    );
  }
  void onAddtoCart(){
    null;
  }
  void onClickReturn() {
    Navigator.pop(context);
  }
}
