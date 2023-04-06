import 'package:booking_ticket/cubit/ticket_cubit.dart';
import 'package:booking_ticket/db/ticket_db.dart';
import 'package:booking_ticket/model/ticket.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTicket extends StatefulWidget {
  final TicketData? ticket;
  final TicketCubit? ticketCubit;
  const EditTicket({Key? key, this.ticket, this.ticketCubit}) : super(key: key);

  @override
  State<EditTicket> createState() => _EditTicketState();
}

class _EditTicketState extends State<EditTicket> {
  @override
  Widget build(BuildContext context) {
    final movienameController = TextEditingController();
    final datetimeController = TextEditingController();
    final theaterController = TextEditingController();
    final seatController = TextEditingController();
    final cinemaController = TextEditingController();

    if (widget.ticket != null) {
      movienameController.text = widget.ticket!.moviename;
      datetimeController.text = widget.ticket!.datetime;
      theaterController.text = widget.ticket!.theater;
      seatController.text = widget.ticket!.seat;
      cinemaController.text = widget.ticket!.cinema;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ticket == null ? 'Add a ticket' : 'Edit ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Center(
                child: Text(
                  'What movie you wanna watch?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: TextFormField(
                controller: movienameController,
                decoration: const InputDecoration(
                    hintText: 'Movie name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
                keyboardType: TextInputType.multiline,
                onChanged: (str) {},
                maxLines: 1,
              ),
            ),
            TextFormField(
              controller: datetimeController,
              decoration: const InputDecoration(
                  hintText: 'Date time',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
              keyboardType: TextInputType.multiline,
              onChanged: (str) {},
              maxLines: 1,
            ),
            TextFormField(
              controller: theaterController,
              decoration: const InputDecoration(
                  hintText: 'Theater',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
              keyboardType: TextInputType.multiline,
              onChanged: (str) {},
              maxLines: 1,
            ),
            TextFormField(
              controller: seatController,
              decoration: const InputDecoration(
                  hintText: 'Seat',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
              keyboardType: TextInputType.multiline,
              onChanged: (str) {},
              maxLines: 1,
            ),
            TextFormField(
              controller: cinemaController,
              decoration: const InputDecoration(
                  hintText: 'Cinema',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
              keyboardType: TextInputType.multiline,
              onChanged: (str) {},
              maxLines: 1,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final moviename = movienameController.value.text;
                      final datetime = datetimeController.value.text;
                      final theater = theaterController.value.text;
                      final seat = seatController.value.text;
                      final cinema = cinemaController.value.text;

                      if (moviename.isEmpty ||
                          datetime.isEmpty ||
                          theater.isEmpty ||
                          seat.isEmpty ||
                          cinema.isEmpty) {
                        return;
                      }

                      final TicketData model = TicketData(
                          moviename: moviename,
                          datetime: datetime,
                          theater: theater,
                          seat: seat,
                          cinema: cinema,
                          id: widget.ticket?.id);
                      if (widget.ticket == null) {
                        await context.read<TicketCubit>().addTicket(model);
                      } else {
                        await DatabaseHelper.updateTicket(model);
                      }

                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 0.75,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                )))),
                    child: Text(
                      widget.ticket == null ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
