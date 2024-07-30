import 'package:devmaters_delivery/Views/pages/homepage/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    bool _obscureText = true;
    bool emailFieldVisible =true;

    void _togglePasswordVisibility() {
      setState(() {
        _obscureText = !_obscureText;
      });
    }
    void dispose() {
      // Clean up the controllers when the widget is disposed.
      _emailController.dispose();
      _passwordController.dispose();

      super.dispose();
    }


    return Scaffold(
      backgroundColor: Colors.white,


      body: Column(
        children: [
          Image.asset("assets/res/login.jpg",height: 300,),
          Expanded(
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(topRight: Radius.circular(40),topLeft: Radius.circular(40))
              ),
              child:SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Toolbar equivalent
                    Container(
                      height: 56.0, // Equivalent to @dimen/toolbar_height
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 30.0) ,
                      child: const Text(
                        'Login or Sign Up',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    // Line below toolbar equivalent
                    Container(
                      height: 1.0,
                      color: Colors.grey[300],

                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        // Email Field Layout equivalent

                        // Phone Field Layout equivalent
                        Padding(
                          padding: const EdgeInsets.all( 10.0), // Equivalent to @dimen/_20sdp
                          child: Container(

                            child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[

                                    // Phone number layout equivalent
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Visibility(
                                        visible: true,


                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 20.0), // Equivalent to @dimen/_20sdp
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(4.0),
                                            ),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                hintText: 'Email',
                                                border: OutlineInputBorder(borderRadius: BorderRadius.zero),
                                                contentPadding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0), // Equivalent to @dimen/_3sdp for padding top
                                                hintStyle: TextStyle(color: Colors.grey), // Equivalent to @color/text_color_grey
                                              ),
                                              controller:_emailController,
                                              validator: (value) {
                                                if (value == null || value.isEmpty) {
                                                  return 'Please Enter your Email ';
                                                }
                                                String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                                                RegExp regExp = RegExp(pattern);
                                                if (!regExp.hasMatch(value)) {
                                                  return 'Please enter a valid email address';
                                                }
                                                return null;

                                              },
                                              style: const TextStyle(
                                                color: Colors.black, // Equivalent to @color/text_color_black
                                                fontSize: 13.0, // Equivalent to @dimen/_13sdp
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Visibility(
                                        visible: false,
                                        child:TextFormField(
                                          decoration: const InputDecoration(
                                            hintText: 'Phone Number',


                                            border:OutlineInputBorder(borderRadius: BorderRadius.zero),
                                            contentPadding: EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0), // Equivalent to @dimen/_3sdp for padding top
                                            hintStyle: TextStyle(color: Colors.grey), // Equivalent to @color/text_color_grey
                                          ),
                                          keyboardType: TextInputType.phone,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please Enter your Phone Number';
                                            }
                                            if (value.length != 10) {
                                              return 'Please enter a valid phone number';
                                            }
                                            return null;

                                          },



                                          style: const TextStyle(
                                            color: Colors.black, // Equivalent to @color/text_color_black
                                            fontSize: 12.0, // Equivalent to @dimen/_12sdp
                                          ),
                                        )),
                                    TextFormField(
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
                                        contentPadding: const EdgeInsets.symmetric(vertical: 11.0, horizontal: 10.0),
                                        hintStyle: const TextStyle(color: Colors.grey),
                                        suffixIcon: GestureDetector(
                                          onTap: _togglePasswordVisibility,
                                          child: Icon(
                                            _obscureText ? Icons.visibility : Icons.visibility_off,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      obscureText: _obscureText,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please Enter your Password';
                                        }
                                        // Add any additional password validation logic here if needed
                                        return null;
                                      },
                                      controller: _passwordController,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                    ),

                                  ],
                                )
                            ),


                          ),
                        ),
                        // TextView "We'll call or text to confirm" equivalent
                        const Padding(
                          padding: EdgeInsets.only(top: 5.0,left: 5.0,right: 5.0),
                          // Equivalent to @dimen/_5sdp
                          child: Text(
                            "We'll call or text to confirm your number,Standard message and data rates apply",
                            style: TextStyle(
                              fontFamily: 'AirbnbCerealMedium', // Equivalent to @font/airbnbcerealmedium
                              fontSize: 11.0, // Equivalent to @dimen/_11sdp
                              color: Colors.black, // Equivalent to @color/text_color_black
                            ),
                          ),
                        ),
                        // Continue button equivalent
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0), // Equivalent to @dimen/_30sdp
                          child: Center(

                            child: ElevatedButton(

                              //  onPressed: _submitForm, // Equivalent to android:enabled="false"
                              onPressed: () {
                               Get.offAll(Homepage(),transition: Transition.noTransition
                                );
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.grey), // Equivalent to @drawable/un_selected_btn_grey
                              ),
                              child: const Text(
                                'Login', // Equivalent to @string/continue_string
                                style: TextStyle(
                                  color: Colors.white, // Equivalent to custom:textColor="@color/white"
                                  fontSize: 18.0, // Equivalent to @dimen/btn_textSize
                                ),
                              ),
                            ),
                          ) ,
                        ),
                        // "or" divider equivalent
                        const Padding(
                          padding: EdgeInsets.only(top: 35.0), // Equivalent to @dimen/_35sdp
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 45, // Equivalent to android:layout_weight="4.5"
                                child: Divider(color: Colors.grey),
                              ),
                              Expanded(
                                flex: 10, // Equivalent to android:layout_weight="1"
                                child: Text(
                                  'or',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black, // Equivalent to @color/text_color_black
                                    fontSize: 10.0, // Equivalent to @dimen/_10sdp
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 45, // Equivalent to android:layout_weight="4.5"
                                child: Divider(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        // Continue with Email button equivalent
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0,right: 8.0,left: 8.0), // Equivalent to @dimen/_20sdp
                          child: Container(
                            height: 48.0, // Equivalent to @dimen/btn_height
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.email, size: 20.0),
                                SizedBox(width: 10.0),
                                Text(
                                  'Continue with Gmail',
                                  style: TextStyle(
                                    color: Colors.black, // Equivalent to @color/text_color_black
                                    fontSize: 18.0, // Equivalent to @dimen/btn_textSize
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0,right: 8.0,left: 8.0), // Equivalent to @dimen/_20sdp
                          child: Container(
                            height: 48.0, // Equivalent to @dimen/btn_height
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(Icons.facebook, size: 20.0),
                                SizedBox(width: 10.0),
                                Text(
                                  'Continue with Facebook',
                                  style: TextStyle(
                                    color: Colors.black, // Equivalent to @color/text_color_black
                                    fontSize: 18.0, // Equivalent to @dimen/btn_textSize
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Other social login buttons can be added similarly
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
