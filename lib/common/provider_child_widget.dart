
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../provider/HomeProvider.dart';


class ProviderHelperClass{
  static ProviderHelperClass? _instance;

  static ProviderHelperClass get instance {
    _instance ??= ProviderHelperClass();
    return _instance!;
  }

  List<SingleChildWidget> providerLists = [
    ChangeNotifierProvider(create: (context) => HomeProvider()),
  ];

}