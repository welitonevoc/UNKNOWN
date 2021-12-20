import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buttonRounded(
  String text, {
  isRoudedLeft: false,
  isRoudedRight: true,
  Function()? callback,
}) {
  return InkWell(
      onTap: callback,
      child: Container(
          padding: EdgeInsets.only(left: 4.0, top: 8.0, bottom: 8.0, right: 8),
          decoration: BoxDecoration(
            borderRadius: isRoudedLeft
                ? BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  )
                : isRoudedRight
                    ? BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      )
                    : BorderRadius.all(Radius.circular(10.0)),
            color: Color(0xFF738369),
          ),
          child: Text(
            text,
            style: GoogleFonts.rufina(
                fontStyle: FontStyle.normal,
                textStyle: TextStyle(fontSize: 14)),
          )));
}
