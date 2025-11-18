import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../application/config/assets_config_language.dart';
import 'language_provider.dart';

class Providers {
  static List<SingleChildWidget> listenerNotifiersProviders() {
    return [
      ChangeNotifierProvider<LanguageProvider>(
        create: (_) => LanguageProvider(
          assetsFileNames: [
            AssetsConfigLanguage.assetsLanguageLogin,
            AssetsConfigLanguage.assetsLanguageRegister,
            AssetsConfigLanguage.assetsLanguageWellcome,
          ],
        ),
      )
    ];
  }
}
