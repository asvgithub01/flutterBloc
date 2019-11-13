import 'package:flutter/cupertino.dart';
import 'package:flutter_app_bloc_sample/src/data/providers/Blocprovider.dart';


class BlocProviderMultiple<T extends BlocBase> extends StatefulWidget {
   // T bloc;
  final List<T>  blocs;
  final Widget child;

  BlocProviderMultiple({
    Key key,
    @required this.child,
    @required this.blocs
  }): super(key: key);


  @override
  _BlocProviderMultipleState<T> createState() => _BlocProviderMultipleState<T>();
   //asv aqui la movida es que no buscarmos un provider del tipo T lo buscamos del tipo base(blocBase)
  //una vez encontrado buscamos dentro de sus blocs ya el tipo T requerido, rin
  static T of<T extends BlocBase>(BuildContext context) {

    final blocType = _typeOf<BlocProviderMultiple<BlocBase>>();

    BlocProviderMultiple<BlocBase> provider = context.ancestorWidgetOfExactType(blocType);
    T bloc = provider.blocs[provider.blocs.indexWhere((bloc) => bloc is T)];
    return bloc;
  }

  static Type _typeOf<T>() {
    return T;
  }
}

class _BlocProviderMultipleState<T> extends State<BlocProviderMultiple<BlocBase>> {

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void dispose() {

    //widget.bloc.dispose();
    super.dispose();
  }
}
