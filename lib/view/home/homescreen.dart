import 'dart:developer';

import 'package:apis/controller/bottomnavprovider.dart';
import 'package:apis/controller/productcontroller.dart';
import 'package:apis/utils/appimages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});


  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProductController>().getproducts();
      
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.menu),
        title: Text(
          "smart save",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Our Product",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Spacer(),
                Text("Sort by"),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30),
              child: SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      width: 100,
                      alignment: Alignment.center,
                      child: Text("data"),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Consumer<ProductController>(builder: (context, instanceProvider, child) =>  GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: .5),
                  itemCount: instanceProvider.productdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Image.network(
                            instanceProvider.productdata[index].image??"",
                            height: 250,
                            fit: BoxFit.contain,
                          ),
                          Expanded(
                            child: Column(   
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(instanceProvider.productdata[index].title??"",
                                maxLines: 1,),
                                RatingBarIndicator(
                                  rating: instanceProvider.productdata[index].rating?.rate??0.0,
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                Text("\$ ${instanceProvider.productdata[index].price}")
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Consumer<BottomNavProvider>(
        builder: (context, value, child) =>
         BottomNavigationBar(
          currentIndex: value.bottomindex,
          onTap: (v){
           context.read<BottomNavProvider>().updateindex(v);
          },
          type: BottomNavigationBarType.fixed,
          items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
           BottomNavigationBarItem(icon: Icon(Icons.favorite),label: "Wishlist"),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
             BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
        ]),
      ),
    );
  }
}
