import 'dart:math';

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
    return BlocProvider(
      lazy: false,
      create: (context) => TicketCubit()..loadTickets(),
      child: Scaffold(
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
              previous.tickets.length != current.tickets.length ||
              previous.loadingStatus != current.loadingStatus,
          builder: (context, state) {
            if (state.loadingStatus == LoadingStatus.isLoading) {
              print('sssss1');

              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            //  else if (state.tickets.isNotEmpty)
            else if (state.loadingStatus == LoadingStatus.isLoaded) {
              print('sssss3');

              return ListView.builder(
                itemBuilder: (context, index) => Ticketwidget(
                  ticket: state.tickets[index],
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditTicket(
                          ticket: state.tickets[index],
                        ),
                      ),
                    );
                    setState(() {});
                  },
                  onLongPress: () async {
                    final confirmed = await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title:
                            Text('Are you sure you want to delete this item?'),
                        actions: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Yes'),
                          ),
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('No'),
                          ),
                        ],
                      ),
                    );

                    if (confirmed) {
                      await context
                          .read<TicketCubit>()
                          .deleteTicket(state.tickets[index]);
                      setState(() {}); // update the UI
                    }
                  },
                ),
                itemCount: state.tickets.length,
              );
            }
            return const Center(
              child: Text('No ticket yet'),
            );
          },
        ),
      ),
    );
  }
}
