// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:assessment_project/model/search_result_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/response/status.dart';
import '../res/components/home/grid.dart';
import '../res/components/home/lines_with_space_widget.dart';
import '../res/components/home/postfix_appbar_icon.dart';
import '../res/components/home/prefix_appbar_icon.dart';
import '../utils/utils.dart';
import '../view model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double height = Utils.screenHeight;
  final homeViewModel = HomeViewModel();
  late SearchResultModel _searchResultModel;

  @override
  void initState() {
    homeViewModel.fetchSearchResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(height: height),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) =>
            homeViewModel, // Create that object of HomeViewModel, that we want to use
        child: Consumer<HomeViewModel>(builder: (context, value, _) {
          debugPrint(value.apiResponse.status.toString());
          switch (value.apiResponse.status) {
            case Status.LOADING:
              return const Center(
                child: CircularProgressIndicator(),
              );
            // return shimmerLoadingGridView();
            case Status.ERROR:
            // return Utils.toastMessage(value.apiResponse.message.toString());
            case Status.COMPLETED:
              _searchResultModel = value.apiResponse.data!;
              return Column(
                children: [
                  SizedBox(height: height * .02),
                  LinesWithSpaceWidget(height: height * .1),
                  Grid(
                    itemCount: _searchResultModel.hits!.length,
                    height: height,
                    hits: _searchResultModel.hits!,
                  ),
                ],
              );
            default:
              return Container();
          }
        }),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const CustomAppBar({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.grey.withOpacity(0.5), // Grey background
      elevation: 0, // No elevation
      titleSpacing: 0,
      title: const SearchBar(),
      leading: PrefixAppBarIcon(height: height * .12),
      actions: [PostfixAppBarIcon(height: height * .5)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final homeViewModel = context.watch<HomeViewModel>();

    return Padding(
      padding: const EdgeInsets.all(kToolbarHeight * .12), // Outer Side Padding
      child: Container(
        height: kToolbarHeight * 0.8, // Height: 80% of AppBar height
        padding: const EdgeInsets.symmetric(
            horizontal:
                kToolbarHeight * 0.3), // Adjust inner horizontal padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kToolbarHeight * 0.5),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: homeViewModel.searchController,
                onChanged: homeViewModel.updateTextEntered,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: kToolbarHeight * 0.3),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            homeViewModel.isTextEntered
                ? clearSearchBarButton()
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }

  Widget clearSearchBarButton() {
    return Consumer<HomeViewModel>(
      builder: (context, value, child) => Container(
        width: kToolbarHeight * 0.4, // Adjust as needed
        height: kToolbarHeight * 0.4, // Adjust as needed
        alignment: Alignment.center,
        child: MaterialButton(
          onPressed: () {
            value.clearSearchBar();
          },
          elevation: 2.0,
          color: Colors.grey.shade400,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(0), // Remove padding
          child: const Icon(
            Icons.close_rounded,
            size: 18.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
