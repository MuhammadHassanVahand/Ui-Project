import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_ui_project/constan/appColors.dart';
import 'package:mini_ui_project/data/addToFavourie.dart';
import 'package:mini_ui_project/screens/productDetails.dart';
import 'package:mini_ui_project/widget/appSmallText.dart';
import 'package:mini_ui_project/widget/appTopContainer.dart';
import 'package:mini_ui_project/widget/home_screen_searchbar.dart';

// class Favourite extends StatefulWidget {
//   const Favourite({super.key});

//   @override
//   State<Favourite> createState() => _FavouriteState();
// }

// class _FavouriteState extends State<Favourite> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: Column(
//         children: [
//           const TopBar(text: "Favourite"),
//           Expanded(
//             child: Builder(builder: (context) {
//               return GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 263,
//                     crossAxisSpacing: 2,
//                     mainAxisSpacing: 2),
//                 itemCount: favourite.length,
//                 itemBuilder: (context, index) {
//                   return HomeScreenGridItem(
//                     networkImage: favourite[index]["image"][0],
//                     productName: favourite[index]["name"],
//                     productType: favourite[index]["type"],
//                     price: favourite[index]["price"],
//                     details: favourite[index]["details"],
//                     imageCount: favourite[index]["image"].length,
//                     imagesForSlider: favourite[index]["image"],
//                   );
//                 },
//               );
//             }),
//           )
//         ],
//       ),
//     ));
//   }
// }

class FavouriteList extends StatefulWidget {
  const FavouriteList({super.key});

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Favourite"),
        iconTheme: IconThemeData(color: AppColors.black100),
        backgroundColor: AppColors.black1,
        titleTextStyle: TextStyle(color: AppColors.black100, fontSize: 20),
      ),
      body: Column(
        children: [
          Expanded(
            child: favourite.isNotEmpty
                ? ListView.builder(
                    itemCount: favourite.length,
                    itemBuilder: (context, index) {
                      String itemKey = favourite[index]["name"];
                      bool itemExists =
                          favourite.any((item) => item["name"] == itemKey);
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: AppColors.yellow,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                          itamName: favourite[index]["name"],
                                          catchPhrase: favourite[index]["type"],
                                          price: favourite[index]["price"],
                                          details: favourite[index]["details"],
                                          image: favourite[index]["image"][0],
                                          imageCount:
                                              favourite[index]["image"].length,
                                          imagesForSlider: favourite[index]
                                              ["image"]),
                                    ));
                              },
                              child: ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.blue,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          favourite[index]["image"][0]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: AppSmallText(
                                    text: favourite[index]["name"]),
                                subtitle: AppSmallText(
                                    text: "${favourite[index]["price"]}"),
                                trailing: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            favourite.removeAt(index);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                    "Remove from favourite"),
                                                duration:
                                                    Duration(milliseconds: 600),
                                              ),
                                            );
                                          });
                                        },
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidHeart,
                                          color: itemExists
                                              ? Colors.pink
                                              : Colors.black,
                                          size: 19,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: AppSmallText(
                      text: "No Favourite item/s",
                      color: AppColors.black100,
                      size: 20,
                    ),
                  ),
          ),
        ],
      ),
    ));
  }
}
