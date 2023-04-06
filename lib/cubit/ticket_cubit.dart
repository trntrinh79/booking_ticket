import 'package:booking_ticket/db/ticket_db.dart';
import 'package:booking_ticket/model/ticket.dart';
// import 'package:cubit/cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(const TicketState());

  Future<void> loadTickets() async {
    try {
      final tickets = await DatabaseHelper.getAllTicket();
      emit(state.copyWith(tickets: tickets));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> addTicket(TicketData ticket) async {
    await DatabaseHelper.insertTicket(ticket);
    // final tickets = await DatabaseHelper.getAllTicket();
    // emit(state.copyWith(tickets: tickets));
  }

  Future<void> deleteTicket(TicketData ticket) async {
    await DatabaseHelper.deleteTicket(ticket);
    final tickets = await DatabaseHelper.getAllTicket();
    emit(state.copyWith(tickets: tickets));
  }

  Future<void> updateTicket(TicketData ticket) async {
    await DatabaseHelper.updateTicket(ticket);
    final tickets = await DatabaseHelper.getAllTicket();
    emit(state.copyWith(tickets: tickets));
  }
}
