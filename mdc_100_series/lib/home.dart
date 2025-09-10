// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  List<Card> _buildCards(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    return products.map((Product product) {
      return Card(
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitHeight,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: theme.textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${product.price} USD',
                    style: theme.textTheme.titleSmall,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    // TODO: Pass Category variable to AsymmetricView (104)
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          title: const Text("Shrine"),
          leading: IconButton(
            onPressed: () {
              print('menu pressed');
            },
            icon: const Icon(
              Icons.menu,
              semanticLabel: 'menu',
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  semanticLabel: 'search',
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune,
                  semanticLabel: 'tune',
                )),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(12),
          children: _buildCards(context),
          childAspectRatio: 10 / 13,
        ));
  }
}
