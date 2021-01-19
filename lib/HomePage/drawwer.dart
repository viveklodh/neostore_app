import 'package:flutter/material.dart';
import 'package:neostore_app/pages/login.dart';
import 'package:neostore_app/pages/product/productslistView.dart';
import 'package:neostore_app/progress.dart';

class NeoDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKBxFgumtyI8kBb1RvhSfyqrqahJsu2XUScw&usqp=CAU'),
                      radius: 60.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                       'vivek',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "vklodh55@gmail.com",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // UserAccountsDrawerHeader(

            //   decoration: BoxDecoration(

            //     color: Colors.red,
            //   ),
            //   accountName: Text(
            //     'vivek lodh',
            //     style:
            //         TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            //   ),
            //   accountEmail: Text(
            //     'vklodh@gmail.com',
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   currentAccountPicture: CircleAvatar(
            //     //backgroundImage: AssetImage('images/.jpg'),
            //     radius: 60.0,
            //   ),
            // ),
            SizedBox(height: 5),
            Card(
            
              color: Colors.grey[900],
              elevation: 10,
              child: InkWell(
                onTap:() {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Progress()));
                },
                              child: ListTile(
                  leading: Icon(Icons.add_shopping_cart, color: Colors.white),
                  title: Text(
                    'My Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  // subtitle: Text(''),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 5),
            Card(
              color: Colors.grey[900],
              elevation: 10,
              child: InkWell(
                 onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TablesListView(id: 1)));
        },
                              child: ListTile(
                  leading: Image.asset(
                    "images/tableIcon.png",
                    height: 20,
                  ),
                  title: Text(
                    'Tables',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  //, subtitle: Text('lets meet on fb'),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 5),
            Card(
              color: Colors.grey[900],
              elevation: 10,
              
              child: InkWell(
                
                 onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TablesListView(id:4)));
        },
                              child: ListTile(
                  leading: Image.asset(
                    "images/cubIcon.png",
                    height: 20,
                  ),
                  title: Text(
                    'Beds',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  //, subtitle: Text('lets meet on fb'),
                  trailing: Icon(Icons.arrow_forward, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 5),
            Card(
              color: Colors.grey[900],
              elevation: 10,
               child: InkWell(
                
                 onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TablesListView(id: 2)));
        },
               
              child: ListTile(
                leading: Image.asset(
                  "images/chairIcon.png",
                  height: 20,
                ),
                title: Text(
                  'Chairs',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                //, subtitle: Text('lets meet on fb'),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),),
            SizedBox(height: 5),
            Card(
              color: Colors.grey[900],
              elevation: 10,
               child: InkWell(
                
                 onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TablesListView(id: 3)));
        },
               
              child: ListTile(
                leading: Image.asset(
                  "images/sofaIcon.png",
                  height: 20,
                ),
                title: Text(
                  'Sofas',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                //, subtitle: Text('lets meet on fb'),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),),
            SizedBox(height: 5),
            Card(
              color: Colors.grey[900],
              elevation: 10,
               child: InkWell(
                onTap:() {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Progress()));
                },
                     
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.white),
                title: Text(
                  'My Account',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                // subtitle: Text(''),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),),
            SizedBox(height: 5),
            Card(
              color: Colors.grey[900],
              elevation: 10,
               child: InkWell(
                onTap:() {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Progress()));
                },
                     
              child: ListTile(
                leading: Icon(Icons.my_location, color: Colors.white),
                title: Text(
                  'Store Locator',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                // subtitle: Text(''),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),),
            Card(
              color: Colors.grey[900],
              elevation: 10,
               child: InkWell(
                onTap:() {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Progress()));
                },
                     
              child: ListTile(
                leading: Icon(Icons.notes, color: Colors.white),
                title: Text(
                  'My Orders',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                // subtitle: Text(''),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),),
            Card(
              color: Colors.grey[900],
              elevation: 10,
               child: InkWell(
                onTap:() {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => LoginDemo()));
                },
                     
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text(
                  'Log Out',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                // subtitle: Text(''),
                trailing: Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
