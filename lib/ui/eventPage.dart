import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/Widget/Pagetitletext.dart';
import 'package:kata_mobile_frontui/Widget/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:kata_mobile_frontui/models/EventModel.dart';
import 'package:intl/intl.dart';

class EventsPage extends StatefulWidget {
  final List<EventModel?>? events;
  const EventsPage({super.key, required this.events});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');
  final DateFormat _timeFormat = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    final filteredEvents = _selectedDay == null
        ? widget.events
        : widget.events!.where((event) => isSameDay(event!.startDate, _selectedDay)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Pagetitletext(content: 'Évènements',),

        actions:  [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: IconButton(
              onPressed: () {
                // Action à exécuter
              },
              icon: const Icon(Icons.add, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Section Calendrier
          Card(
            margin: const EdgeInsets.all(16),
            child: TableCalendar<EventModel?>(
              firstDay: DateTime.now().subtract(const Duration(days: 365)),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) => setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              }),
              eventLoader: (day) => widget.events!.where((event) =>
                  isSameDay(event!.startDate, day)).toList(),
              calendarStyle: CalendarStyle(
                markersMaxCount: 3,
                markerDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
              ),
            ),
          ),

          // Section Liste des événements
          Expanded(
            child: ListView.builder(
              itemCount: filteredEvents!.length,
              itemBuilder: (context, index) => _buildEventCard(filteredEvents[index]!),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(EventModel event) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: FigmaColors.iconsBlue,
                shape: BoxShape.circle
              ),
              child: const Icon(
                Icons.event,
                color: Colors.white,
                size: 20,
              ),
            ),
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    event.title ?? 'Événement sans titre',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: _getStatusColor(event),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Text(
                    _getEventStatus(event),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,

                    ),
                  ),
                ),
              ],
            ),
            trailing: PopupMenuButton<String>(
              icon: const Icon(
                Icons.more_vert,
                color: FigmaColors.dashboardSubtitleGrey,
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'view',
                  child: Text('Voir détails'),
                ),
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Modifier'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Supprimer'),
                ),
              ],
              onSelected: (value) {
                // Gérer les actions ici
                switch (value) {
                  case 'view':
                    _showEventDetails(event);
                    break;
                  case 'edit':
                  // Action modification
                    break;
                  case 'delete':
                  // Action suppression
                    break;
                }
              },
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        '${_dateFormat.format(event.startDate)} (${_timeFormat.format(event.startDate)} - ${_timeFormat.format(event.endDate)})',
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (event.address != null) ...[
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          event.address!,
                          style: const TextStyle(fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(EventModel event) {
    final now = DateTime.now();
    if (event.endDate.isBefore(now)) {
      return Colors.red; // Événement passé
    } else if (event.startDate.isBefore(now) && event.endDate.isAfter(now)) {
      return Colors.orange; // En cours
    } else {
      return Colors.green; // À venir
    }
  }

  String _getEventStatus(EventModel event) {
    final now = DateTime.now();
    if (event.endDate.isBefore(now)) {
      return 'Terminé';
    } else if (event.startDate.isBefore(now) && event.endDate.isAfter(now)) {
      return 'En cours';
    } else {
      return 'À venir';
    }
  }

  void _showEventDetails(EventModel event) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(event.title ?? 'Détails de l\'événement'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (event.description != null) ...[
              Text(event.description!),
              const SizedBox(height: 16),
            ],
            _buildDetailRow('Date', '${_dateFormat.format(event.startDate)} - ${_dateFormat.format(event.endDate)}'),
            _buildDetailRow('Heure', '${_timeFormat.format(event.startDate)} - ${_timeFormat.format(event.endDate)}'),
            if (event.address != null) _buildDetailRow('Lieu', event.address!),
            if (event.type != null) _buildDetailRow('Type', event.type!),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              '$label :',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}