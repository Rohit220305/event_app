import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text('Register', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: TSizes.sm),
                  Text('Create your account', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              Form(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
                  child: Column(
                    children: [
                      // First Name
                      TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'First Name'),
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),
                      // Last Name
                      TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Last Name'),
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),
                      // Mobile No
                      TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.call), labelText: 'Mobile No'),
                        keyboardType: TextInputType.phone,
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),
                      // Email
                      TextFormField(
                        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),
                      // Password
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.password_check),
                          labelText: 'Password',
                          suffixIcon: Icon(Iconsax.eye_slash),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      // Register Button
                      SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text("Register"))),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      // OR Divider
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
                      // Google Button
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
                      // Already have account
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?", style: Theme.of(context).textTheme.bodyMedium),
                          TextButton(onPressed: () {}, child: const Text("Login")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
