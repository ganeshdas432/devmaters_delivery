import 'package:devmaters_delivery/fetaures/home/view/page/homepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/register_controller.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final RegistrationController registrationController = Get.put(RegistrationController());


  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController genderController = TextEditingController();

  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => registrationController.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
              child: Column(
                        children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name',border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              SizedBox(height: 16,),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email',border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16,),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password',border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                obscureText: true,  // Hide password input
              ),
              SizedBox(height: 16,),
              TextField(
                controller: confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password',border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                obscureText: true,
              ),
              SizedBox(height: 16,),
              TextField(
                controller: mobileController,
                decoration: InputDecoration(labelText: 'Mobile',border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                obscureText: false,
              ),
              SizedBox(height: 16,),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age',border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                obscureText: false,
              ),
              SizedBox(height: 16,),
              DropdownButtonFormField<String>(
                value: selectedGender,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedGender = newValue;
                    genderController.text = newValue!;
                  });
                },
                decoration: InputDecoration(labelText: 'Gender',border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                items: <String>['Male', 'Female', 'Other']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              
              SizedBox(height: 20),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: () {
                    final name = nameController.text;
                    final email = emailController.text;
                    final password = passwordController.text;
                    final confirmPassword = confirmPasswordController.text;
                    final mobile = int.parse(mobileController.text);
                    final age = int.parse(ageController.text);
                    final status=1;
                    final gender=selectedGender.toString();
              
              
                    print(mobile);
              
              
                    // Call the registration method
                    registrationController.register(name, email, password, confirmPassword,mobile,age,status,gender).then((value) {
                      Get.offAll(Homepage());
                    },);
                  },
                  child: Text('REGISTER'),
                ),
              ),
                        ],
                      ),
            )),
      ),
    );
  }
}
