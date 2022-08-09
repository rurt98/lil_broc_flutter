import 'package:flutter/material.dart';
import 'package:lil_broc/db/produce_list.dart';
import 'package:lil_broc/helpers/constants.dart';
import 'package:lil_broc/models/produce.dart';
import 'package:lil_broc/pages/produce_page.dart';
import 'package:lil_broc/theme/app_theme.dart';

class AddItemPage extends StatefulWidget {
  final TypeNavigation typeNavigation;
  const AddItemPage({
    Key? key,
    required this.typeNavigation,
  }) : super(key: key);

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  List<Produce> firstList = [];
  List<Produce> secondList = [];
  List<Produce> _productSearched = [];
  bool allProducts = false;
  bool aToz = true;

  final List<Produce> _allProducts = [];
  final nameSearched = TextEditingController();

  @override
  void initState() {
    int count1 = 2;
    int count2 = 5;
    for (var i = 0; i <= count1; i++) {
      firstList.add(produceList[i]);
    }
    for (var i = 3; i <= count2; i++) {
      secondList.add(produceList[i]);
    }

    _allProducts.addAll(produceList);

    _allProducts.sort((a, b) => a.name.compareTo(b.name));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin:
            const EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 100),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 0),
          child: Column(
            mainAxisAlignment: nameSearched.text == "" && !allProducts
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, theme),
              if (nameSearched.text == "" && !allProducts) ...[
                Text(
                  "Quick Add",
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
                _buildQuickAdd(firstList),
                const SizedBox(height: 40),
                _buildQuickAdd(secondList),
                const SizedBox(height: 40),
                _buildRecentSearches(),
              ] else ...[
                if (!allProducts) ...[
                  if (_productSearched.isNotEmpty) ...[
                    _buildProductsSearched(size),
                  ] else ...[
                    _buildEmptyList(size)
                  ],
                ] else ...[
                  _buildAllProduce(size),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAllProduce(Size size) {
    return SizedBox(
      height: size.height * 0.6,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "All Produce",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 15,
                ),
              ),
              IconButton(
                onPressed: () {
                  aToz = !aToz;
                  if (aToz) {
                    _allProducts.sort((a, b) => a.name.compareTo(b.name));
                  } else {
                    _allProducts.sort((a, b) => b.name.compareTo(a.name));
                  }
                  setState(() {});
                },
                icon: const Icon(Icons.swap_vert),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: _allProducts
                    .map(
                      (p) => Column(
                        children: [
                          GestureDetector(
                            onTap: () => _onTapProduce(p),
                            child: Container(
                              height: 70,
                              width: double.infinity,
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/fruits_vegetables/${p.image}",
                                        fit: BoxFit.fill,
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Text(
                                        p.name,
                                        style: const TextStyle(fontSize: 18),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyList(Size size) {
    return Container(
      height: size.height * 0.50,
      margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      child: Text(
        "Not finding what you're looking for? Request your produce Item here",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _buildProductsSearched(Size size) {
    return SizedBox(
      height: size.height * 0.6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Search Result",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: _productSearched
                    .map(
                      (p) => GestureDetector(
                        onTap: () => _onTapProduce(p),
                        child: Container(
                          height: 80,
                          width: double.infinity,
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: AppTheme.lilBrocGreen!.withOpacity(0.3),
                              width: 1.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/fruits_vegetables/${p.image}",
                                    fit: BoxFit.fill,
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    p.name,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentSearches() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          Text(
            "Recent Searches",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 15,
            ),
          ),
          Wrap(
            children: produceList
                .map((p) => GestureDetector(
                      onTap: () {
                        setState(() {
                          nameSearched.text = p.name;
                        });
                        _searchProduce(nameSearched.text);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          p.name,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      ),
    );
  }

  Widget _buildQuickAdd(List<Produce> produce) {
    return FittedBox(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: produce
              .map(
                (p) => GestureDetector(
                  onTap: () => _onTapProduce(p),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/fruits_vegetables/${p.image}",
                          height: 60.0,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          p.name,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme) {
    return Column(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Add Item(s)",
                  style: TextStyle(
                    color: AppTheme.lilBrocOrange!.withOpacity(0.8),
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                iconSize: 20,
                onPressed: () => Navigator.pop(context),
                icon: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Icon(Icons.close),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[600]!.withOpacity(0.4),
                blurRadius: 10,
              )
            ],
            color: Colors.white,
          ),
          child: TextField(
            controller: nameSearched,
            decoration: InputDecoration(
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: theme.primaryColor,
                  size: 30,
                ),
              ),
              suffixIcon: IconButton(
                splashRadius: 1.0,
                icon: Icon(
                  Icons.menu_book_rounded,
                  color: allProducts ? AppTheme.lilBrocGreen : Colors.grey[600],
                ),
                onPressed: () => setState(() {
                  allProducts = !allProducts;
                }),
              ),
              hintText: "Find Produce",
              // labelText: 'Find Produce',
              border: const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
              ), // <-- SEE HERE
            ),
            onChanged: (v) => _searchProduce(v),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
      ],
    );
  }

  void _searchProduce(String txt) {
    _productSearched = produceList
        .where(
          (p) => p.name.toLowerCase().contains(txt.toLowerCase()),
        )
        .toList();
    allProducts = false;
    setState(() {});
  }

  void _onTapProduce(Produce produce) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ProducePage(
            pop: () => Navigator.pop(context),
            produce: produce,
            title: "Search",
            typeNavigation: widget.typeNavigation,
          ),
        ),
      );
}
