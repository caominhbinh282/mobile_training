import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mymobileapp/screens/searchscreen.dart';
import 'package:provider/provider.dart';

import '../controller/providercontroller.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<ProviderController>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purpleAccent,
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.only(left: 45,top: 100, right: 45),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Logo
                  Container(
                    child: Column(children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.home,
                          size: 60,
                          color: Colors.purpleAccent,
                        ),
                      ),
                      SizedBox(height: 20.0),

                      // App name
                      Text(
                        'App',
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  ),

                  SizedBox(height: 40.0),

                  Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text("Welcome!",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),

                        SizedBox(height: 10.0),

                        TextField(
                          controller: usernameController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Username',
                            labelStyle: TextStyle(
                              color: Colors.white, // Đặt màu chữ là màu trắng
                              fontSize: 15,
                            ),
                            errorText: loginProvider.userLogin == 1
                                ? 'In correct username' : null,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // Đặt màu line khi TextField không được focus
                            ),
                          ),
                        ),
                        // ),
                        SizedBox(height: 10.0),

                        TextField(
                          controller: passwordController,
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              color: Colors.white, // Đặt màu chữ là màu trắng
                              fontSize: 15,
                            ),
                            errorText: loginProvider.passLogin == 1
                                ? 'Incorrect passworld' : null,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors
                                      .white), // Đặt màu line khi TextField không được focus
                            ),
                          ),
                        ),

                        SizedBox(height: 50.0),

                        Container(
                          width: 200,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, // Đặt màu nền của nút
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50.0), // Đặt bán kính để bo tròn nút
                              ),
                            ),
                            onPressed: () {
                              // Xử lý đăng nhập ở đây
                              loginProvider.login(usernameController.text, passwordController.text);
                              if(loginProvider.userLogin == 2 && loginProvider.passLogin == 2) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      SearchScreen()), // Thay NewScreen() bằng màn hình cần điều hướng đến
                                );
                              }
                            },
                            child: Text('Login',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.purpleAccent)),
                          ),
                        ),

                        // Forget password
                        TextButton(
                          onPressed: () {
                            // Xử lý quên mật khẩu ở đây
                          },
                          child: Text(
                            'Forget password?',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 80.0),

                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Don't have an account
                        Text(
                          "Don't have an account?",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        Container(
                          width: 130,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white, // Đặt màu nền của nút
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50.0), // Đặt bán kính để bo tròn nút
                              ),
                            ),
                            onPressed: () {
                              // Xử lý tạo tài khoản ở đây
                            },
                            child: Text('Create',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.purpleAccent)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Login button
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}