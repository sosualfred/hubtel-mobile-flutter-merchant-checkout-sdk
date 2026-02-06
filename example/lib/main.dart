import 'package:flutter/material.dart';
import 'package:hubtel_merchant_checkout_sdk/hubtel_merchant_checkout_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final hubtelConfig = HubtelCheckoutConfiguration(
      merchantApiKey:
          "QTN1akQ1SzpiM2IxMjA1NTEwZmI0NjYzYTdiY2ZmZmUyNmQ1YmIzZA==",
      merchantID: "1122334",
      callbackUrl: "www.sdfasd.com",
    );
    final purchaseInfo = PurchaseInfo(
      amount: 0.1,
      customerPhoneNumber: '0541234567',
      clientReference: "test1234567890",
      purchaseDescription: 'Camera',
    );
    final themeConfig = ThemeConfig(primaryColor: Colors.black);

    return Scaffold(
      appBar: AppBar(title: const Text('Hubtel Merchant Checkout SDK')),
      body: Column(
        children: [
          const Center(child: Text('Hubtel Merchant Checkout SDK')),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return CheckoutScreen(
                      purchaseInfo: purchaseInfo,
                      configuration: hubtelConfig,
                      themeConfig: themeConfig,
                    );
                  },
                ),
              );
            },
            child: const Text('Pay'),
          ),
        ],
      ),
    );
  }
}
