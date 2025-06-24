import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:taskbygithub/home/nav_bar.dart';

class FingerprintScreen extends StatefulWidget {
  const FingerprintScreen({super.key});

  @override
  State<FingerprintScreen> createState() => _FingerprintScreenState();
}

class _FingerprintScreenState extends State<FingerprintScreen> {
  final LocalAuthentication auth = LocalAuthentication();

  Color borderColor = Colors.grey;
  String statusText =
      'Please place your finger on the fingerprint sensor to get started';
  bool isAuthSuccessful = false;

  Future<void> authenticate() async {
    setState(() {
      borderColor = Colors.orange;
    });

    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Place your finger to authenticate',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );

      if (authenticated) {
        setState(() {
          borderColor = Colors.green;
          statusText = '✅ Authentication successful';
          isAuthSuccessful = true;
        });
        await Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => NavBar()));
          }
        });
      } else {
        setState(() {
          borderColor = Colors.red;
          statusText = '❌ Authentication failed';
        });
      }
    } catch (e) {
      setState(() {
        borderColor = Colors.red;
        statusText = '❌ Error occurred: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: const Color(0xFFEAF8FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Fingerprint Security',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Secure your account with your fingerprint using Fingerprint Security',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            // AnimatedContainer(
            //   duration: const Duration(milliseconds: 500),
            //   padding: const EdgeInsets.all(30),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: borderColor, width: 4),
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   child:
               Icon(
                Icons.fingerprint,
                size: 120,
                color: borderColor,
              ),
            // ),
            const SizedBox(height: 30),
            Text(
              statusText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: authenticate,
              style: ElevatedButton.styleFrom(
                backgroundColor: isAuthSuccessful ? Colors.green : Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text('Continue'),
            ),
            //TextButton(onPressed: () {}, child: const Text('Skip')),
          ],
        ),
      ),
    );
  }
}
