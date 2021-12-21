import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_gateway_integration/views/navdrawer.dart';
import 'package:payment_gateway_integration/views/thankyoupage.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
  bool paymentDone = false;
  Razorpay razorpay =  Razorpay();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController contactEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  late String email;
  late String donation_amount;
  late String contact;
  late String name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay =  Razorpay();


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }
  void createSnackBar(String message) {
    final snackBar = new SnackBar(content: new Text(message),
        backgroundColor: Colors.red);

    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
    Scaffold.of(context).showSnackBar(snackBar);
  }
bool validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return false;
    else
      return true;
  }
  void openPaymentCheckout(){
    name = nameEditingController.text;
    email = emailEditingController.text;
    contact = contactEditingController.text;
    donation_amount = num.parse(textEditingController.text).toString();
    var options = {
      "key": "rzp_test_7i7i5ldYhvdkEk",
      "amount": num.parse(textEditingController.text)*100,
      "name": "Payment Gateway Integration App",
      "description": "Donation to support the cause",
      "prefill": {
        "contact": contactEditingController.text,
        "email": emailEditingController.text,
      },
      "external": {
        "wallets": ["paytm"]
      },
    };
    try{
      razorpay.open(options);
    }
    catch(e){
      print(e.toString());
    }
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);

  }
  Future sendEmail({required String email_id, required String contact_num, required String donation_am, required String name}) async
  {
    final serviceId = "service_3jwd3kt";
    final userId = "user_EczMark8TmswqwxQCW7JU";
    final templateId = "template_0q64hpk";
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
      headers: {
      'origin': 'http://localhost',
      "Content-Type": 'application/json',
      },
      body: json.encode({
      "service_id": serviceId,
        "template_id": templateId,
        "user_id": userId,
        "template_params": {
        "user_name": name,
        'user_email': email_id,
          'user_contact': contact_num,
          'donation_amount':donation_am,
        }
      })
    );

  }
  void handlePaymentSuccess(PaymentSuccessResponse response) {
    setState(() {
      paymentDone = true;
      //Navigator.pushReplacementNamed(context, 'thankyou');
    });
    print("success");
    Fluttertoast.showToast(
        msg: "Payment Successful. Thank you.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 50,
        backgroundColor: Colors.greenAccent,
        textColor: Colors.white,
        fontSize: 20.0
    );
    sendEmail(email_id:email , contact_num: contact, donation_am: donation_amount, name: name);
    razorpay.clear();

  }
  void handlePaymentFailure(PaymentFailureResponse response) {
    print("failure");
    Fluttertoast.showToast(
        msg: "Payment Failure. Try Again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 50,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 20.0
    );
    razorpay.clear();

  }
  void handleExternalWallet(ExternalWalletResponse response) {
    setState(() {
      paymentDone = true;
    });
    print("external wallet");
    Fluttertoast.showToast(
        msg: "External Wallet.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 50,
        backgroundColor: Colors.purpleAccent,
        textColor: Colors.white,
        fontSize: 20.0
    );
    razorpay.clear();

  }
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (paymentDone == true) {
      return ThankYouPage();
    }
    else
      {
      return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
          elevation: 10.0,
          title: Text("Payment Gateway Integration"),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarHeight: 50,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          systemOverlayStyle: SystemUiOverlayStyle.dark,

      ),
      drawer: NavDrawer(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/hill.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 70.0, 30.0, 0),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Donation Form", style: GoogleFonts.overpass(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize:  40.0,
                  ),
                  ),
                  SizedBox(height: 15.0),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: nameEditingController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person),
                              hintText: 'Enter your name',
                              labelText: 'Name',
                            ),
                            validator: (value) {
                              if (value!=null) {
                                return null;
                              }
                              else
                                {
                                  return "Do not leave this field blank.";
                                }
                            },
                          ),
                          TextFormField(
                            controller: emailEditingController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.mail),
                              hintText: 'Enter a valid e-mail address',
                              labelText: 'E-mail Id',
                            ),
                            validator: (value) {
                              if (validateEmail(value)) {
                                return null;
                              }
                              return "Please enter a valid e-mail address";
                            },
                          ),
                          TextFormField(
                            controller: contactEditingController,
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.phone),
                              hintText: 'Enter a valid 10-digit phone number',
                              labelText: 'Phone Number',
                            ),
                            validator: (value) {
                              if (value!.isEmpty || value.length!=10) {
                                return 'Please enter valid phone number';
                              }
                              return null;
                            },
                          ),
                          TextField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                              icon: const Icon(Icons.money),
                              hintText: "Enter payment amount",
                              labelText: "Donation Amount",
                            ),
                          ),
                        ],
                      ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black45, // background
                        onPrimary: Colors.black54, // foreground
                      ),
                      onPressed:(){
                        if (_formKey.currentState!.validate()) {
                          openPaymentCheckout();
                        }
                      },
                      child: Text("Donate", style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.all(30.0),
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                    ),
                    child: Text("\"It's not how much we give but how much love we put into giving.\"\n― Mother Theresa",
                      style: GoogleFonts.dancingScript(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      fontSize:  20.0,
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    ],
        ),
      ),
    );
  }
  }
}
