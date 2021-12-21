import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_gateway_integration/views/navdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height/2, 0, 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black12, // background
                    onPrimary: Colors.black54,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    minimumSize: Size(200, 100),// foreground
                  ),
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, '/donate');
                  },
                  child: Text("DONATE NOW!",
                  style: GoogleFonts.prata(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
