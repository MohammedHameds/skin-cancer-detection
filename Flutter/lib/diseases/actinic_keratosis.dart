import 'package:flutter/material.dart';
import 'package:flutter_application_1/diseases/diseases.dart';
import 'package:flutter_application_1/history/history.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/skin_test/1-test_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/skin_test/3-display_image.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Actinic_keratosis extends StatefulWidget {
  const Actinic_keratosis({ Key? key }) : super(key: key);

  @override
  State<Actinic_keratosis> createState() => _Actinic_keratosisState();
}

class _Actinic_keratosisState extends State<Actinic_keratosis> {
bool agree = false;
   var infotxt;
  var diseases_or_test ;

  Future<void> _loadData() async {
    final _loadedData = await rootBundle.loadString('assets/7.txt');
    setState(() {
      infotxt = _loadedData;
      print(infotxt);
    });
  }

  getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      diseases_or_test = prefs.getString('diseases_or_test');
    });


    print('-----------------------');
    print(diseases_or_test);
    print('-----------------------');

    print('get Pref of page3 has been done');
  }

@override
void initState() {
  getPref() ;
  _loadData() ;
  super.initState();
}

  @override
  void dispose() {
    super.dispose();
    }

@override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              if (diseases_or_test == 'diseases'){
                Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Diseases()),);
            }
            else if (diseases_or_test == 'history'){
                Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => History()));
            } 

            else{
              Navigator.of(context).pop();
              Navigator.push(context,MaterialPageRoute(builder: (context) => Display_image()),);
            }
                             }, icon: Icon(Icons.arrow_back_outlined)
            ),
        
         actions: [
           IconButton(onPressed: (){
                Navigator.of(context).pop();
                Navigator.push(context,MaterialPageRoute(builder: (context) => Home()),);           
                }, icon: Icon(Icons.home_sharp)),
            
        ],
        flexibleSpace: Expanded(
          child: Container(
            padding:EdgeInsets.only(top:35),
            child: Text('Actinic Keratosis',style: TextStyle(fontSize:20,color: Colors.white ,fontWeight:FontWeight.bold),),
            alignment:Alignment.center,
              decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[Colors.black, Colors.blue ]),
              ),
            ),
        ),
  ),

 
      body: Container(
        decoration : BoxDecoration(
                     gradient: LinearGradient(
                      //  colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 174, 217, 255)],
                      //  colors: [Color.fromARGB(255, 96, 165, 239), Color.fromARGB(255, 153, 204, 250)], // mahmoud
                       colors: [Color.fromARGB(146, 147, 226, 255), Color.fromARGB(255, 227, 245, 255)],

                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                     ),
                ),  
        child: ListView(
          children: [ 
            SizedBox(height:10),   
            Container(
              height: 300,
              width: double.infinity,
              padding:EdgeInsets.symmetric(vertical : 0,horizontal: 5),
              child: Card(
                color: Colors.white,
                // shape: Border.all(color: Colors.black),
                child: Image.asset(
                          'assets/Actinic Keratosis.jpg',
                          fit: BoxFit.fill,
                        ))),
            Container(
              child: Card(
                color: Colors.white,
                // shape: Border.all(color: Colors.black),
                child: Container(
                  child: Text('$infotxt',style: TextStyle(fontSize: 18, color:Colors.black  ),),
                  // margin: EdgeInsets.all(10),
                  padding:EdgeInsets.all(10),
                  ),),),
          ],
        ),
      ),
      
    );
  
  }}