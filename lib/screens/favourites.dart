import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_shopper/models/favourites.dart';

class MyFavourites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites', style: Theme.of(context).textTheme.display4),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.lightGreen,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _FavouritesList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            _FavouritesTotal()
          ],
        ),
      ),
    );
  }
}

class _FavouritesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.title;
    var favourites = Provider.of<FavouritesModel>(context);

    return ListView.builder(
      itemCount: favourites.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        title: Text(
          favourites.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _FavouritesTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle = Theme.of(context).textTheme.display4.copyWith(fontSize: 30);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<FavouritesModel>(
                builder: (context, favourites, child) =>
                    Text('\Persons: ${favourites.totalValue}', style: hugeStyle)),
            SizedBox(width: 24),
            FlatButton(
              onPressed: () {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('Calling not supported yet.')));
              },
              color: Colors.white,
              child: Text('Call'),
            ),
          ],
        ),
      ),
    );
  }
}
