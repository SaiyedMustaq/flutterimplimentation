import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazy_loading_listview/pagination/blocStructure/model/BeerModel.dart';

class BeerListItem extends StatelessWidget {
  final BeerModel beer;

  const BeerListItem(this.beer);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(beer.name),
      subtitle: Text(beer.tagline),
      childrenPadding: const EdgeInsets.all(16),
      leading: Container(
        margin: EdgeInsets.only(top: 8),
        child: Text(beer.id.toString()),
      ),
      children: [
        Text(
          beer.name,
          textAlign: TextAlign.justify,
        ),
        Switch(value: false, onChanged: (value) {}),
        const SizedBox(height: 20),
        beer?.url == null
            ? Container()
            : Image.network(
                beer.url,
                loadingBuilder: (context, widget, imageChunkEvent) {
                  return imageChunkEvent == null
                      ? widget
                      : CircularProgressIndicator();
                },
                height: 300,
              ),
      ],
    );
  }
}
