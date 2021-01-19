import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:neostore_app/model/productListModel/ResponseProduct.dart';
import 'package:neostore_app/model/productsDetailsModel/DetailsModel.dart';
import 'package:neostore_app/network/network.dart';
import 'package:rating_dialog/rating_dialog.dart';

class Details extends StatefulWidget {
  final int id;

  Details({Key key, @required this.id}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int price;
  bool pricestate = false;
  int selectedIndex=0;

  final _detailsform = GlobalKey<FormState>();
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,

          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
               
              },
            )
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            "NeoStore",
            style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<DetailsModel>(
        future: NeoStoreNetwork().getProductDetails(widget.id.toString()),
        builder: (context, AsyncSnapshot<DetailsModel> snapshot) {
          if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  top(context, snapshot.data.data),
                  middle(context, snapshot.data.data),
                  bottom(context, snapshot.data.data),
                ],
              );
            }
            if (snapshot.hasError) {
              return null;
            }
       
            else
              return Center(
                child: CircularProgressIndicator(),
              );
          },
        ));
  }
  Widget top(context, Data data) {
  var list = data;

    return Card(
      margin: EdgeInsets.zero,
            child: Container(
        padding:
            const EdgeInsets.only(top: 10.0, left: 12, right: 12, bottom: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(
             list.name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Category- " + cat(list.productCategoryId),
              style: TextStyle(fontSize: 13),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  list.producer,
                  style: TextStyle(fontSize: 16),
                ),
                RatingBar.builder(
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  initialRating: list.rating.toDouble(),
                  onRatingUpdate: null,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 20,
                )
              ],),
            ],
        ),
      ),
    );
  }

  Widget middle(BuildContext context, Data data) {
 var list = data;
    return Expanded(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 3),
        child: Container(
          padding:
              const EdgeInsets.only(top: 10.0, left: 10, right: 10, bottom: 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${list.cost}',
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                    Icon(
                      Icons.share,
                      color: Theme.of(context).primaryColor,
                      size: 35,
                    )
                  ],
                ),
              ),
              SizedBox(

                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: InkWell(
                    child: Image(
                      width: 300,
                      image:
                          NetworkImage(list.productImages[0].image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                          padding: const EdgeInsets.only(top: 3.0, bottom: 5),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: list.productImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: index == selectedIndex
                                      ? Theme.of(context).primaryColor
                                      : Colors.white,
                                  width: 4),
                            ),
                            child: Image(
                              height: 80,
                              width: 80,
                              image:
                                  NetworkImage(list.productImages[0].image),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8, right: 8, bottom: 7),
                  child: SingleChildScrollView(
                    child: Text(
                      list.description,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget bottom(context, Data data) {
var list = data;

    return Container(

        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
                children: [
              Expanded(
                child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () async {

                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(32.0))),
                              content: Container(
                                child: buyDialogue(context, data),
                              ),
                            );
                          });
                    },
                    child: Text(
                      "BUY",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.grey[350],
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible:
                              true, // set to false if you want to force a rating
                          builder: (context) {
                            return RatingDialog(
                              icon: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Image(
                                  width: 300,
                                  image:
                                      NetworkImage(list.productImages[0].image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              title: list.name,
                              description: "Tap a star to set your rating",
                              submitButton: "SUBMIT",
                              accentColor:
                                  Theme.of(context).primaryColor, // optional
                              onSubmitPressed: (int rating) async {
                                // String msg =
                                //     await NeoStoreNetwork().get(list.id, rating);
                                // Fluttertoast.showToast(msg: msg);
                              },
                            );
                          });
                    },
                    child: Text(
                      "RATE",
                    )),
              ),
            ],
          ),
        ));
  }

  Widget buyDialogue( context,  Data data) {
        var list = data;

    return Wrap(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 20),
            Text(
              list.name,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 30),
            Image(
              width: 300,
              image: NetworkImage(list.productImages[0].image),
              fit: BoxFit.fill,
            ),
            SizedBox(height: 10),
            Text(
              "Quantity:",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Form(
              key: _detailsform,
              child: Column(
                children: [
                  Container(
                    width: 200,
                    child: TextFormField(
                      decoration: new InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(15.0),
                          ),
                          // width: 0.0 produces a thin "hairline" border
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                        ),
                        border: const OutlineInputBorder(),
                        labelStyle: new TextStyle(color: Colors.green),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String value) {
                        int num = 0;
                        if (value.isNotEmpty) {
                          num = int.parse(value);
                        } else {
                          return 'Enter Quantity';
                        }
                        if (num < 1 || num > 7) {
                          return 'Min. 1, Max: 7';
                        } else
                          return null;
                      },
                      onSaved: (String value) {
                        quantity = int.parse(value);
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                   // height: 50,
                    child: Row(
                    //  mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                     // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            color: Theme.of(context).primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "BUY",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              // if (!_detailsform.currentState.validate()) {
                              //   return;
                              // }
                              // _detailsform.currentState.save();

                              // SharedPreferences prefs =
                              //     await SharedPreferences.getInstance();
                              // String token = prefs.getString('token') ?? '';
                              // Navigator.pop(context);

                              // ApiProvider()
                              //     .buy(token, list.id.toString(),
                              //         quantity.toString())
                              //     .then((value) {
                              //   Fluttertoast.showToast(msg: value.userMsg);
                              //   count();
                              // }).catchError((error, stackTrace) {
                              //   print('error caught: $error');
                              // });
                            },
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: Colors.grey[350],
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "CANCEL",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //  SizedBox(height: 10),
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  String cat(int productCategoryId) {
    switch (productCategoryId) {
      case 1:
        return "Table";
        break;
      case 2:
        return "Chairs";
        break;
      case 3:
        return "Sofas";
        break;
      case 4:
        return "Beds";
        break;
    }
    return "NULL";
  }
  }
