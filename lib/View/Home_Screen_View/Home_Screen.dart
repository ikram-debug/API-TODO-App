import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
import 'package:todo_app/ViewModel/todo_viewmodel.dart';
import 'package:todo_app/routes/routes_names.dart';
import 'package:todo_app/ViewModel/auth_viewmodel.dart';


import '../../Core/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  late String _id;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      Provider.of<todoprovider>(context, listen: false).gettood(context);
    });
  }

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final todoVM = Provider.of<todoprovider>(context);
    final authvm = Provider.of<AuthViewmodel>(context);
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
              Consumer<AuthViewmodel>(builder: (context,auth, _){
                return  CustomListTile(
                  icon: Icons.logout,
                  text: 'Logout',
                  loading: auth.logoutloading,
                  onTap: () {
                    authvm.logoutuser(context);
                  },
                  sizebox: AppSizes.wp(5),
                );
              })
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
                    child: todoVM.getloading ?
                    Center(
                      child: CircularProgressIndicator(
                        color: kwhitecolor,
                      ),
                    ): ListView.builder(
                        itemCount: todoVM.todos.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, i){
                          final todo = todoVM.todos[i];
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
                                          todo.title ?? 'No Title',
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
                                                  arguments: {
                                                    'id': todo.id,
                                                    'title': todo.title,
                                                    'description': todo.discriptaion
                                                  },
                                                      (routes) => true
                                              );
                                            }
                                            if (value == 'delete') {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Consumer<todoprovider>(
                                                    builder: (context, todoVM, child) {
                                                      return AlertDialog(
                                                        backgroundColor: kwhitecolor,
                                                        title: Text(
                                                          'Confirm Delete',
                                                          style: AppTextStyle.TD,
                                                        ),
                                                        content: Text(
                                                          'Are you sure you want to delete this item?',
                                                          style: AppTextStyle.body,
                                                        ),
                                                        actions: [
                                                          CustomInkwellbutton2(
                                                            title: 'Cancel',
                                                            onpress: () {
                                                              Navigator.pop(context);
                                                            },
                                                          ),
                                                          CustomInkwellbutton(
                                                            backgroundColor: kredcolor,
                                                            title: 'Delete',
                                                            loading: todoVM.deleteloading,
                                                            onpress: () {
                                                              if (todo.id != null && todo.id!.isNotEmpty) {
                                                                todoVM.deletetodo(todo.id!.toString(), context);
                                                              } else {
                                                                Utils.flushbar("ID not found for this todo", context);
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            }

                                          },
                                        ),
                                      ],
                                    ),
                                    AppGaps.h1(),
                                    Text(
                                     todo.discriptaion ?? 'No Discription',
                                      style: AppTextStyle.body,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
