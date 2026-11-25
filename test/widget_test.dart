import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart' as app;

void main() {
  testWidgets('exibe a tela de login do FitPlan', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('FITPLAN PREMIUM'), findsOneWidget);
    expect(find.text('ENTRAR'), findsOneWidget);
  });
}
