import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:local_notifications/res/app_colors.dart';
import 'package:local_notifications/res/app_strings.dart';
import 'package:local_notifications/widgets/room_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List roomType=['Bedroom','Living room','Bathroom','Dining room'];
  List roomRating=['5','3','7','6'];
  List roomImageUrl=[
    'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVkfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    'https://www.beautifulhomes.com/content/dam/beautifulhomes/images/202202/budget-friendly-designs-for-a-modern-living-room-makeover/Feature-house-plants-for-your-contemporary-living-room.webp',
    'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmF0aHJvb218ZW58MHx8MHx8&w=1000&q=80',
    'https://images.unsplash.com/photo-1616486886892-ff366aa67ba4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZGluaW5nJTIwcm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80',
  ];
  final GlobalKey<ScaffoldState> scaffoldKey=GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height/4,right: MediaQuery.of(context).size.width/2.61),
          child: Drawer(
            backgroundColor: AppColors.colorBrown,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topRight: Radius.circular(80),bottomRight: Radius.circular(80))
            ),
            child: Container(
              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/19.5,right: MediaQuery.of(context).size.width/19.5,top: MediaQuery.of(context).size.height/12.3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.home_filled,color: AppColors.colorWhite,),
                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/6.5),
                        child: Text(AppString.txtFamily,style: TextStyle(color: AppColors.colorGrey),),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.important_devices,color: AppColors.colorWhite,),
                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/6.5),
                        child: Text(AppString.txtDevices,style: TextStyle(color: AppColors.colorGrey),),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time_filled_outlined,color: AppColors.colorWhite,),
                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/6.5),
                        child: Text(AppString.txtScenes,style: TextStyle(color: AppColors.colorGrey),),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.settings,color: AppColors.colorWhite,),
                      Container(
                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/6.5),
                        child: Text("Settings",style: TextStyle(color: AppColors.colorGrey),),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/30,bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: Container(
                    height: 20,
                    width: 20,
                    margin: EdgeInsets.only(bottom: 10,left: MediaQuery.of(context).size.width/19.5,),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/menu.png'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: (MediaQuery.of(context).size.width)-60,
                    ),
                    Container(
                      height: 50,
                      width: 60,
                      alignment: Alignment.center,
                      child: Container(
                        height: 40,
                        width: 40,
                        child: Icon(Icons.add,color: AppColors.colorGrey,),
                        decoration: BoxDecoration(
                          color: AppColors.colorWhite,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.colorGrey,
                              blurRadius: 2,
                              spreadRadius: 0.1
                            )
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(40))
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.colorWhite,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 15,
                            spreadRadius: 0.1
                          )
                        ],
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30),topLeft: Radius.circular(30))
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/19.5,),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: "25",style: TextStyle(color: AppColors.colorGrey,fontSize: 50)),
                        TextSpan(text: "\u2103",style: TextStyle(color: AppColors.colorGrey,fontSize: 30)),
                      ]
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/18.45,left: MediaQuery.of(context).size.width/19.5,),
                  child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: "Hello, ",style: TextStyle(color: AppColors.colorGrey,fontSize: 30)),
                          TextSpan(text: "Daniela!",style: TextStyle(color: AppColors.colorGrey,fontSize: 30,fontWeight: FontWeight.bold))
                        ]
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/19.5,),
                  child: Text(AppString.txtWelcome,style: TextStyle(color: AppColors.colorGrey,fontSize: 10),)),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/9.225,bottom: MediaQuery.of(context).size.height/36.9,left: MediaQuery.of(context).size.width/19.5,),
                  child: Text(AppString.txtRooms,style: TextStyle(color: AppColors.colorGrey,fontSize: 17.5,fontWeight: FontWeight.w600),),
                ),
                Expanded(
                  // height: MediaQuery.of(context).size.height/2.3,
                  child: CarouselSlider.builder(
                    itemCount: 4,
                    itemBuilder: (context,index,realIndex){
                      return RoomCard(roomType: roomType[index], roomRating: roomRating[index], imageUrl: roomImageUrl[index]);
                    },
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height/1.8,
                      enableInfiniteScroll: false,
                      enlargeCenterPage: true,
                      // autoPlay: true,
                      // reverse: true,
                      viewportFraction: 0.4,
                    )
                  ),
                  // child: ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: [
                  //     CarouselSlider(
                  //       items: [
                  //         RoomCard(roomType: AppString.txtBedroom, roomRating: "3",imageUrl: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVkfGVufDB8fDB8fA%3D%3D&w=1000&q=80',),
                  //         RoomCard(roomType: AppString.txtLivingRoom, roomRating: "5",imageUrl: 'https://www.beautifulhomes.com/content/dam/beautifulhomes/images/202202/budget-friendly-designs-for-a-modern-living-room-makeover/Feature-house-plants-for-your-contemporary-living-room.webp',),
                  //         RoomCard(roomType: AppString.txtBathroom, roomRating: "6",imageUrl: 'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmF0aHJvb218ZW58MHx8MHx8&w=1000&q=80',),
                  //         RoomCard(roomType: AppString.txtLivingRoom, roomRating: "7",imageUrl: 'https://images.unsplash.com/photo-1616486886892-ff366aa67ba4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZGluaW5nJTIwcm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80',),
                  //       ],
                  //       options: CarouselOptions(
                  //         height: MediaQuery.of(context).size.height/2.3,
                  //         enlargeCenterPage: true,
                  //         autoPlayCurve: Curves.fastOutSlowIn,
                  //         enableInfiniteScroll: false,
                  //         autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //         viewportFraction: 0.8,
                  //         onPageChanged: (position,reason){
                  //           print(reason);
                  //           print(CarouselPageChangedReason.controller);
                  //         }
                  //       )
                  //     )
                  //     // RoomCard(roomType: AppString.txtBedroom, roomRating: "3",imageUrl: 'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YmVkfGVufDB8fDB8fA%3D%3D&w=1000&q=80',),
                  //     // RoomCard(roomType: AppString.txtLivingRoom, roomRating: "5",imageUrl: 'https://www.beautifulhomes.com/content/dam/beautifulhomes/images/202202/budget-friendly-designs-for-a-modern-living-room-makeover/Feature-house-plants-for-your-contemporary-living-room.webp',),
                  //     // RoomCard(roomType: AppString.txtBathroom, roomRating: "6",imageUrl: 'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmF0aHJvb218ZW58MHx8MHx8&w=1000&q=80',),
                  //     // RoomCard(roomType: AppString.txtLivingRoom, roomRating: "7",imageUrl: 'https://images.unsplash.com/photo-1616486886892-ff366aa67ba4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZGluaW5nJTIwcm9vbXxlbnwwfHwwfHw%3D&w=1000&q=80',),
                  //   ],
                  // ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
