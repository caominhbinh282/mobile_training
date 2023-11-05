import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymobileapp/screens/resultsearchscreen.dart';
import 'package:provider/provider.dart';

import '../controller/providercontroller.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController fromAdressController = TextEditingController();
  TextEditingController toAdressController = TextEditingController();
  String dropdownType = "Type";

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<ProviderController>(context);
    return SafeArea(
      child: Scaffold(
        //-------------------------------AppBar-------------------------------

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.purpleAccent,
          leading: IconButton(
            icon: Icon(Icons.more_vert), // Nút 3 chấm ở góc trái
            onPressed: () {
              // Xử lý khi nút 3 chấm được nhấn
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

        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
          child: Stack(children: [
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
                            padding: EdgeInsets.only(left: 60, top: 30),
                            child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi Jhon",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    "Bus",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                ])),

                        //------------------------Box1------------------------
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 30),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    // Chiều rộng của hình tròn
                                                    height: 30,
                                                    // Chiều cao của hình tròn
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      // Chỉ định hình tròn
                                                      color: Colors
                                                          .green, // Màu của hình tròn
                                                    ),
                                                    child: Icon(
                                                      Icons.send,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 180,
                                                    padding: EdgeInsets.only(
                                                        left: 20),
                                                    child: TextField(
                                                      controller:
                                                          fromAdressController,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'From',
                                                        hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 15,
                                                        ),
                                                        errorText: searchProvider
                                                                    .fromAdress ==
                                                                "1"
                                                            ? 'Address is not available'
                                                            : null,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    // Chiều rộng của hình tròn
                                                    height: 30,
                                                    // Chiều cao của hình tròn
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      // Chỉ định hình tròn
                                                      color: Colors
                                                          .purpleAccent, // Màu của hình tròn
                                                    ),
                                                    child: Icon(
                                                      Icons.location_on,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 180,
                                                    padding: EdgeInsets.only(
                                                        left: 20, bottom: 20),
                                                    child: TextField(
                                                      controller:
                                                          toAdressController,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText: 'To',
                                                        hintStyle: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 12,
                                                        ),
                                                        errorText: searchProvider
                                                                    .toAdress ==
                                                                "1"
                                                            ? 'Address is not available'
                                                            : null,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 30),
                                        child: InkWell(
                                          onTap: () {
                                            // Xử lý khi nút được nhấn
                                            String swap =
                                                fromAdressController.text;
                                            fromAdressController.text =
                                                toAdressController.text;
                                            toAdressController.text = swap;
                                          },
                                          child: Container(
                                            width: 50,
                                            // Kích thước nút (hình tròn)
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              // Hình dạng hình tròn
                                              color: Colors
                                                  .purpleAccent, // Màu nền của hình tròn
                                            ),
                                            child: Icon(
                                              Icons.swap_vert,
                                              color: Colors.white,
                                              size: 30, // Màu sắc của icon
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.only(left: 30, top: 25),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              width: 150,
                                              padding:
                                                  EdgeInsets.only(bottom: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    // Chiều rộng của hình tròn
                                                    height: 30,
                                                    // Chiều cao của hình tròn
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      // Chỉ định hình tròn
                                                      color: Colors
                                                          .green, // Màu của hình tròn
                                                    ),
                                                    child: Icon(
                                                      Icons.send,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.only(
                                                          left: 25),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "PASSENGER",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    // Xử lý khi nút được nhấn
                                                                    searchProvider
                                                                        .setPassenger(
                                                                            false);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 15,
                                                                    // Kích thước nút (hình tròn)
                                                                    height: 15,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      // Hình dạng hình tròn
                                                                      color: Colors
                                                                          .green, // Màu nền của hình tròn
                                                                    ),
                                                                    child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          12, // Màu sắc của icon
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10),
                                                                  child: Text(
                                                                    '${searchProvider.count}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            17),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  onTap: () {
                                                                    // Xử lý khi nút được nhấn
                                                                    searchProvider
                                                                        .setPassenger(
                                                                            true);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: 15,
                                                                    // Kích thước nút (hình tròn)
                                                                    height: 15,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      // Hình dạng hình tròn
                                                                      color: Colors
                                                                          .green, // Màu nền của hình tròn
                                                                    ),
                                                                    child: Icon(
                                                                      Icons.add,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          12, // Màu sắc của icon
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 150,
                                              padding:
                                                  EdgeInsets.only(bottom: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 30,
                                                    // Chiều rộng của hình tròn
                                                    height: 30,
                                                    // Chiều cao của hình tròn
                                                    margin: EdgeInsets.only(
                                                        bottom: 15),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      // Chỉ định hình tròn
                                                      color: Colors
                                                          .purpleAccent, // Màu của hình tròn
                                                    ),
                                                    child: Icon(
                                                      Icons.location_on,
                                                      size: 20,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        left: 25, bottom: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "DEPART",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.grey,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                                          style: TextStyle(
                                                            fontSize: 17,
                                                            color:
                                                                Colors.purple,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                          width: 100,
                                          margin: EdgeInsets.only(
                                              right: 30, bottom: 50),
                                          child: DropdownButton<String>(
                                            hint: Text(
                                              '${searchProvider.dropdownType}',
                                              style:
                                                  TextStyle(color: Colors.grey),
                                            ),
                                            items: <String>['Vip', 'Normal']
                                                .map((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                            onChanged: (String? value) {
                                              searchProvider
                                                  .setDropDown(value!);
                                            },
                                          )),
                                    ]),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          // color: Colors.green,
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Container(
                                height: 65,
                                width: 220,
                                margin: EdgeInsets.only(top: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.purpleAccent,
                                    // Đặt màu nền của nút
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          50.0), // Đặt bán kính để bo tròn nút
                                    ),
                                  ),
                                  onPressed: () {
                                    searchProvider.setLocation(
                                        fromAdressController.text,
                                        toAdressController.text);
                                    if (searchProvider.fromAdress != "" &&
                                        searchProvider.fromAdress != "1" &&
                                        searchProvider.toAdress != "" &&
                                        searchProvider.toAdress != "1") {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ResultSearchScreen()), // Thay NewScreen() bằng màn hình cần điều hướng đến
                                      );
                                    }
                                  },
                                  child: Text(
                                    "SEARCH",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w300),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                )),
          ]),
        ),

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
