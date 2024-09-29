import 'dart:developer';

import 'package:apis/model/productmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

class ProductController extends ChangeNotifier{


  List<ProductModel>productdata=[];

  void getproducts()async{
   final response=await http.get(Uri.parse("https://fakestoreapi.com/products"));

   if(response.statusCode==200){

    final productModel = productModelFromJson(response.body);
    productdata=productModel;
    notifyListeners();

   }
   else{
    log("error");
   }
  }
}