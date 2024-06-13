import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stadium/services/dataservices.dart';

class AllseatView extends StatefulWidget {
  AllseatView({super.key});

  @override
  State<AllseatView> createState() => _AllseatViewState();
}

class _AllseatViewState extends State<AllseatView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(
            "All Seat View",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,

          child: Column(
            children: [
              Container(
                height:MediaQuery.of(context).size.height/8,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 20,width: 20,
                            color: Colors.red,
                            
                          ),
                          Text("Available Seat"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Row(
                        children: [
                         Container(
                              height: 20,width: 20,
                              color: Colors.green,
                              
                            ),
                          Text("Booking OnProgress"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8,top: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.not_accessible_rounded,
                            color: Colors.red,
                          ),
                          Text("Sold Out Seat"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('StadiumSeats')
                        .doc('North')
                        .collection('VIPA')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Center(child: Text('Something went wrong'));
                      }
                          
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                          
                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return Center(child: Text('No seats available'));
                      }
                          
                      return GridView.builder(
                        
                        itemCount: snapshot.data?.docs.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5, childAspectRatio: 1.5),
                        itemBuilder: (BuildContext context, int index) {
                          var document = snapshot.data!.docs[index];
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;
                          
                          return Card(
                            color: data['Status'] == 'OnProgress'?Colors.green
                                : Colors.grey,
                                 
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                data['Status'] == 'Sold'
                                    ? Icon(
                                        Icons.not_accessible_rounded,
                                        color: Colors.red,
                                      )
                                    : Icon(Icons.chair),
                                // SizedBox(height: 1),
                                Text(data['SetatNo'].toString()),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  byTicketFunction() {
    return showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Center(
                  child: Text("Your about to by a Ticket"),
                )),
            actions: [
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK")),
            ],
          );
        });
  }
}
