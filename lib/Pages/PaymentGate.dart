import 'package:Gogodo/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'rounded_button.dart';
//import 'package:shared_preferences/shared_preferences.dart';



class PaymentGate extends StatefulWidget {
  //static const String id = 'payment_gate';
   //PaymentGate({Key  key}) : super (key : key);


  @override
  PaymentGateState createState() => PaymentGateState();
}

class PaymentGateState extends State<PaymentGate> {
  late Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController() ;
  // SharedPreferences preferences;
  // String pay = "";
  // String contentMsg;
  // String payment;
  //final FocusNode payFocusNode = FocusNode();
  //TextEditingController payTextEditingController;
  //SharedPreferences preferences;
   //String pay = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = new Razorpay();
    razorpay.on (Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   readDataFromLocal();
  // }



  // void readDataFromLocal()async
  // {
  //   preferences = await SharedPreferences.getInstance();
  //
  //   pay = preferences.getString("contentMsg");
  //   payTextEditingController = TextEditingController(text: pay);
  //
  // }




  void openCheckout(){
    var options =
    {
      "key" : "rzp_live_gu2g2lXF7ppuKR",
      "amount" : num.parse(textEditingController.text)*100,//+(2/100)*num.parse(textEditingController.text)*100,
      "name": "Prototype",
      "Description": "Gogodo Payment Gateway",
      "prefill":
      {
        "contact": "",
        "email": "",
        "name": "enter",
      },
      "External" :
      {
        "Wallets" : ["paytm"]
      }
    };
    try
    {
      razorpay.open(options);

    }catch(e){
      print(e.toString());
    }
  }

  void handlerPaymentSuccess()
  {
    print("Payment Success");


  }

  void handlerPaymentError()
  {
    print("Payment Error");
  }

  void handlerExternalWallet()
  {
    print("External Wallet");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razor Pay"),
      ),

        body: Padding(

          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              // TextField(
              //
              //   //controller: textEditingController,
              //   decoration: InputDecoration(
              //       hintText: "Name of the freelancer"
              //   ),
              //
              // ),
              // SizedBox(height: 12.0,),

            TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                hintText: "Amount To Pay"
            ),

          ),
          SizedBox(height: 12.0,),


              Container(
                child: TextButton(
                  onPressed: openCheckout,
                  child: Text(
                    'Pay Now',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.primaryColor),
                    padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.fromLTRB(30, 10, 30, 10),
                    ),
                  ),
                ),
                margin: EdgeInsets.only(top: 50, bottom: 50),
              ),



            // GestureDetector(
            //   onTap: openCheckout,
            //   // child: RoundedButton(
            //   //   title: 'pay now',
            //   //   colour: Colors.lightBlueAccent,
            //   //
            //   //   // onPressed: () {
            //   //   //
            //   //   // },
            //   // ),
            // ),

          ],
        ),
      ),
    );
  }
}
