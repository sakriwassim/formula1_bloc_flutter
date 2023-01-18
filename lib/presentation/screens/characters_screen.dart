import 'package:block_breakingbad_flutter/business_logic/cubit/characters_cubit.dart';
import 'package:block_breakingbad_flutter/constants/my_colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

import '../../authentification/controllers/auth_controller.dart';
import '../../constants/text_widget_text1.dart';
import '../../data/models/characters.dart';
import '../widgets/character_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<Character> allCharacters = [];
  List<Character> searchedForCharacters = [];
  bool _isSearching = false;
  final _searchTextController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<CharactersCubit>(context).GetAllCharacters();
    super.initState();
  }

  // Widget _buildSearchField() {
  //   return Row(
  //     children: [
  //       TextField(
  //         controller: _searchTextController,
  //         cursorColor: MyColors.myGrey,
  //         decoration: InputDecoration(
  //             hintText: "Find a character",
  //             border: InputBorder.none,
  //             hintStyle: TextStyle(color: MyColors.myGrey, fontSize: 18)),
  //         style: TextStyle(color: MyColors.myGrey, fontSize: 18),
  //         onChanged: (searchedCharacter) {
  //           addSearchedFOrItemsToSearchedList(searchedCharacter);
  //         },
  //       ),
  //       InkWell(onTap: () => _stopSearching(), child: Icon(Icons.close)),
  //     ],
  //   );
  // }

  // void addSearchedFOrItemsToSearchedList(searchedCharacter) {
  //   searchedForCharacters = allCharacters
  //       .where((character) =>
  //           character.fullName!.toLowerCase().startsWith(searchedCharacter))
  //       .toList();

  //   setState(() {});
  // }

  // void _clearSearch() {
  //   setState(() {
  //     _searchTextController.clear();
  //   });
  // }

  // List<Widget> _buildAppBarActions() {
  //   if (_isSearching) {
  //     return [
  //       IconButton(
  //         onPressed: () {
  //           _clearSearch();
  //           Navigator.pop(context);
  //         },
  //         icon: Icon(Icons.clear, color: MyColors.myGrey),
  //       ),
  //     ];
  //   } else {
  //     return [
  //       IconButton(
  //         onPressed: _startSearch,
  //         icon: Icon(
  //           Icons.search,
  //           color: MyColors.myGrey,
  //         ),
  //       ),
  //     ];
  //   }
  // }

  // void _startSearch() {
  //   ModalRoute.of(context)!
  //       .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

  //   setState(() {
  //     _isSearching = true;
  //   });
  // }

  // void _stopSearching() {
  //   _clearSearch();

  //   setState(() {
  //     _isSearching = false;
  //   });
  // }

  Widget buildBlockWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = (state).characters;
          return buildLoadedListWidgets();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildLoadedListWidgets() {
    return buildCharactersList();
  }

  Widget buildCharactersList() {
    return ListView.builder(
        itemCount: _searchTextController.text.isEmpty
            ? allCharacters.length
            : searchedForCharacters.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
              color: Color.fromARGB(255, 255, 255, 255),
              //  height: 50,
              //  width: 50,
              alignment: Alignment.center,
              // decoration: BoxDecoration(
              //     color: Colors.amber, borderRadius: BorderRadius.circular(15)),
              child: CharacterItem(
                  character: _searchTextController.text.isEmpty
                      ? allCharacters[index]
                      : searchedForCharacters[index]));
        });
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Characters',
      style: TextStyle(color: MyColors.myGrey),
    );
  }

  Widget buildheadWigdet() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          )),
      height: 70,
      child: Center(
          child: TextSFProRounded(
        color: Color.fromARGB(255, 255, 0, 0),
        fontWeight: FontWeight.w700,
        size: 20,
        title: "Top 10 ranking 2021",
      )
      
      
      ),
    );
  }

  Widget builtopWigdet() {
    return Container(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.asset("assets/images/Avatar.png")),
            SizedBox(
              width: 10,
            ),
            Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextSFProRounded(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w500,
                      size: 20,
                      title: "Good morning,",
                    ),
                  ],
                )),
            IconButton(
              onPressed: () {
                Auth().signOut();
              },
              icon: Icon(color: Colors.white, Icons.logout),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNoInternetWidget() {
    return Center(
      child: Container(
        color: MyColors.myGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset('assets/images/nointernet.gif')
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      // appBar: AppBar(
      //   backgroundColor: MyColors.myYellow,
      //   title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
      //   actions: _buildAppBarActions(),
      //   leading: _isSearching
      //       ? const BackButton(
      //           color: MyColors.myGrey,
      //         )
      //       : Container(),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            builtopWigdet(),
            buildheadWigdet(),
            Expanded(
              child: OfflineBuilder(
                  connectivityBuilder: (BuildContext context,
                      ConnectivityResult connectivity, Widget child) {
                    final bool connected =
                        connectivity != ConnectivityResult.none;

                    if (connected) {
                      return buildBlockWidget();
                    } else {
                      return buildNoInternetWidget();
                    }
                  },
                  child: showLoadingIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}
