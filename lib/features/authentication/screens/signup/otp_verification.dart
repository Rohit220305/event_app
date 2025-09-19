import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> _otpControllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  int _secondsRemaining = 60;
  late final ticker;

  @override
  void initState() {
    super.initState();
    ticker = _startTimer();
  }

  @override
  void dispose() {
    ticker.cancel();
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  _startTimer() {
    return Future.delayed(const Duration(seconds: 1), () {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
        ticker = _startTimer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add vertical space before back button to position it just above the OTP Verification text
            SizedBox(height: TSizes.appBarHeight),
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                // Navigator.pop(context);
              },
              padding: EdgeInsets.only(
                  left: TSizes.defaultSpace
              ),
            ),
            // All other content padded to align in one vertical line
            Padding(
              padding: EdgeInsets.only(
                left: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('OTP Verification', style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: TSizes.sm),
                  Text('Enter the 4-digit code sent to your email', style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Form(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(4, (index) {
                            return SizedBox(
                              width: 60,
                              child: TextFormField(
                                controller: _otpControllers[index],
                                focusNode: _focusNodes[index],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1,
                                decoration: const InputDecoration(
                                  counterText: '',
                                  border: OutlineInputBorder(),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    _otpControllers[index].text = value.substring(value.length - 1);
                                    if (index < 3) {
                                      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                                    } else {
                                      FocusScope.of(context).unfocus();
                                    }
                                  } else {
                                    if (index > 0) {
                                      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
                                    }
                                  }
                                },
                                onTap: () {
                                  _otpControllers[index].selection = TextSelection.fromPosition(
                                    TextPosition(offset: _otpControllers[index].text.length),
                                  );
                                },
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text('Continue'),
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        Text(
                          _secondsRemaining > 0
                              ? 'Resend code in 00:${_secondsRemaining.toString().padLeft(2, '0')}'
                              : 'Resend code',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: TColors.darkerGrey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
