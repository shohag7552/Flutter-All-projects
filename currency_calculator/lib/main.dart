import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "My app",
    
    home: Currency(),
    theme: ThemeData(
      primaryColor: Colors.yellow[800],
      accentColor: Colors.yellow,
      backgroundColor:Colors.yellow[400],
    ),
  )
  );
}
class Currency extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {


  var _currencies = ['Taka','Rupees','Dollars'];
  var _currentItemSelected = 'Taka';

  TextEditingController principalControler = TextEditingController();
  TextEditingController roiControler = TextEditingController();
  TextEditingController termControler = TextEditingController();

  var displayResult = "";
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
    //  resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Currency money"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: <Widget>[

              getImage(),

              Padding(
                padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: principalControler,
                  decoration: InputDecoration(
                    labelText: 'Principal',
                    hintText: 'Enter principal',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: roiControler,
                  decoration: InputDecoration(
                    labelText: 'Rate of interest',
                    hintText: 'In percentage',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      controller: termControler,
                      decoration: InputDecoration(
                        labelText: 'Term',
                        hintText: 'Time in year ',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                    ),
                  ),

                  Container(
                    width: 50.0,
                  ),

                  Expanded(child: DropdownButton<String>(
                      items: _currencies.map((String value){
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                          );
                      }).toList(),
                      
                      onChanged: (String newValueSelected){
                        _itemSelected(newValueSelected);
                      },
                      value: _currentItemSelected,
                      ),
                  ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top:10.0,bottom: 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.yellow[800],
                        child: Text('Calculate',
                        style: textStyle,
                        textScaleFactor: 1.0,
                        ),
                        onPressed: (){
                          setState(() {
                              this.displayResult =  _calculateResult();
                          });
                        }
                        ),
                    ),
                    Container(margin: EdgeInsets.only(right: 5),),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.yellow[100],
                        child: Text('Reset',
                        style: textStyle,
                        textScaleFactor: 1.0,
                        ),
                        onPressed: (){
                          setState(() {
                            _reset();
                          });
                        }
                        ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(this.displayResult,
                style: textStyle,
                ),
                ),
          ],
          ),
        ),
      ),
    );
  }
     // for imageView.....
  Widget getImage(){
    AssetImage assetImage = AssetImage('images/swam.jpg');
    Image image = Image(
      image: assetImage,
      height: 150.0,
      width: 150.0,
    );
    return Container(
      child:image,
      margin: EdgeInsets.all(30.0),
    );
  }

  void _itemSelected(String selectedValue){
    setState(() {
      this._currentItemSelected = selectedValue;
    });
  }
  String _calculateResult(){
    double principal = double.parse(principalControler.text) ;
    double roi = double.parse(roiControler.text) ;
    double term = double.parse(termControler.text) ;

    double paybleAmount = principal + (principal*roi*term) / 100;

    String result = "After $term years, your investment will be $paybleAmount $_currentItemSelected";
    return result;
  }
  void _reset(){
    principalControler.text = "";
    roiControler.text = "";
    termControler.text = "";
    _currentItemSelected = _currencies[0];
    displayResult = "";
  }
}

