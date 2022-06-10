import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class CartPage extends StatefulWidget {

  final String deviceId;

  const CartPage({Key? key, this.deviceId =""}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final fb = FirebaseDatabase.instance;

  
  @override
  Widget build(BuildContext context) {
    // final ref = fb.ref().child('produk');
    final ref2 = fb.ref().child('cart').orderByChild("id_device").equalTo(widget.deviceId);
    print(widget.deviceId);
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.indigo[900],
      //   onPressed: () {
      //     // Navigator.push(
      //     //   context,
      //     //   MaterialPageRoute(
      //     //     builder: (_) => addnote(),
      //     //   ),
      //     // );
      //   },
      //   child: Icon(
      //     Icons.add,
      //   ),
      // ),
      appBar: AppBar(
        title: Text(
          'Keranjang',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView(
        children: [
          // FirebaseAnimatedList(
          //   query: ref,
          //   physics: NeverScrollableScrollPhysics(),
          //   shrinkWrap: true,
          //   itemBuilder: (context, snapshot, animation, index) {
          //     Map<dynamic, dynamic> values =
          //         snapshot.value as Map<dynamic, dynamic>;
          //     return GestureDetector(
          //       onTap: () {},
          //       child: Container(
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: ListTile(
          //             shape: RoundedRectangleBorder(
          //               side: BorderSide(
          //                 color: Colors.white,
          //               ),
          //               borderRadius: BorderRadius.circular(10),
          //             ),
          //             tileColor: Colors.indigo[100],
          //             trailing: IconButton(
          //               icon: Icon(
          //                 Icons.delete,
          //                 color: Colors.red[900],
          //               ),
          //               onPressed: () {
          //                 ref.child(snapshot.key!).remove();
          //               },
          //             ),
          //             title: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   'Barcode : ${values['barcode'].toString()}',
          //                   style: TextStyle(
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 Text(
          //                   'Nama : ${values['nama'].toString()}',
          //                   style: TextStyle(
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 Text(
          //                   'Harga : ${values['harga'].toString()}',
          //                   style: TextStyle(
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 Text(
          //                   'Stok : ${values['stok'].toString()}',
          //                   style: TextStyle(
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          FirebaseAnimatedList(
            query: ref2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, snapshot, animation, index) {
              Map<dynamic, dynamic> values =
                  snapshot.value as Map<dynamic, dynamic>;
              print("ISI : $index");
              return GestureDetector(
                onTap: () {},
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      

                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("List Produk:"),

                          Text(
                            'nama : ${values['produk']['nama']}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'harga : ${values['produk']['harga']}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Container(
                            color: Colors.amber,
                            width: double.infinity,
                            height: 3,
                            child: SizedBox(),
                          ),
                          Text(
                            'jumlah : ${values['jumlah']}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'total harga : ${values['totalHarga']}',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
