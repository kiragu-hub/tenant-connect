import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tenantconnect/app/app.dart';

void main() {
  testWidgets('App builds and displays', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const TenantConnectApp());

    // Verify that the app built successfully
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
