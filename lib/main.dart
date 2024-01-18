import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtcontroler=TextEditingController();  //wight controller
  var ftcontroler=TextEditingController();  //height controller in feet
  var incontroler=TextEditingController();  //height controller in inches
  var resault="";
  var bgcolor=Colors.amber.shade200;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:Container(
        color: bgcolor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("BMI",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
                SizedBox(height: 15,),
                TextField(
                  controller: wtcontroler,
                  decoration: InputDecoration(
                    label: Text("Enter Weight (kg)"),
                    prefixIcon: Icon(Icons.line_weight_outlined),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: ftcontroler,
                  decoration: InputDecoration(
                    label: Text("Enter height (Feet)"),
                    prefixIcon: Icon(Icons.height_outlined),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: incontroler,
                  decoration: InputDecoration(
                    label: Text("Enter height (Inch)"),
                    prefixIcon: Icon(Icons.height_outlined),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 5,),
                ElevatedButton(onPressed: (){

                  var wt=wtcontroler.text.toString();
                  var ft=ftcontroler.text.toString();
                  var inch=incontroler.text.toString();

                  if(wt!="" && ft!="" && inch!=""){

                    //BMI Calculation Logic

                    //all fields in int
                    var iwt=int.parse(wt);
                    var ift=int.parse(ft);
                    var iinch=int.parse(inch);

                    //Calculation logic (Total)
                    var tInch=(ift*12)+iinch;
                    var tCm=tInch*2.5;
                    var tM=tCm/100;

                    //Message variable
                    var msg="";

                    //BMI calculation variable
                    var bmi=(iwt)/(tM*tM);

                    //change collor acccording bmi
                    if(bmi>25){
                      msg="You are OverWeighted";
                      bgcolor=Colors.redAccent.shade200;
                    }else if(bmi<18){
                      msg="You are UnderWeighted";
                      bgcolor=Colors.deepOrange.shade200;
                    }else{
                      msg="You are Healthy..!";
                      bgcolor=Colors.green.shade200;
                    }

                    //for runtime update on ui
                    setState(() {
                      resault="$msg \n Your BMI is :${bmi.toStringAsFixed(3)}";
                    });


                  }else{
                    setState(() {
                      resault="Please enter required field";
                    });
                  }


                },child: Text("Calculate"),),
                SizedBox(height: 5,),
                Text(resault,style: TextStyle(fontSize: 19),),
              ],
            ),
          ),
        ),
      )
    );
  }
}
