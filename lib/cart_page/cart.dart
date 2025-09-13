import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/cart_page/cart_cubit.dart';
import 'package:login/cart_page/cart_state.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Cart",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Stack(
            children: [
              /// Main content layer
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      // Header
                      Container(
                        color: const Color.fromARGB(255, 58, 164, 50),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Food Type", 
                                    style: TextStyle(fontSize: 18, color: Colors.white)
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Select food type", 
                                    style: TextStyle(
                                      fontSize: 20, 
                                      fontWeight: FontWeight.bold, 
                                      color: Colors.white
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  context.read<CartCubit>().loadFoodTypes();
                                  context.read<CartCubit>().toggleExpanded();
                                },
                                icon: Icon(
                                  state.isExpanded 
                                    ? Icons.keyboard_arrow_up 
                                    : Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Detailed information
                      if (state.isProduct)
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Detail Information About", 
                                    style: TextStyle(
                                      color: Colors.black, 
                                      fontWeight: FontWeight.bold, 
                                      fontSize: 18
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    state.nameCategory ?? " ", 
                                    style: TextStyle(
                                      color: Colors.green, 
                                      fontWeight: FontWeight.bold, 
                                      fontSize: 18
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.categoryDetail ?? '',
                                style: const TextStyle(fontSize: 13, color: Colors.grey),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                color: const Color.fromARGB(255, 58, 164, 50),
                                width: 250,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Select item", 
                                        style: TextStyle(fontSize: 18, color: Colors.white)
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context.read<CartCubit>().toggleChoseProduct();
                                          context.read<CartCubit>().selectItemFromCategory(state.select ?? "");
                                        },
                                        icon: Icon(
                                          state.isChoseProduct 
                                            ? Icons.keyboard_arrow_up 
                                            : Icons.keyboard_arrow_down,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ...state.cartItems.entries.map((entry) {
                                final item = entry.key;
                                final quantity = entry.value;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 8,
                                          spreadRadius: 2,
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          item.image, 
                                          width: 60, 
                                          height: 60, 
                                          fit: BoxFit.cover
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.nameCategory ?? "", // e.g: Fruit & Vegetable
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold, 
                                                  fontSize: 14
                                                ),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                item.name,
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                '\$${item.price}',
                                                style: TextStyle(
                                                  color: Colors.grey, 
                                                  fontSize: 13
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                context.read<CartCubit>().removeItemFromCart(item);
                                              },
                                              icon: const Icon(Icons.remove, color: Colors.green),
                                            ),
                                            Container(
                                              width: 30,
                                              alignment: Alignment.center,
                                              child: Text(
                                                '$quantity',
                                                style: const TextStyle(fontSize: 16),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                context.read<CartCubit>().addItemToCart(item);
                                              },
                                              icon: const Icon(Icons.add, color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ],
                          ),
                        ),
                      const SizedBox(height: 300), 
                    ],
                  ),
                ),
              ),
              
              /// Overlay layer (category list)
              if (state.isExpanded)
                Positioned(
                  top: 80,
                  right: 10,
                  left: 10,
                  child: Container(
                    height: 300,
                    color: const Color.fromARGB(255, 58, 164, 50),
                    child: ListView.builder(
                      itemCount: state.itemCategories.length,
                      itemBuilder: (context, index) {
                        final category = state.itemCategories[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6, 
                            horizontal: 12
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    category.image, 
                                    height: 50, 
                                    width: 50
                                  ),
                                  Text(
                                    category.name, 
                                    style: const TextStyle(
                                      color: Colors.white, 
                                      fontSize: 18
                                    ),
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<CartCubit>().getCategoryInformation(
                                    category.name, 
                                    category.information
                                  );
                                  context.read<CartCubit>().toggleExpanded();
                                  context.read<CartCubit>().toggleProduct();
                                  context.read<CartCubit>().saveSelect(category.select);
                                },
                                child: const Text(
                                  "Select", 
                                  style: TextStyle(
                                    color: Colors.black, 
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              
              if (state.isChoseProduct)
                Positioned(
                  top: 300,
                  left: 20,
                  child: Container(
                    width: 250,
                    height: 300,
                    color: const Color.fromARGB(255, 58, 164, 50),
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        final item = state.items[index];
                        return TextButton(
                          onPressed: () {
                            context.read<CartCubit>().toggleChoseProduct();
                            context.read<CartCubit>().addItemToCart(item); 
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                item.image,
                                height: 70,
                                width: 70,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.broken_image, 
                                    size: 70, 
                                    color: Colors.red
                                  );
                                },
                              ),
                              SizedBox(width: 10),
                              Text(
                                item.name, 
                                style: const TextStyle(
                                  color: Colors.white, 
                                  fontSize: 20
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}