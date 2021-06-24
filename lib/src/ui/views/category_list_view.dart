import 'package:canton_design_system/canton_design_system.dart';
import 'package:canton_news_app/src/ui/providers/categories_provider.dart';

class CategoryListView extends StatefulWidget {
  final searchController = TextEditingController();

  @override
  _CategoryListViewState createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    return CantonScaffold(
      body: _content(context),
    );
  }

  Widget _content(BuildContext context) {
    return Column(
      children: <Widget>[
        _header(context),
        SizedBox(height: 7),
        _body(),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CantonBackButton(isClear: true),
        Text(
          'Categories',
          style: Theme.of(context).textTheme.headline6.copyWith(
                color: Theme.of(context).primaryColor,
              ),
        ),
        Container(width: 60),
      ],
    );
  }

  Widget _body() {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          String category = categories[index];
          return CheckboxListTile(
            activeColor: Theme.of(context).primaryColor,
            title: Row(children: [
              Container(
                padding: const EdgeInsets.all(5),
                child: Text(
                  category.substring(0, 1),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              SizedBox(width: 7),
              Expanded(
                child: Text(category,
                    style: Theme.of(context).textTheme.headline6),
              )
            ]),
            value: categoriesState[index],
            onChanged: (value) {
              // TODO use providers
              setState(() {
                categoriesState[index] = value;
              });
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 7);
        },
        itemCount: 7,
      ),
    );
  }
}
