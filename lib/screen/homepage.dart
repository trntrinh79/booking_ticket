import 'package:booking_ticket/cubit/ticket_cubit.dart';
import 'package:booking_ticket/db/ticket_db.dart';
import 'package:booking_ticket/model/ticket.dart';
import 'package:booking_ticket/screen/edit_ticket.dart';
import 'package:booking_ticket/widget/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('My Ticket'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditTicket()));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TicketCubit, TicketState>(
        buildWhen: (previous, current) =>
            previous.tickets!.length != current.tickets?.length,
        builder: (context, state) {
          if (state.tickets == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.errorMessage != null) {
            return Center(
              child: Text(state.errorMessage!),
            );
          } else if (state.tickets!.isEmpty) {
            return const Center(
              child: Text('No ticket yet'),
            );
          } else if (state.tickets!.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (context, index) => Ticketwidget(
                ticket: state.tickets![index],
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTicket(
                        ticket: state.tickets![index],
                      ),
                    ),
                  );
                  setState(() {});
                },
                onLongPress: () async {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                            'Are you sure you want to delete this ticket?'),
                        actions: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red)),
                            onPressed: () async {
                              context
                                  .read<TicketCubit>()
                                  .deleteTicket(state.tickets![index]);
                              Navigator.pop(context);
                            },
                            child: const Text('Yes'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('No'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              itemCount: state.tickets!.length,
            );
          }
          return const Center(
            child: Text('No ticket yet'),
          );
        },
      ),
    );
  }
}
