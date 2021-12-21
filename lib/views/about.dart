import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_gateway_integration/views/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:link_text/link_text.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        systemOverlayStyle: SystemUiOverlayStyle.dark,

      ),
      drawer: NavDrawer(),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/black.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/logo.jpeg"),
                    ),
                    SizedBox(height: 30),
                    Text("Contact info", style: GoogleFonts.dancingScript(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize:  40.0,
                    ),
                    ),
                    SizedBox(height: 30),
                    Text("Anina Pillai\n\nCS Undergrad at K.J. Somaiya College of Engineering\n\nMobile App Development Intern at The Sparks Foundation\n\nTask #3: Payment Gateway Integration\n\nE-mail address: anina.pillai@somaiya.edu\n",
                      style: GoogleFonts.dancingScript(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize:  20.0,
                      ),
                    ),
                    LinkText(
                      "LinkedIn: https://www.linkedin.com/in/anina-pillai-2a904b220/\n\nGithub: https://github.com/anina512",
                      textStyle: GoogleFonts.dancingScript(
                          color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize:  20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
