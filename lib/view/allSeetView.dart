import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stadium/services/bookingServices.dart';
import 'package:stadium/services/dataservices.dart';

class AllseatView extends StatefulWidget {
  AllseatView({super.key});

  @override
  State<AllseatView> createState() => _AllseatViewState();
}

class _AllseatViewState extends State<AllseatView> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> seatCollesction = FirebaseFirestore.instance
        .collection('StadiumSeats')
        .doc('North')
        .collection('VIPA')
        .orderBy('SetatNo', descending: false)
        .snapshots();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
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
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 5),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("Available Seat"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 5),
                          child: Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text("On Progress"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, top: 5),
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
                    const Column(
                      children: [
                        Icon(
                          Icons.book_outlined,
                          size: 30,
                          color: Colors.blueGrey,
                        ),
                        Text(
                          '0',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: seatCollesction,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong'));
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                        return const Center(child: Text('No seats available'));
                      }

                      return GridView.builder(
                        itemCount: snapshot.data?.docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5, childAspectRatio: 1.5),
                        itemBuilder: (BuildContext context, int index) {
                          var document = snapshot.data!.docs[index];
                          Map<String, dynamic> data =
                              document.data() as Map<String, dynamic>;

                          return InkWell(
                            onTap: () {
                              if (data['Status'] == 'Available') {
                                // alreadySoldTicket(data['Status']).toString();
                                Bookingservices().bookingOnProgress(document.id.toString());
                              } else if (data['Status'] =='OnProgress') {
                                //  alreadySoldTicket(data['Status']).toString();
                                bookingOnProgress();
                              } else {
                                 alreadySoldTicket(data['Status']).toString();
                              }
                            },
                            child: Card(
                              color: data['Status'] == 'OnProgress'
                                  ? Colors.green
                                  : Colors.grey[200],
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  data['Status'] == 'Sold'
                                      ? const Icon(
                                          Icons.not_accessible_rounded,
                                          color: Colors.red,
                                        )
                                      : const Icon(Icons.chair),
                                  Text(data['SetatNo'].toString()),
                                ],
                              ),
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

  bookingOnProgress() {
    return showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: const Center(
                  child: Text("Your about to by a Ticket"),
                )),
            actions: [
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
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

  // Sold Out
  alreadySoldTicket(String _seatStatus) {
    return showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            content: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Center(
                  child: Text("Ticket is already" + ' ' + _seatStatus),
                )),
            actions: [
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel")),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
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
