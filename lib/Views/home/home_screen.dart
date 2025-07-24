import 'package:flutter/material.dart' as material;

import 'package:real_estate/theme/color.dart';
import 'package:real_estate/utils/data.dart';
import 'package:real_estate/widgets/category_item.dart';
import 'package:real_estate/widgets/custom_image.dart';
import 'package:real_estate/widgets/custom_textbox.dart';
import 'package:real_estate/widgets/icon_box.dart';
import 'package:real_estate/widgets/property_item.dart';
import 'package:real_estate/widgets/recent_item.dart';
import 'package:real_estate/widgets/recommend_item.dart';

class HomeScreen extends material.StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends material.State<HomeScreen> {
  int _selectedCategory = 0;

  @override
  material.Widget build(material.BuildContext context) {
    return material.CustomScrollView(
      slivers: [
        material.SliverAppBar(
          backgroundColor: AppColor.appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: _buildHeader(),
        ),
        material.SliverToBoxAdapter(child: _buildBody())
      ],
    );
  }

  material.Widget _buildHeader() {
    return material.Column(
      children: [
        material.Row(
          crossAxisAlignment: material.CrossAxisAlignment.center,
          mainAxisAlignment: material.MainAxisAlignment.spaceBetween,
          children: [
            material.Column(
              crossAxisAlignment: material.CrossAxisAlignment.start,
              children: [
                material.Text(
                  "Hello!",
                  style: material.TextStyle(
                    color: AppColor.darker,
                    fontSize: 14,
                    fontWeight: material.FontWeight.w500,
                  ),
                ),
                material.Text(
                  "Sangvaleap",
                  style: material.TextStyle(
                    color: material.Colors.black87,
                    fontSize: 17,
                    fontWeight: material.FontWeight.w600,
                  ),
                ),
              ],
            ),
            CustomImage(
              profile,
              width: 35,
              height: 35,
              trBackground: true,
              borderColor: AppColor.primary,
              radius: 10,
            ),
          ],
        ),
      ],
    );
  }

  material.Widget _buildBody() {
    return material.SingleChildScrollView(
      child: material.Column(
        crossAxisAlignment: material.CrossAxisAlignment.start,
        children: [
          const material.SizedBox(height: 15),
          _buildSearch(),
          const material.SizedBox(height: 20),
          _buildCategories(),
          const material.SizedBox(height: 20),
          material.Padding(
            padding: const material.EdgeInsets.symmetric(horizontal: 15),
            child: material.Row(
              mainAxisAlignment: material.MainAxisAlignment.spaceBetween,
              children: const [
                material.Text("Popular", style: material.TextStyle(fontSize: 18, fontWeight: material.FontWeight.w600)),
                material.Text("See all", style: material.TextStyle(fontSize: 14, color: AppColor.darker)),
              ],
            ),
          ),
          const material.SizedBox(height: 20),
          _buildPopulars(),
          const material.SizedBox(height: 20),
          material.Padding(
            padding: const material.EdgeInsets.symmetric(horizontal: 15),
            child: material.Row(
              mainAxisAlignment: material.MainAxisAlignment.spaceBetween,
              children: [
                const material.Text("Recommended", style: material.TextStyle(fontSize: 18, fontWeight: material.FontWeight.w600)),
                material.Text("See all", style: material.TextStyle(fontSize: 14, color: material.Colors.black.withOpacity(0.7))),
              ],
            ),
          ),
          const material.SizedBox(height: 20),
          _buildRecommended(),
          const material.SizedBox(height: 20),
          material.Padding(
            padding: const material.EdgeInsets.symmetric(horizontal: 15),
            child: material.Row(
              mainAxisAlignment: material.MainAxisAlignment.spaceBetween,
              children: const [
                material.Text("Recent", style: material.TextStyle(fontSize: 18, fontWeight: material.FontWeight.w600)),
                material.Text("See all", style: material.TextStyle(fontSize: 14, color: AppColor.darker)),
              ],
            ),
          ),
          const material.SizedBox(height: 20),
          _buildRecent(),
          const material.SizedBox(height: 100),
        ],
      ),
    );
  }

  material.Widget _buildSearch() {
    return material.Padding(
      padding: const material.EdgeInsets.symmetric(horizontal: 15),
      child: material.Row(
        children: [
          material.Expanded(
            child: CustomTextBox(
              hint: "Search",
              prefix: const material.Icon(material.Icons.search, color: material.Colors.grey),
            ),
          ),
          const material.SizedBox(width: 10),
          IconBox(
            child: const material.Icon(material.Icons.filter_list_rounded, color: material.Colors.white),
            bgColor: AppColor.secondary,
            radius: 10,
          )
        ],
      ),
    );
  }

  material.Widget _buildCategories() {
    List<material.Widget> lists = List.generate(
      categories.length,
          (index) => CategoryItem(
        data: categories[index],
        selected: index == _selectedCategory,
        onTap: () {
          setState(() {
            _selectedCategory = index;
          });
        },
      ),
    );
    return material.SingleChildScrollView(
      scrollDirection: material.Axis.horizontal,
      padding: const material.EdgeInsets.only(bottom: 5, left: 15),
      child: material.Row(children: lists),
    );
  }

  material.Widget _buildPopulars() {
    return material.SizedBox(
      height: 240,
      child: material.PageView.builder(
        controller: material.PageController(viewportFraction: 0.8),
        itemCount: populars.length,
        itemBuilder: (context, index) {
          return material.Padding(
            padding: const material.EdgeInsets.symmetric(horizontal: 5),
            child: PropertyItem(data: populars[index]),
          );
        },
      ),
    );
  }

  material.Widget _buildRecommended() {
    List<material.Widget> lists = List.generate(
      recommended.length,
          (index) => RecommendItem(data: recommended[index]),
    );
    return material.SingleChildScrollView(
      scrollDirection: material.Axis.horizontal,
      padding: const material.EdgeInsets.only(bottom: 5, left: 15),
      child: material.Row(children: lists),
    );
  }

  material.Widget _buildRecent() {
    List<material.Widget> lists = List.generate(
      recents.length,
          (index) => RecentItem(data: recents[index]),
    );
    return material.SingleChildScrollView(
      scrollDirection: material.Axis.horizontal,
      padding: const material.EdgeInsets.only(bottom: 5, left: 15),
      child: material.Row(children: lists),
    );
  }
}
