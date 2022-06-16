import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class CartPage extends StatefulWidget {

  final String deviceId;

  const CartPage({Key? key, this.deviceId ="1a"}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final fb = FirebaseDatabase.instance;

  int totHar = 0 ;
  
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
              List<dynamic> data = values['produk'].toList();
              data.removeWhere((element) => element == null);
              print("ISINYA : $data");
              List<CartProduct> products = [];

              for (var i = 0; i < data.length; i++) {
                products.add(CartProduct(data[i]['harga'], data[i]['nama']));
              }
      
              print("ISI : $products");
               totHar = products.fold(0,(prev,curr)=>prev + curr.harga );
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: 
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("List Produk",style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: values['produk'].length, 
                          separatorBuilder: (ctx,idx)=>SizedBox(height: 10,), 
                          itemBuilder: (ctx,index2){
                            // if (values['produk'][index2] == null) {
                            //   totHar = 0;
                            // }else{
                            //   totHar = values['produk'].fold(0,(prev,el)=>prev + values['produk'].harga);
                            // }
                            //  = : values['produk'][index2]['harga'];
                            return
                            values['produk'][index2] == null ? SizedBox() : 
                            Container(
                              child:Row(
                                children: [
                                  Text("${values['produk'][index2]['nama']} - Rp.${values['produk'][index2]['harga']}",style: TextStyle(fontSize: 16),)
                                ],  
                              )
                            );
                          },
                          
                        ),
                        // Text(
                        //   'nama : ${values['produk']['nama']}',
                        //   style: TextStyle(
                        //     fontSize: 25,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        // Text(
                        //   'harga : ${values['produk']['harga'].toString()}',
                        //   style: TextStyle(
                        //     fontSize: 25,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Divider(height: 2,color: Colors.black,),
                        ),
                        // Text(
                        //   'jumlah : ${values['jumlah']}',
                        //   style: TextStyle(
                        //     fontSize: 25,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
                        Text(
                          'total harga : Rp. ${totHar.toString()}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                onPressed: () {},
                child: Text('Bayar')),
                        ),
                      ],
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

class CartProduct{
  final int harga;
  final String nama;

  CartProduct(this.harga, this.nama);
}