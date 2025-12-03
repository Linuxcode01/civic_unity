import 'package:flutter/material.dart';

/// Simple model for a request — expand as needed.
class WasteRequest {
  final int id;
  final double lat;
  final double lng;
  final String locationLabel;
  final double distanceKm;
  final String userPhone;
  final String? imageUrl;

  const WasteRequest({
    required this.id,
    required this.lat,
    required this.lng,
    required this.locationLabel,
    required this.distanceKm,
    required this.userPhone,
    this.imageUrl,
  });
}

/// Small reusable badge (your original) — kept for completeness.
class DriverStatusBadge extends StatelessWidget {
  final bool online;
  const DriverStatusBadge({required this.online, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: online ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        online ? 'Online' : 'Offline',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

/// Draggable bottom sheet that shows request details. Use showRequestDetailsSheet()
class RequestDetailsSheet extends StatelessWidget {
  final WasteRequest request;
  final VoidCallback? onAccept;
  final VoidCallback? onNavigate;

  const RequestDetailsSheet({
    super.key,
    required this.request,
    this.onAccept,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    // Use DraggableScrollableSheet to allow swipe-up/down
    return DraggableScrollableSheet(
      initialChildSize: 0.35,
      minChildSize: 0.15,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, -3),
              ),
            ],
          ),
          child: ListView(
            controller: scrollController,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 60,
                  height: 6,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Waste Pickup',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Chip(
                    backgroundColor: Colors.orange[50],
                    label: Text('ID: ${request.id}'),
                  )
                ],
              ),
              const SizedBox(height: 12),

              // Image (if available)
              if (request.imageUrl != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    request.imageUrl!,
                    height: 160,
                    fit: BoxFit.cover,
                    errorBuilder: (c, e, s) => Container(
                      height: 160,
                      alignment: Alignment.center,
                      color: Colors.grey[200],
                      child: const Icon(Icons.broken_image, size: 48),
                    ),
                  ),
                ),

              if (request.imageUrl != null) const SizedBox(height: 12),

              // Location + distance + phone
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on, color: Colors.orange),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          request.locationLabel,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text('Lat: ${request.lat.toStringAsFixed(6)}, '
                            'Lng: ${request.lng.toStringAsFixed(6)}'),
                        const SizedBox(height: 4),
                        Text('Distance: ${request.distanceKm.toStringAsFixed(2)} km'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.green),
                  const SizedBox(width: 8),
                  Text(request.userPhone),
                ],
              ),
              const SizedBox(height: 18),

              // Action buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // default navigate action if user didn't pass a handler
                        if (onNavigate != null) {
                          onNavigate!();
                        } else {
                          // open external maps intent (basic)
                          _openMapsDefault(request.lat, request.lng);
                        }
                      },
                      icon: const Icon(Icons.navigation),
                      label: const Text('Navigate'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onAccept ??
                              () {
                            // default acceptance feedback
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Accepted locally')),
                            );
                          },
                      icon: const Icon(Icons.check_circle),
                      label: const Text('Accept'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Extra info / notes area
              ExpansionTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Request Details'),
                children: [
                  ListTile(
                    title: const Text('Reported at:'),
                    subtitle: Text(
                        'Lat ${request.lat}, Lng ${request.lng} • Distance ${request.distanceKm} km'),
                  ),
                  ListTile(
                    title: const Text('Contact user'),
                    subtitle: Text(request.userPhone),
                    trailing: IconButton(
                      icon: const Icon(Icons.call),
                      onPressed: () {
                        // implement call action or pass handler
                      },
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  // Fallback simple maps launcher (no external packages)
  void _openMapsDefault(double lat, double lng) {
    // Intentionally left blank — recommend using url_launcher package:
    // final url = 'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng';
    // launchUrlString(url);
  }
}

/// Helper that opens the modal and shows the DraggableScrollableSheet inside it.
///
/// Example usage:
/// showRequestDetailsSheet(context, request);
Future<void> showRequestDetailsSheet(
    BuildContext context,
    WasteRequest request, {
      VoidCallback? onAccept,
      VoidCallback? onNavigate,
    }) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      // Wrap in SafeArea to avoid system UI overlap
      return SafeArea(
        child: RequestDetailsSheet(
          request: request,
          onAccept: onAccept,
          onNavigate: onNavigate,
        ),
      );
    },
  );
}
