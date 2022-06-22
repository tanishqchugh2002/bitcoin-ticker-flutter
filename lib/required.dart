import 'package:flutter/material.dart';

Widget coinType(int value,String currency,String crypto,bool top){
  return Padding(
    padding:top? EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0):EdgeInsets.fromLTRB(18.0, 0, 18.0, 0),
    child: Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          '1 $crypto = $value $currency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

