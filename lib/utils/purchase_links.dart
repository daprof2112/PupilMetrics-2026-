import 'package:url_launcher/url_launcher.dart';

Future<void> openPurchasePage() async {
  await launchUrl(Uri.parse('https://cnri.edu/pricing/'));
}
