import 'package:booking_ticket/cubit/ticket_cubit.dart';
import 'package:booking_ticket/db/ticket_db.dart';
import 'package:booking_ticket/model/ticket.dart';
import 'package:booking_ticket/screen/edit_ticket.dart';
import 'package:booking_ticket/widget/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class EditTicket1 extends StatefulWidget {
  const EditTicket1({super.key});

  @override
  State<EditTicket1> createState() => _EditTicket1State();
}

class _EditTicket1State extends State<EditTicket1> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => TicketCubit(),
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
        body: Container(
          child: ElevatedButton(
            onPressed: () async {
              final TicketData model = const TicketData(
                  moviename: 'moviename',
                  datetime: 'datetime',
                  theater: 'theater',
                  seat: 'seat',
                  cinema: 'cinema');

              await context.read<TicketCubit>().addTicket(model);
              await context.read<TicketCubit>().loadTickets();
            },
            child: const Text('button'),
          ),
        ),
      ),
    );
  }
}
