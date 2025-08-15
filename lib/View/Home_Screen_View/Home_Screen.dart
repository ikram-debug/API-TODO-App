import 'package:flutter/material.dart';
import 'package:todo_app/Core/constant/AppGaps.dart';
import 'package:todo_app/Core/constant/app_colors.dart';
import 'package:todo_app/Core/constant/app_paddings.dart';
import 'package:todo_app/Core/constant/app_sizes.dart';
import 'package:todo_app/Core/constant/text_sizes.dart';
import 'package:todo_app/Core/widgets/Custom_Inkwellbutton2.dart';
import 'package:todo_app/Core/widgets/custom_Inkwellbutton.dart';
import 'package:todo_app/Core/widgets/custom_textfield.dart';
import 'package:todo_app/View/Home_Screen_View/Widget/Custom_FloatingButton.dart';
import 'package:todo_app/View/Home_Screen_View/Widget/Custom_ListTile.dart';
import 'package:todo_app/routes/routes_names.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        floatingActionButton: CustomFloatingbutton(
            icon: Icons.add,
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context,
                  RoutesNames.postscreen,
                  (routes) => true
              );
            },
        ),
        drawer: Drawer(
          backgroundColor: kredcolor,
          width: AppSizes.wp(70),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: kwhitecolor,
                child: DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: Center(
                    child: SizedBox(
                      height: AppSizes.hp(15),
                      child: Image.asset(
                        'assets/Logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              AppGaps.h5(),
              CustomListTile(
                  icon: Icons.home,
                  text: 'Home',
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(context,
                        RoutesNames.homescreen,
                        (routes)=> false
                    );
                  },
                  sizebox: AppSizes.wp(5),
              ),
              CustomListTile(
                icon: Icons.logout,
                text: 'Logout',
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(context,
                      RoutesNames.wellcomde,
                          (routes)=> false
                  );
                },
                sizebox: AppSizes.wp(5),
              ),
            ],
          ),
        ),

        appBar: AppBar(
          backgroundColor: kwhitecolor,
          title: Text(
            'TODO LIST',
            style: AppTextStyle.TD,
          ),
          centerTitle: true,
        ),
        body:Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                'assets/BackGround Image.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
                padding: AppPaddings.only(top: 3,left: 3,right: 3,bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Form(
                    key: _formkey,
                    child: CustomTextField(
                      hintText: 'Search here...',
                      prefixIcon: Icons.search,
                    ),
                  ),
                  AppGaps.h2(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 20,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, i){
                        return Padding(
                          padding: AppPaddings.bottom(1),
                          child: Card(
                            color: kwhitecolor,
                            child: Padding(
                              padding: AppPaddings.all(2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Flutter Task',
                                        style: AppTextStyle.Title,
                                      ),
                                      PopupMenuButton(
                                          child: Icon(
                                            Icons.more_vert,
                                            size: AppSizes.hp(3),
                                          ),
                                          itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<String>> [
                                            PopupMenuItem(
                                              value: 'edit',
                                              child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.edit,
                                                    ),
                                                    AppGaps.w5(),
                                                    Text(
                                                      'Edit',
                                                    ),
                                                  ]
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: 'delete',
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.delete,
                                                  ),
                                                  AppGaps.w2(),
                                                  Text(
                                                    'Delete',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        onSelected: (String value){
                                            if(value == 'edit'){
                                              Navigator.pushNamedAndRemoveUntil(context,
                                                  RoutesNames.editscreen,
                                                  (routes) => true
                                              );
                                            }
                                            if(value == 'delete'){
                                              showDialog(
                                                  context: context,
                                                  builder: (context){
                                                    return AlertDialog(
                                                      backgroundColor: kwhitecolor,
                                                      title:  Text(
                                                          'Confirm Delete',
                                                        style: AppTextStyle.TD,
                                                      ),
                                                      content: Text(
                                                          'Are you sure you want to delete this item?',
                                                        style: AppTextStyle.body,
                                                      ),
                                                      actions: [
                                                        CustomInkwellbutton2(
                                                            title: 'Cancle',
                                                            onpress: () {
                                                              Navigator.pop(context);
                                                            }
                                                        ),
                                                        CustomInkwellbutton(
                                                          backgroundColor: kredcolor,
                                                            title: 'Delete',
                                                            onpress: () {
                                                              Navigator.pop(context);
                                                            }
                                                        )
                                                      ],
                                                    );
                                                  }
                                              );
                                            }
                                        },
                                      ),
                                    ],
                                  ),
                                  AppGaps.h1(),
                                  Text(
                                    'I want to complate my project in this week\nAnd i am starting new project for my clint that have special for me ',
                                    style: AppTextStyle.body,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
