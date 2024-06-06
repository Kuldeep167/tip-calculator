import 'package:flutter/material.dart';

void main() {
  runApp(TipCalculator());
}

class TipCalculator extends StatefulWidget {
  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  TextEditingController billAmount = TextEditingController();

  num totalBill = 0;
  num totalTip = 0;
  int person = 2;
  num perPerson = 0;
  int tipSelect = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //outer container
        body: Container(
          height: 450,
          width: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 2, color: Colors.grey),
            color: Colors.white12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //hat container
              Container(
                height: 40,
                width: 100,
                child: Row(
                  children: [
                    Container(
                      child: Image(
                          image: AssetImage(
                        "assets/images/hat.png",
                      )),
                      height: 40,
                      width: 40,
                    ),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Mr",
                              style: TextStyle(fontSize: 10),
                            ),
                            Text(
                              "Tip",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Text(
                          "Calculator",
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ))
                  ],
                ),
              ),
              //Total pay/person
              Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total p/person",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${perPerson.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20.0,
                        width: 180,
                        child: Divider(color: Colors.black45),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "Total bill",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black87),
                                  ),
                                  Text(
                                    "$totalBill",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.teal),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "Total tip",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.black87),
                                  ),
                                  Text(
                                    "$totalTip",
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.teal),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(width: 2, color: Colors.grey),
                    color: Colors.white,
                  ),
                  height: 150,
                  width: 235),
              //enter your bill
              Container(
                width: 240,
                margin: EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "your bill",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 30,
                      width: 175,
                      child: DecoratedBox(
                        child: TextField(
                          controller: billAmount,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21))),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                          border: Border.all(width: 1, color: Colors.black12),
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //choose your tip
              Container(
                  width: 250,
                  margin: EdgeInsets.only(left: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //text
                      Column(
                        children: [
                          Text(
                            "Choose",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "your tip",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      //tip
                      Column(
                        children: [
                          //tip percentage
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 30,
                                width: 50,
                                child: TextButton(
                                  child: DecoratedBox(
                                    child: Center(
                                        child: Text(
                                      "10%",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)),
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: tipSelect == 1
                                          ? Colors.green
                                          : Colors.cyan,
                                    ),
                                  ),
                                  onPressed: () {
                                    totalBill =
                                        int.parse(billAmount.text.toString());
                                    totalTip = totalBill * 0.1;
                                    perPerson =
                                        (totalBill + totalTip) / person;
                                    tipSelect = 1;
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 30,
                                width: 50,
                                child: TextButton(
                                  child: DecoratedBox(
                                    child: Center(
                                        child: Text(
                                      "15%",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)),
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: tipSelect == 2
                                          ? Colors.green
                                          : Colors.cyan,
                                    ),
                                  ),
                                  onPressed: () {
                                    totalBill =
                                        int.parse(billAmount.text.toString());
                                    totalTip = totalBill * 0.15;
                                    perPerson =
                                        (totalBill + totalTip) / person;
                                    tipSelect = 2;
                                    setState(() {});
                                  },
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 30,
                                width: 50,
                                child: TextButton(
                                  child: DecoratedBox(
                                    child: Center(
                                        child: Text(
                                      "20%",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    )),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5)),
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: tipSelect == 3
                                          ? Colors.green
                                          : Colors.cyan,
                                    ),
                                  ),
                                  onPressed: () {
                                    totalBill =
                                        int.parse(billAmount.text.toString());
                                    totalTip = totalBill * 0.2;
                                    perPerson =
                                        (totalBill + totalTip) / person;
                                    tipSelect = 3;
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          //custom tip
                          Container(
                            width: 170,
                            height: 30,
                            child: DecoratedBox(
                              child: Center(
                                  child: Text(
                                "Custom tip",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              )),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                color: Colors.cyan,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
              //split the total
              Container(
                width: 250,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Split",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "the total",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            if (person > 2) {
                              person--;
                            }
                            perPerson = (totalBill + totalTip) / person;
                            setState(() {});
                          },
                          child: Container(
                            width: 50,
                            margin: EdgeInsets.all(8),
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.cyan,
                            ),
                            child: Center(
                                child: Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 50,
                          child: DecoratedBox(
                            child: Center(
                                child: Text(
                              "$person",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border:
                                  Border.all(width: 1, color: Colors.white70),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            person++;
                            perPerson = (totalBill + totalTip) / person;
                            setState(() {});
                          },
                          child: Container(
                            width: 50,
                            margin: EdgeInsets.all(8),
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.cyan,
                            ),
                            child: Center(
                                child: Text(
                              "+",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
