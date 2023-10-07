import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({Key? key}) : super(key: key);

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

var code = ""; // Store the entered OTP here

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  TextEditingController otpController = TextEditingController();
  EmailOTP myAuth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(
                height: 10,
              ),
            ),
            SizedBox(
              height: mq.height * 0.04,
            ),
            const Text(
              "Verify Phone",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            SizedBox(
              height: mq.height * 0.01,
            ),
            const Text(
              "Code is sent to Your Number",
              style: TextStyle(color: Colors.blueGrey, fontSize: 17),
            ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            Pinput(
              length: 4,
              showCursor: true,
              onChanged: (value) {
                code = value;
              },
            ),
            SizedBox(
              height: mq.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Request Again",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: mq.height * 0.02,
            ),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(mq.width * 0.85, mq.height * 0.1),
                ),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff2e3b62)),
              ),
              onPressed: () async {
                // if(await widget.myAuth.v)
              },
              child: Text(
                "VERIFY AND CONTINUE",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: mq.width * 0.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
