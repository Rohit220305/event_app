import 'package:flutter/material.dart';

class MyEventsPage extends StatelessWidget {
  const MyEventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final upcomingEvents = List.generate(5, (i) => _EventData(
          title: 'Upcoming Event ${i + 1}',
          date: DateTime.now().add(Duration(days: (i + 1) * 3)),
          location: 'Auditorium ${(i + 1)}',
        ));

    final completedEvents = List.generate(4, (i) => _EventData(
          title: 'Completed Event ${i + 1}',
          date: DateTime.now().subtract(Duration(days: (i + 1) * 5)),
          location: 'Hall ${(i + 2)}',
          completed: true,
        ));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Events'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Completed'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _UpcomingEventsList(events: upcomingEvents),
            _CompletedEventsList(events: completedEvents),
          ],
        ),
      ),
    );
  }
}

class _UpcomingEventsList extends StatelessWidget {
  final List<_EventData> events;
  const _UpcomingEventsList({required this.events});
  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Center(child: Text('No upcoming events'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: events.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final e = events[index];
        return Card(
          margin: EdgeInsets.zero,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/event.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 4),
                          Row(children: [
                            const Icon(Icons.event, size: 16),
                            const SizedBox(width: 6),
                            Text(_formatDate(e.date)),
                          ]),
                          const SizedBox(height: 4),
                          Row(children: [
                            const Icon(Icons.location_pin, size: 16),
                            const SizedBox(width: 6),
                            Expanded(child: Text(e.location)),
                          ]),
                        ],
                      ),
                    ),
                    // add top space for button only
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                          foregroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
                          elevation: 2,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: const Size(0, 36),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.visibility_rounded, size: 16),
                            SizedBox(width: 6),
                            Text(
                              'View Details',
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CompletedEventsList extends StatelessWidget {
  final List<_EventData> events;
  const _CompletedEventsList({required this.events});
  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return const Center(child: Text('No completed events'));
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: events.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final e = events[index];
        return Card(
          margin: EdgeInsets.zero,
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/event.jpg',
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // LEFT: details (title + date)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            e.title,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              const Icon(Icons.event_available, size: 16),
                              const SizedBox(width: 6),
                              Text(_formatDate(e.date)),

                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    // RIGHT: badge + certificate button stacked
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _StatusBadge(label: 'Completed', color: Colors.green.shade600, fixedWidth: 130),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: 130,
                          child: _CertificatePillButton(onTap: () {}),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;
  final double? fixedWidth;
  const _StatusBadge({required this.label, required this.color, this.fixedWidth});
  @override
  Widget build(BuildContext context) {
    final bg = color.withOpacity(.12);
    final child = Text(
      label,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
            letterSpacing: .4,
          ),
    );
    return Container(
      width: fixedWidth,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(.4)),
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class _CertificatePillButton extends StatelessWidget {
  final VoidCallback onTap;
  const _CertificatePillButton({required this.onTap});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
          color: primary.withOpacity(.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: primary.withOpacity(.40)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.download, size: 16, color: primary),
              const SizedBox(width: 4),
              Text(
                'Certificate',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: primary,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .4,
                ),
              ),
            ]),
      ),
    );
  }
}

class _EventData {
  final String title;
  final DateTime date;
  final String location;
  final bool completed;
  const _EventData({required this.title, required this.date, required this.location, this.completed = false});
}

String _formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}



