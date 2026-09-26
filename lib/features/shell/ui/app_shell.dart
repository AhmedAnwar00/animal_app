import 'package:animal_app/core/network/dio_client.dart';
import 'package:animal_app/core/theme/colors.dart';
import 'package:animal_app/core/widgets/app_bottom_nav.dart';
import 'package:animal_app/features/animal/ui/animal_page.dart';
import 'package:animal_app/features/category/controller/category_controller.dart';
import 'package:animal_app/features/category/service/category_service.dart';
import 'package:animal_app/features/category/ui/category_page.dart';
import 'package:animal_app/features/home/ui/home_page.dart';
import 'package:animal_app/features/me/ui/me_page.dart';
import 'package:animal_app/features/search/ui/search_page.dart';
import 'package:animal_app/features/shell/controller/app_shell_controller.dart';
import 'package:flutter/material.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late final AppShellController _controller;
  late final CategoryController _categoryController;

  @override
  void initState() {
    super.initState();
    _controller = AppShellController();
    _categoryController = CategoryController(CategoryService(DioClient()));
    _categoryController.loadCategories();
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: IndexedStack(
            index: _controller.selectedIndex,
            children: [
              HomePage(categoryController: _categoryController),
              const SearchPage(),
              CategoryPage(controller: _categoryController),
              const AnimalPage(),
              const MePage(),
            ],
          ),
          bottomNavigationBar: AppBottomNav(
            currentIndex: _controller.selectedIndex,
            onTap: _controller.selectTab,
          ),
        );
      },
    );
  }
}
