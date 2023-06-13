import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tt_food_shop/screens/bin_screen/bin_work/bin_work.dart';

class ItemTile extends StatefulWidget {
  final BinProduct item;
  final Function() onTapMinus;
  final Function() onTapPlus;
  const ItemTile({super.key, required this.item, required this.onTapMinus, required this.onTapPlus});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        widget.item.dish.imageUrl??'',
        width: 62.r,
        height: 62.r,
      ),
      title: Text(widget.item.dish.name!,style:TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500,color: Colors.black),),
      subtitle: Row(
        children: [
          Text(
            '${widget.item.dish.price} ₽',
            style: TextStyle(fontSize: 14.0.sp,fontWeight: FontWeight.w500,color: Colors.black),
          ),
          Text(
            ' · ${widget.item.dish.weight}',
            style: TextStyle(fontSize: 14.0.sp),
          ),
        ],
      ),
      trailing: Container(
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: const Color(0xffEFEEEC)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove,size: 24.r,),
              onPressed:widget.onTapMinus,
            ),
            Text(widget.item.index.toString()),
            IconButton(
              icon: Icon(Icons.add,size: 24.r,),
              onPressed:widget.onTapPlus,
            ),
          ],
        ),
      ),
    );
  }
}