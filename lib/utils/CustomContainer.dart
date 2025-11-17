import 'package:flutter/material.dart';

class customContainer {
  static container({required Icon? icon, required String text}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: 80,
      width: 200,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          icon ?? Icon(Icons.help_outline),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static longContainer({
    required Icon? icon,
    required String text,
    Color? color,


  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey, // outline color
          width: 0.4, // outline thickness
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10),
              child:
                  icon ??
                  Icon(Icons.help_outline,),
            ),

            SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: color ?? Colors.black,
                ),
              ),
            ),
            Icon(Icons.arrow_right_sharp),
          ],
        ),
      ),
    );
  }
}
