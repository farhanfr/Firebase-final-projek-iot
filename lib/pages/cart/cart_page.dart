import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class CartPage extends StatefulWidget {
  final String deviceId;

  const CartPage({Key? key, this.deviceId = "1a"}) : super(key: key);
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final fb = FirebaseDatabase.instance;

  int totHar = 0;

  @override
  Widget build(BuildContext context) {
    // final ref = fb.ref().child('produk');
    final ref2 = fb
        .ref()
        .child('cart')
        .orderByChild("id_device")
        .equalTo(widget.deviceId);
    print(widget.deviceId);
    return Scaffold(
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
        
          FirebaseAnimatedList(
            query: ref2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, snapshot, animation, index) {
              Map<dynamic, dynamic> values =
                  snapshot.value as Map<dynamic, dynamic>;
              print("ISINEE" + values['produk'].toString());
              List<dynamic> data = values['produk'].toList();
              data.removeWhere((element) => element == null);
              print("ISINYA : $data");
              List<CartProduct> products = [];

              for (var i = 0; i < data.length; i++) {
                products.add(CartProduct(data[i]['harga'], data[i]['nama']));
              }
              totHar = products.fold(0, (prev, curr) => prev + curr.harga);
              final setTotal =
                  ref2.ref.child('1').child('totalHarga').set(totHar);
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "List Produk",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: products.length,
                        separatorBuilder: (ctx, idx) => SizedBox(
                          height: 10,
                        ),
                        itemBuilder: (ctx, index2) {
                          return Container(
                                      child: Row(
                                      children: [
                                        Text(
                                          "${products[index2].nama} - ${products[index2].harga}",
                                          style: TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ));
                              // (values['produk'][index2]['nama'] == "kosong"
                              //     ? Container()
                              //     : 
                                  
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
                        child: Divider(
                          height: 2,
                          color: Colors.black,
                        ),
                      ),
                      // Text(
                      //   'jumlah : ${values['jumlah']}',
                      //   style: TextStyle(
                      //     fontSize: 25,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      Text(
                        'jumlah barang : ${values['jumlah'].toString()}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'total harga : Rp. ${totHar.toString()}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        child: ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.blue),
                            onPressed: () {
                              Scaffold.of(context).showSnackBar(SnackBar(
            content: const Text('Masih Dalam Pengembangan'),
            duration: const Duration(seconds: 1),
           
          ));
                            },
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

class CartProduct {
  final int harga;
  final String nama;

  CartProduct(this.harga, this.nama);
}