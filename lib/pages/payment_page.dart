import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

import '../components/custome_buttons.dart';
import 'delivery_page_route.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  //user wants to pay
  void userTappedPay(){
    if(formKey.currentState!.validate()){
      //only show dialog if form is valid

      showDialog(context: context, builder: (context) => AlertDialog(
        title: const Text('Confirm Payment'),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Text('Card Number: $cardNumber'),
              Text('Expiry Date: $expiryDate'),
              Text('Card Holder Name: $cardHolderName'),
              Text('CVV: $cvvCode'),
            ],
          ),
        ),
        actions: [
          //cancel button
          TextButton(
          onPressed: () => Navigator.pop(context),
              child: const Text('CANCEL'),
          ),

          //yes button
          TextButton(
            onPressed: () {
              Navigator.pop(context);
                Navigator.push(
                context,
                    MaterialPageRoute(
                      builder: (context) => DeliveryProgressPage(),

              ),);},
            child: const Text('YES'),
          ),

        ],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('CheckOut'),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              //credit card
              SizedBox(
                height: 200,
                child: CreditCardWidget(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  onCreditCardWidgetChange: (p0) {},
                ),
              ),
          
              //credit card form
              CreditCardForm(
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: (data) {
                    setState(() {
                      cardNumber: data.cardNumber;
                      expiryDate: data.expiryDate;
                      cardHolderName: data.cardHolderName;
                      cvvCode: data.cvvCode;
                    });
                  },
                formKey: formKey,
              ),
          
              //const Spacer(),
          
              MyButton(
                onTap: userTappedPay,
                text: 'Pay Now',
              ),
          
              const SizedBox(height: 25,)

            ],
          ),
        ),
      ),



    );
  }
}
