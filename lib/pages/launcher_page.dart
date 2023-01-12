// ignore_for_file: deprecated_member_use

import 'package:aplication_colores_page/routes/routes.dart';
import 'package:aplication_colores_page/theme.dart/theme.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeApp = Provider.of<ThemeChanger>(context);
    final accentColor = themeApp.currenttheme?.accentColor;

    Map<String, double> dataMap = {
    "Alide Show": 5,
    "Image Show": 3,
    "Camera Show": 2,
    "Menu Show": 2,
  };
    return Scaffold(
      appBar: AppBar(
        backgroundColor: accentColor,
        title:  const Text('Custom ThemeData'),
      ),
      drawer: const _menuPrincipal(),
      body: Column(
       
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height*.5,
            child: PieChart(dataMap: dataMap,
            chartType: ChartType.ring,
            centerText: 'Theme',)) ,

          const Expanded(child: _ListadeOpciones()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: accentColor,
        onPressed: () {},
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _menuPrincipal extends StatelessWidget {
  const _menuPrincipal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeApp = Provider.of<ThemeChanger>(context);
    final accentColor = themeApp.currenttheme?.accentColor;
    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: accentColor,
                  child: const Text(
                    'AL',
                    style: TextStyle(fontSize: 40),
                  ),
                )),
          ),
          const Expanded(child: _ListadeOpciones()),
          ListTile(
            leading: themeApp.darltheme == true
                ? Icon(
                    Icons.dark_mode,
                    color: accentColor,
                  )
                : Icon(
                    Icons.light_mode,
                    color: accentColor,
                  ),
            title: themeApp.darltheme == true
                ? Text(
                    'Dark Mode',
                    style: _style(accentColor),
                  )
                : Text(
                    'Light Mode',
                    style: _style(accentColor),
                  ),
            trailing: Switch.adaptive(
                value: themeApp.darltheme,
                activeColor: Colors.blue,
                onChanged: (value) {
                  themeApp.darltheme = value;
                }),
          ),
          ListTile(
            leading: Icon(
              Icons.add_to_home_screen,
              color: accentColor,
            ),
            title: Text(
              'Custom Mode',
              style: _style(accentColor),
            ),
            trailing: Switch.adaptive(
                value: themeApp.customTheme,
                activeColor: Colors.blue,
                onChanged: (value) {
                  themeApp.customTheme = value;
                }),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  TextStyle _style(Color? accentColor) => TextStyle(color: accentColor);
}

class _ListadeOpciones extends StatelessWidget {
  const _ListadeOpciones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context).currenttheme;
    final accentcolor = theme?.accentColor;
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: accentcolor,
            child: pageRoute[index].icon,
          ),
          title: Text(
            pageRoute[index].titulo,
            style: TextStyle(color: accentcolor),
          ),
          trailing: Icon(
            Icons.chevron_right_rounded,
            color: accentcolor,
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => pageRoute[index].page));
          },
        );
      },
      itemCount: pageRoute.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: theme?.primaryColorLight,
      ),
    );
  }
}
