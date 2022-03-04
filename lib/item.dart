import 'package:flutter/material.dart';

class Item{
  var itemColor;
  var itemName;
  var itemPrice;
  var itemImage;
  Item(this.itemColor,this.itemName,this.itemPrice,this.itemImage);


}
generateItem(){
  var items=[];
  Item item1=Item(Colors.blue,"Item 1",10,"assets/images/bag_1.png");
  Item item2=Item(Colors.green,"Item 2",20,"assets/images/bag_2.png");
  Item item3=Item(Colors.red,"Item 3",30,"assets/images/bag_3.png");
  Item item4=Item(Colors.amber,"Item 4",40,"assets/images/bag_4.png");
  Item item5=Item(Colors.deepPurple,"Item 5",50,"assets/images/bag_5.png");
  Item item6=Item(Colors.pink,"Item 6",60,"assets/images/bag_6.png");
  items.add(item1);
  items.add(item2);
  items.add(item3);
  items.add(item4);
  items.add(item5);
  items.add(item6);
  return items;
}