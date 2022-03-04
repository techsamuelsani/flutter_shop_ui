import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shop/constants.dart';
import 'package:flutter_shop/item.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Shop",
      home:HomeScreen(),
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
    );
    
  }
  
}

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool selected=false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor:Colors.white,
        elevation: 0,
        leading: IconButton(onPressed: ()=>{},icon: SvgPicture.asset("assets/icons/back.svg"),),
        actions:<Widget> [
          IconButton(onPressed: ()=>{}, icon: SvgPicture.asset("assets/icons/search.svg"),color: kTextColor,),
          IconButton(onPressed: ()=>{}, icon: SvgPicture.asset("assets/icons/cart.svg",color:kTextColor)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/2,horizontal: kDefaultPaddin),
            child: Text("Women",style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: kDefaultPaddin),
            child: TopCategories(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: kDefaultPaddin),
            child: CategoryItem(),
          ),


        ],
      )
    );

  }
}

class CategoryItem extends StatelessWidget{
  var allItems= generateItem();
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2,mainAxisSpacing:60,scrollDirection:Axis.vertical,shrinkWrap:true,children: List.generate(6, (index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 200,
              width: 170,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(kDefaultPaddin/2)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin,horizontal: kDefaultPaddin),
                child:Image.asset(allItems[index].itemImage),
              )
          ),
          Text(allItems[index].itemName,style: Theme.of(context).textTheme.headline6?.copyWith(color: kTextLightColor),),
          Text("USD ${allItems[index].itemPrice}",style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.bold,color: kTextColor),),


        ],
      );
    }
    ),);
  }
}



class TopCategories extends StatefulWidget {
  @override
  State<TopCategories> createState() => _TopCategoriesState();
}

class _TopCategoriesState extends State<TopCategories> {
  var categories=["Hand bag","Jwellary","Footware","Dress","Make Up"];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context,index){
              return GestureDetector(
                onTap: ()=>{print("clicked $index"),selectedIndex=index,setState((){})},
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(categories[index]+"         "),
                    Container(height: 3,width: 30,color: selectedIndex==index?Colors.black:Colors.transparent,)
                  ],

                ),
              );
            }
        )
    );
  }
}

