import 'package:flutter/material.dart';
import 'detail.dart';

void main(){
  runApp(const Homepage());
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

void run(){

}

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(  
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top:50),
              alignment: Alignment.center,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                       width:50,
                      height:50,
                      child: Image.asset("image/R.png"),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [  
                        Icon(Icons.location_on_sharp),
                        Text("Ngũ Hành Sơn, Đà Nẵng", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15 ),)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(  
                  height: 130,
                   // chiều cao banner
                  child: PageView(
                    children: [
                      Image.asset('image/banner1.jpg', fit: BoxFit.cover),
                      Image.asset('image/banner2.jpg', fit: BoxFit.cover),
                      Image.asset('image/banner3.jpg', fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),
            ),
            //SẢN PHẨM 
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Exclusive Offer",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  TextButton(
                  onPressed: null, 
                  child: Text("See all", style: TextStyle(color: Colors.green,fontSize: 18),),)
                ],
              ),
            ),
            //TRƯỢT NGANG ĐẦU TIÊN
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children:<Widget> [
                    Container(
                      height: 250,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                      ),
                      // quả chuối
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                                             Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: double.infinity,
                            child: Image.asset("image/chuoi.png"),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Organic Bananas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("7pcs, Prices", style: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(height:35,),
                          Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$4.99",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.add, color: Colors.white, size: 20),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                        ),
                      )
                    ),
                    SizedBox(width: 10,),
                    //Quả táo
                    GestureDetector(
                      onTap: () {
                    Detail();
                  },
                  child:Container(
                      height: 250,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                           Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: double.infinity,
                            child: Image.asset("image/tao.png"),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Red Apple", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("1kg, Prices", style: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(height:35,),
                          Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$4.99",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.add, color: Colors.white, size: 20),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                        ),
                      )
                    ),
                ),
                    SizedBox(width:10),
                    //Quả còn lại
                    Container(
                      height: 250,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                                             Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: double.infinity,
                            child: Image.asset("image/nho.png"),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Grape", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("1pcs, Prices", style: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(height:35,),
                          Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$4.99",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.add, color: Colors.white, size: 20),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best Selling",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  TextButton(
                  onPressed: null, 
                  child: Text("See all", style: TextStyle(color: Colors.green,fontSize: 18),),)
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children:<Widget> [
                    Container(
                      height: 250,
                      width: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                      ),
                      // ỚT CHUÔNG
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                                             Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: double.infinity,
                            child: Image.asset("image/otchuong.png"),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Bell Pepper Red", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("1kg, Prices", style: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(height:35,),
                          Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$4.99",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.add, color: Colors.white, size: 20),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                        ),
                      )
                    ),
                    SizedBox(width: 10,),
                    //Gừng
                    Container(
                      height: 250,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                                             Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: double.infinity,
                            child: Image.asset("image/OIP.jpg"),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Ginger", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("250grm, Prices", style: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(height:35,),
                          Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$4.99",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.add, color: Colors.white, size: 20),
                                    ),
                                  ],
                                ),
                              ),
                        ],
                        ),
                      )
                    ),
                    SizedBox(width:10),
                    //Quả còn lại
                    Container(
                      height: 250,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                           Container(
                            alignment: Alignment.center,
                            height: 100,
                            width: double.infinity,
                            child: Image.asset("image/nho.png"),
                            
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("Grape", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text("1pcs, Prices", style: TextStyle(color: Colors.grey)),
                          ),
                          SizedBox(height:35,),
                          Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$4.99",
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Container(
                                      height: 35,
                                      width: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(Icons.add, color: Colors.white, size: 20),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Groceries",
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  TextButton(
                  onPressed: null, 
                  child: Text("See all", style: TextStyle(color: Colors.green,fontSize: 18),),)
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 110,
                      width: 270,
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)
                      ), 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipOval(
                              child: Container(
                                height: 60,
                                width: 60,
                                child: Image.asset("image/dau.png", fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Text("Pulses",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        ],
                      ),
                    ),
                    SizedBox(width:10),
                     Container(
                      alignment: Alignment.centerLeft,
                      height: 110,
                      width: 270,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)
                      ), 
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ClipOval(
                              child: Container(
                                height: 60,
                                width: 60,
                                child: Image.asset("image/rice.jpg", fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Text("Rice",
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
               Padding(
                 padding: const EdgeInsets.only(top: 20),
                 child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children:<Widget> [
                      Container(
                        height: 250,
                        width: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                        ),
                        // ỚT CHUÔNG
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                               Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: double.infinity,
                              child: Image.asset("image/thitbo.png"),
                              
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Beef Bone", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("1kg, Prices", style: TextStyle(color: Colors.grey)),
                            ),
                            SizedBox(height:35,),
                            Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$4.99",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Icon(Icons.add, color: Colors.white, size: 20),
                                      ),
                                    ],
                                  ),
                                ),
                          ],
                          ),
                        )
                      ),
                      SizedBox(width: 10,),
                      //Gừng
                      Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                               Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: double.infinity,
                              child: Image.asset("image/ga-nguyen-con-nhap-khau.png"),
                              
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Chicken", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("250grm, Prices", style: TextStyle(color: Colors.grey)),
                            ),
                            SizedBox(height:35,),
                            Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$4.99",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Icon(Icons.add, color: Colors.white, size: 20),
                                      ),
                                    ],
                                  ),
                                ),
                          ],
                          ),
                        )
                      ),
                      SizedBox(width:10),
                      //Quả còn lại
                      Container(
                        height: 250,
                        width: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                                               Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: double.infinity,
                              child: Image.asset("image/nho.png"),
                              
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("Grape", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("1pcs, Prices", style: TextStyle(color: Colors.grey)),
                            ),
                            SizedBox(height:35,),
                            Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$4.99",
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child: Icon(Icons.add, color: Colors.white, size: 20),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                               ),
                             ),
               ),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}