import 'package:flutter/material.dart';
import 'package:local_notifications/res/app_colors.dart';

class RoomCard extends StatefulWidget {
  final String roomType;
  final String roomRating;
  final String imageUrl;
  const RoomCard({Key? key,required this.roomType,required this.roomRating,required this.imageUrl}) : super(key: key);

  @override
  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(30)),
      child: Container(
        width: MediaQuery.of(context).size.width/2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.imageUrl),
                fit: BoxFit.cover,
                opacity: 0.7)
              ),
            ),
            Text(widget.roomType,style: TextStyle(color: AppColors.colorWhite,fontSize: 17),maxLines: 2,),
            Positioned(
              top: MediaQuery.of(context).size.height/4,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text("${widget.roomRating}/10",style: TextStyle(color: AppColors.colorWhite,fontSize: 15),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
