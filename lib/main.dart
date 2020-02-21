import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/common/theme.dart';
import 'package:provider_shopper/models/favourites.dart';
import 'package:provider_shopper/models/list.dart';
import 'package:provider_shopper/screens/favourites.dart';
import 'package:provider_shopper/screens/list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => ListModel()),
        ChangeNotifierProxyProvider<ListModel, FavouritesModel>(
          create: (context) => FavouritesModel(),
          update: (context, list, favourites) {
            favourites.list = list;
            return favourites;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => MyList(),
          '/favourites': (context) => MyFavourites(),
        },
      ),
    );
  }
}
