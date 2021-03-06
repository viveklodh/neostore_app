import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neostore_app/PAGES/productDetails.dart';
import 'package:neostore_app/model/productListModel/ResponseProduct.dart';
import 'package:neostore_app/networkApi/network.dart';

class TablesListView extends StatefulWidget {
  final int id;

  TablesListView({Key key, @required this.id}) : super(key: key);

  @override
  _TablesListViewState createState() => _TablesListViewState();
}

class _TablesListViewState extends State<TablesListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         actions: [Icon(Icons.search)],
        backgroundColor: Colors.red,
        title: Text('Products'),
      ),
      body: fod(),
    );
  }

  Widget fod() {
    //  print("Eeached");
    return FutureBuilder(
        future: NeoStoreNetwork().getProductResponse(widget.id.toString()),
        builder: (context, AsyncSnapshot<ResponseProduct> snapshot) {
          if (snapshot.hasData) {
            return renderlist(snapshot.data);
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

Widget renderlist(ResponseProduct data) {
  List <Data> list = data.data;

  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
             Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Details(id: list[index].id,)));
          },
          child: Card(
          //  decoration: BoxDecoration( border: Border.all(color: Colors.grey[300])),
        // height: query(context, 11),
       // width: double.infinity,
            child:  Container(
              padding: EdgeInsets.all(5),
              child: Row(
                 // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      width: 100,
                      height: 100,
                      image: NetworkImage(list[index].productImages),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            list[index].name,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                          Text(list[index].producer,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              )),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           // mainAxisSize: MainAxisSize.max,
                             
                            children: [
                              Text("Rs. " + list[index].cost.toString(),
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                              SizedBox(width: 40),
                             
                              Text(
                                  "Rating " +
                                      list[index].rating.toString() +
                                      ".0/5",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold))
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
      });
}
