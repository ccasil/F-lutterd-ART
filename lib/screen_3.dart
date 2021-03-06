import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/catalog.dart';
import 'src/item_tile.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Infinite List Screen'),
      ),
      body: Selector<Catalog, int?>(
        // Selector is a widget from package:provider. It allows us to listen
        // to only one aspect of a provided value. In this case, we are only
        // listening to the catalog's `itemCount`, because that's all we need
        // at this level.
        selector: (context, catalog) => catalog.itemCount,
        builder: (context, itemCount, child) => ListView.builder(
          // When `itemCount` is null, `ListView` assumes an infinite list.
          // Once we provide a value, it will stop the scrolling beyond
          // the last element.
          itemCount: itemCount,
          padding: const EdgeInsets.symmetric(vertical: 18),
          itemBuilder: (context, index) {
            // Every item of the `ListView` is individually listening
            // to the catalog.
            var catalog = Provider.of<Catalog>(context);

            // Catalog provides a single synchronous method for getting
            // the current data.
            var item = catalog.getByIndex(index);

            if (item.isLoading) {
              return LoadingItemTile();
            }

            return ItemTile(item: item);
          },
        ),
      ),
    );
  }
}