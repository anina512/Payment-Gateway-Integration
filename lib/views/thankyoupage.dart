import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navdrawer.dart';

class ThankYouPage extends StatefulWidget {
  @override
  _ThankYouPageState createState() => _ThankYouPageState();
}

class _ThankYouPageState extends State<ThankYouPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/plain.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10,MediaQuery.of(context).size.height/6 , 10, 0),
                child: Column(

                  children: [
                    Text("Payment Successful.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.overpass(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize:  35.0,
                    ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        margin: const EdgeInsets.all(30.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                        ),
                        child: Text("Thank you for contributing for the betterment of the world.\n A confirmation e-mail has been sent to you on your registered e-mail ID.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.dancingScript(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize:  25.0,
                        ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black12, // background
                      onPrimary: Colors.black54,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      minimumSize: Size(50, 50),// foreground
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text("DONE!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.prata(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
                ),

              ),
            ),
          ),
        ),
      ),
    );;
  }
}
