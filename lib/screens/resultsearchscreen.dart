import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymobileapp/screens/searchscreen.dart';
import 'package:provider/provider.dart';

import '../controller/providercontroller.dart';

class ResultSearchScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final resultSearchProvider = Provider.of<ProviderController>(context);
    return SafeArea(
        child: Scaffold(

        //-------------------------------AppBar-------------------------------

        appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.purpleAccent,
        leading:
        IconButton(
        icon: Icon(Icons.arrow_back_ios), // Nút back ở góc trái
    onPressed: () {
    // Xử lý khi nút back được nhấn
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SearchScreen()), // Thay NewScreen() bằng màn hình cần điều hướng đến
    );
    },
    ),
    actions: <Widget>[
    IconButton(
    icon: const Icon(Icons.account_circle), // Nút account ở góc phải
    onPressed: () {
    // Xử lý khi nút account được nhấn
    },
    ),
    ],
    ),

    //--------------------------------Body--------------------------------

    body:
    Container(
    width: double.infinity,
    height: double.infinity,
    color: Colors.grey,
    child: Stack(
    children: [
    //---------------------------Layout1----------------------------
    ClipRRect(
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(60.0),
    bottomRight: Radius.circular(60.0),
    ),
    child: Container(
    color: Colors.purpleAccent,
    width: double.infinity,
    height: 250,
    ),
    ),

    //---------------------------Layout2----------------------------
    Container(
    width: double.infinity,
    height: double.infinity,
    child: SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    padding: EdgeInsets.only(left: 60,top: 80, right: 60),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children:[
    Text(
    '${resultSearchProvider.fromAdress}',
    style: TextStyle(
    color: Colors.white, fontWeight: FontWeight.w300, fontSize: 17),
    textAlign: TextAlign.left,
    ),
    InkWell(
    onTap: (){
    resultSearchProvider.setLocation(resultSearchProvider.toAdress, resultSearchProvider.fromAdress);
    },
    child: Icon(Icons.swap_horiz, size: 20, color: Colors.white,),
    ),
    Text(
    "${resultSearchProvider.toAdress}",
    style: TextStyle(
    color: Colors.white, fontWeight: FontWeight.w300, fontSize: 17),
    textAlign: TextAlign.left,),
    ]
    )
    ),

    //------------------------Box1------------------------
    Container(
    margin: EdgeInsets.only(top:30),
    padding: EdgeInsets.only(top: 30),
    child: Center(
    child: ClipRRect(
    borderRadius: BorderRadius.circular(30.0),
    child: Container(
    height: 200,
    width: 350,
    // margin: EdgeInsets.only(top: 30.0),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(30.0),
    ),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Container(
    padding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
    Container(
    padding: EdgeInsets.only(bottom: 20),
    child: Row(
    children: [
    Container(
    width: 30, // Chiều rộng của hình tròn
    height: 30, // Chiều cao của hình tròn
    decoration: BoxDecoration(
    shape: BoxShape.circle, // Chỉ định hình tròn
    color: Colors.green, // Màu của hình tròn
    ),
    child: Icon(Icons.send,
    size: 20,
    color: Colors.white,
    ),
    ),
    Container(
    padding: EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "${resultSearchProvider.fromAdress}",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.purple,
    fontSize: 17,
    ),
    ),
    Text(
    "Date",
    style: TextStyle(
    fontSize: 15,
    color: Colors.grey,
    ),
    ),
    ],
    )
    ),
    ],
    ),
    ),

    Container(
    padding: EdgeInsets.only(bottom: 10),
    child: Row(
    children: [
    Container(
    width: 30, // Chiều rộng của hình tròn
    height: 30, // Chiều cao của hình tròn
    decoration: BoxDecoration(
    shape: BoxShape.circle, // Chỉ định hình tròn
    color: Colors.purpleAccent, // Màu của hình tròn
    ),
    child: Icon(Icons.location_on,
    size: 20,
    color: Colors.white,
    ),
    ),
    Container(
    padding: EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Text(
    "${resultSearchProvider.toAdress}",
    style: TextStyle(
    fontWeight: FontWeight.bold,
    color: Colors.purple,
    fontSize: 17,
    ),
    ),
    Text(
    "Date",
    style: TextStyle(
    fontSize: 15,
    color: Colors.grey,
    ),
    ),
    ],
    )
    ),
    ],
    ),
    ),
    ],
    ),
    ),
    Container(
    padding: EdgeInsets.only(right: 30, bottom: 20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Expanded(
    flex: 1,
    child: Container(
    child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
    Text(
    'Type: ',
    style: TextStyle(
    color: Colors.grey,
    fontSize: 12,
    ),
    ),
    Text(
    resultSearchProvider.dropdownType,
    style: TextStyle(
    color: Colors.green,
    fontSize: 12,
    ),
    ),
    ],
    ),
    ),
    ),
    Expanded(
    flex: 1,
    child: Container(
    child: Row(
    children: [
    Text(
    'Quantity: ',
    style: TextStyle(
    color: Colors.grey,
    fontSize: 12,
    ),
    ),
    Text(
    '${resultSearchProvider.count}',
    style: TextStyle(
    color: Colors.green,
    fontSize: 12,
    ),
    ),
    ],
    ),
    ),
    ),
    Expanded(
    flex: 1,
    child: Container(
    child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'Price: ',
    style: TextStyle(
    color: Colors.grey,
    ),
    ),
    Text(
    '\$ ${resultSearchProvider.sumPrice()}',
    style: TextStyle(
    color: Colors.green,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    ),
    ),
    ],
    ),
    ),
    ),
    Expanded(
    flex: 1,
    child: Container(
    width: 120,
    padding: EdgeInsets.only(bottom: 10),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(30.0),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    ),
    child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    primary: Colors.purpleAccent, // Đặt màu nền của nút
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(
    50.0), // Đặt bán kính để bo tròn nút
    ),
    ),
    onPressed: () async{
    if(await confirm(context)){
    return print('Yes');
    }
    return print('No');

    },
    child: Text(
    "BUY TICKET",
    style: TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontWeight:FontWeight.w500
    ),
    ),
    ),
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    ]
    ),
    ),
    ),
    ),
    ),
      //------------------------Box2------------------------
      Container(
        padding: EdgeInsets.only(top: 30),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Container(
              height: 200,
              width: 350,
              // margin: EdgeInsets.only(top: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Row(
                              children: [
                                Container(
                                  width: 30, // Chiều rộng của hình tròn
                                  height: 30, // Chiều cao của hình tròn
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle, // Chỉ định hình tròn
                                    color: Colors.green, // Màu của hình tròn
                                  ),
                                  child: Icon(Icons.send,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          resultSearchProvider.toAdress,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text(
                                          "Date",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Container(
                                  width: 30, // Chiều rộng của hình tròn
                                  height: 30, // Chiều cao của hình tròn
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle, // Chỉ định hình tròn
                                    color: Colors.purpleAccent, // Màu của hình tròn
                                  ),
                                  child: Icon(Icons.location_on,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 20, top: 15, bottom: 15, right: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          resultSearchProvider.fromAdress,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.purple,
                                            fontSize: 17,
                                          ),
                                        ),
                                        Text(
                                          "Date",
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 30, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Type: ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    resultSearchProvider.dropdownType,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                children: [
                                  Text(
                                    'Quantity: ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    '${resultSearchProvider.count}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Price: ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    '\$ ${resultSearchProvider.sumPrice()}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 120,
                              padding: EdgeInsets.only(bottom: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.purpleAccent, // Đặt màu nền của nút
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            50.0), // Đặt bán kính để bo tròn nút
                                      ),
                                    ),
                                    onPressed: (){

                                    },
                                    child: Text(
                                      "BUY TICKET",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight:FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]
              ),
            ),
          ),
        ),
      ),


    ]
    ),
    )
    ),
    ]
    ),),


          //-------------------------------Bottom-------------------------------

          bottomNavigationBar: BottomNavigationBar(
            // currentIndex: _currentIndex,
            // onTap: _onItemTapped,
            items: const [
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.home, color: Colors.purpleAccent),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.compass_calibration, color: Colors.purpleAccent),
                label: 'La Bàn',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.access_time, color: Colors.purpleAccent),
                label: 'Time',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.person, color: Colors.purpleAccent),
                label: 'User',
              ),
            ],
          ),
        ),
    );
  }

}