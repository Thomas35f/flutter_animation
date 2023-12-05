# Install
``` bash
flutter pub get
flutter run
```

## Widgets utilisés
Ce projet sert à se familiariser avec des widgets d'animation. Aucune dépendance supplémentaire n'est utilisé.
Au lancement de l'application, les anims se lanceront automatiquement puis se répéteront une fois fini.

Il y'a 2 carrés qui sont animés. Chaque carré est associé à un AnimationController.
Les widgets utilisés sont : 

- AnimationController : C'est le widget qui créé l'animation. On y définit la durée de l'animation
- Tween : On y spécifie des coordonnées à partir desquelles l'animation se joue/s'arrête
- SlideTransition : On déplace l'enfant de ce widget
- CurvedAnimation : On définit ici la courbe d'interpolation de l'animation

On mettant des coordonnées fixes aux carrés, cela permet de les faire chevaucher. 
