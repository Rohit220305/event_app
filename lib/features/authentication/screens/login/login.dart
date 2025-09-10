import 'package:connected_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen  extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: TSizes.appBarHeight,
            left: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image(
                  //   height: 150,
                  //   // image: AssetImage(TImages.darkAppLogo),
                  // ),
                  Text(TTexts.tLoginTitle, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: TSizes.sm),
                  Text(TTexts.tLoginSubTitle, style: Theme.of(context).textTheme.bodyMedium),


                ],
              ) ,// Column

              ////form
              // Form
              Form(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      // Email
                      TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email),
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      // Password
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: TTexts.password,
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields / 2),

                      // Remember Me & Forget Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Remember Me
                          Row(
                            children: [
                              Checkbox(value: true, onChanged: (value) {}),
                              const Text(TTexts.tRememberMe),
                            ],
                          ), // Row

                          // Forget Password
                          TextButton(onPressed: () {}, child: const Text("Forget Password?")),
                        ],
                      ), // Row
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // Sign In Button
                      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text("Sign In"))),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      // Create Account Button
                      SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () {}, child: const Text('Create an Account'))),
                      const SizedBox(height: TSizes.spaceBtwSections),
                    ],
                  ),
                ),
              ),

              //divider


              // const SizedBox(height: TSizes.spaceBtwSections),

              Row(
                children: [
                  Expanded(child: Divider(color: TColors.grey, thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR',
                      style: TextStyle(color: TColors.grey, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(child: Divider(color: TColors.grey, thickness: 1)),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Google Button (after OR)
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: TColors.grey),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                  ),
                  icon: Image(
                    width: TSizes.iconMd,
                    height: TSizes.iconMd,
                    image: AssetImage(TImages.google),
                  ),
                  label: const Text('Continue with Google'),
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
// Footer
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: const Image(
//                         width: TSizes.iconMd,
//                         height: TSizes.iconMd,
//                         image: AssetImage(TImages.google),
//                       ), // Image
//                     ), // IconButton
//                   ), // Container
//                   const SizedBox(width: TSizes.spaceBtwItems),
//                   // Container(
//                   //   decoration: BoxDecoration(border: Border.all(color: TColors.grey), borderRadius: BorderRadius.circular(100)),
//                   //   child: IconButton(
//                   //     onPressed: () {},
//                   //     icon: const Image(
//                   //       width: TSizes.iconMd,
//                   //       height: TSizes.iconMd,
//                   //       image: AssetImage(TImages.facebook),
//                   //     ), // Image
//                   //   ), // IconButton
//                   // ), // Container
//                 ],
//               ) // Row


            ],
          ),

        ),
      ),
      
      
    );
  }
}

