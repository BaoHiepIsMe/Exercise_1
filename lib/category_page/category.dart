import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/category_page/category_cubit.dart';
import 'package:login/category_page/category_state.dart';
import 'package:login/loading/loadingOverlay.dart';
import 'package:login/loading/loadingscreen.dart';

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
      body:BlocBuilder<CategoryCubit,CategoryState>(
        builder:(context,state){
          if(state.isLoading){
            return LoadingScreen();
          }
          return  Padding(
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
              child:  GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 10) ,
                crossAxisCount: 2,
                childAspectRatio: 7 / 8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: state.DetailCategory.map((detailcategory){
                    return GestureDetector(
                    onTap: (){
                     context.read<CategoryCubit>().simulateClickLoading( detailcategory.name);
                    },
                    child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: detailcategory.color.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                         color: detailcategory.colorradius,
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
                          child: Image.asset(detailcategory.image),
                        ),
                        SizedBox(height: 12,),
                        Text(detailcategory.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                         ),
                         textAlign: TextAlign.center,   
                        ),
                      ],
                    ),
                    ),
                  );
                }).toList(),
              ),
            ),
             if (state.isLoadingitem)
                const LoadingOverlay(),
          ],
        ),
      );
        } 
      )
    );
  }
}