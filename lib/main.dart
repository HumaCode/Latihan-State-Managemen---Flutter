import 'package:flutter/material.dart';
import 'package:latihan_state_manajemen/theme.dart';

void main() {
  runApp(const PaymentApps());
}

class PaymentApps extends StatefulWidget {
  const PaymentApps({super.key});

  @override
  State<PaymentApps> createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    // option
    Widget option(int index, String title, String subtitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index ? bluecolor : grey2color,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/circle_active.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/circle_inactive.png',
                          width: 18,
                          height: 18,
                        ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: planTextStyle,
                      ),
                      Text(
                        subtitle,
                        style: subtitleTextStyle,
                      ),
                    ],
                  ),
                  const SizedBox(width: 80),
                  Text(
                    pricing,
                    style: priceTextStyle,
                  )
                ],
              )
            ],
          ),
        ),
      );
    }

    // header
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(top: 50, left: 32, right: 32),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/icon_one.png',
                width: 267,
                height: 200,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to',
                  style: titleTextStyle,
                ),
                const SizedBox(width: 6),
                Text(
                  'Pro',
                  style: titleTextProStyle,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Go unlock all features and \n build your own bussines bigger',
              style: subtitleTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      );
    }

    // button cekout
    Widget checkoutButton() {
      return Column(
        children: [
          SizedBox(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: bluecolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(71),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Checkout Now',
                style: buttonTextStyle,
              ),
            ),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff04112f),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              option(0, 'Mounthly', 'Good for starting up', '\$20'),
              option(1, 'Quarterly', 'Focusing on building', '\$55'),
              option(2, 'Yearly', 'Steady company', '\$220'),
              const SizedBox(height: 50),
              selectedIndex == -1 ? const SizedBox() : checkoutButton(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
