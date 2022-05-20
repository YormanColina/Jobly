#  Description 
<div align='left'>
 Esta en una aplicación que busca hacer semejanza a una aplicación que conecta a los empleadores con los posibles aspirantes mediante vacantes de trabajo en distintas áreas laborales de distintas empresas. Enfocándome en la parte de diseño mayormente y tratando de hacer una aplicación funcional y de fácil manejo para todos

<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/blanco.drawio.png" align="center" height="20"></a>
 
Herramientas:
 
- Consumo de API REST
- Inicio de sesión con Google
- AutoLayout (UIKit)
- Animación de vistas
- CocoaPods
- Creación de view controllers mediante xibs, Sin usar Storyboards
- Customización de UINavigationBar y UINavigationBarButtom
- Uso de UICollectionView, UICollectionViewDelegate, UICollectionViewDatasource, UICollectionViewDelegateFlowLayout
- Creacion y configuracion de sombras
- Navegación entre view controllers usando UINavigationController
- Creacion de vistas con gradientes

Dependencias: 
 
- ObjectMapper: Manejo y transformación de informacion de una Data JSON
- Alamofire: Consumo de servicio API REST, en este caso un mock-services, por ejemplo: 
  * https://demo9229930.mockable.io/android/fronted
  * https://demo9229930.mockable.io/ 
- KingFisher: Descarga de imágenes
- GoogleSignIn: Inicio de sección con Google
- FirebaseAuth: Authenticacion de Google session

Arquitectura:
 
- MVC (Modelo - Vista - Controllador) Use este modelo que me permite conectar el proyecto de manera sencilla donde el controlador es el intermediario entre el modelo de informacion y la vista del modulo
 <div align='center'>
   <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/MVC.drawio.png" align="center"></a>
</div>
 
<div align='center'>
    Relacion entre las las clases del modulo
</div>
 
</div>

# 📲 Login Module

En este módulo se hizo integración de GoogleSignIn dando facilidad al usuario de hacer login con su cuenta de Google, de igual forma se uso FirebaseAuth para la autenticación del usuario, se hizo un manejo de estados de google de manera que si existe un correo registrado en la app se muestra la Home de la aplicación, y en caso de no haber usuario registrado darle acceso al Login de la app, se hizo uso de vistas con gradientes y se utilizo un diseño agradable y óptimo y de fácil uso para cualquier usuario.

<div align='center'>
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/login.gif" align="center" height="700" width="350"></a>
 
 <div align='center'>
  Vista del Login
</div>
 
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/blanco.drawio.png" align="center" height="80"></a>
 
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/LoginClassdiagram.drawio.png" align="center"></a>
 
 <div align='center'>
 Diagrama de comunicacion entre clases
</div>
 
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/blanco.drawio.png" align="center" height="80"></a>

<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/loginFlowDiagram.drawio.png" align="center"></a> 
 
<div align='center'>
 Diagrama de flujo
</div>
 
</div>


 # 🏠 Home Module
 
 En este módulo se realizó uso de collecciones de vistas verticales y horizontales, la información de la home llega desde el consumo de la API usando Alamofire, se realizaron customizaciones en los botones de los UINavigationBarButtons tambien usando la foto de perfil de Google del usuario, se realizaron creaciónes y configuraciones de sombras en los mismos botones, se realizó una optimización en el título de la vista para mayor comodidad del usuario al momento de desplazarse verticalmente sobre la vista, se añadieron collecciones de vistas horizontales para mayor dinamismo en las diferentes secciones de la home con diferentes diseños para las celdas, la sección de recomendados y populares tiene la opción de abrir el detalle de un trabajo, las demás secciónes no tienen accesibilidad por el alcance del proyecto.
 

<div align='center'>
  <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/Home.gif" align="center" height="700" width="350"></a>
<div align='center'>
  Vista de la Home
</div>
 
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/blanco.drawio.png" align="center" height="80"></a>

<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/HomeClassDiagram.drawio.png" align="center"></a>
 
<div align='center'>
  Diagrama de comunicacion entre clases
</div>

<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/blanco.drawio.png" align="center" height="80"></a>
 
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/HomeFlowDiagram.drawio.png" align="center"></a>
 
<div align='center'>
 Diagrama de flujo
</div>

</div>


 # 🧐 Job Detail
 
En este módulo se realizó uso de una colleción de vistas que al igual que la home tiene dinamismo en la cabecera de la vista cambiando el tamaño del texto y de la imagen al momento de desplazarse sobre la vista para mayor observabilidad del contenido, la información viene desde el consumo de una API usando Alamofire, se hizo diseño de direfentes celdas para la collecion, al igual que en la home se hicieron creaciones de sombras y customizaciones en ellas, se realizó  también  una animación en la vista de la parte inferior de la pantalla la cual se muestra dinámicamente de abajo hacia arriba con un botton para aplicar a la oferta y el tipo de trabajo de la oferta, se hizo uso de un efecto de vista difuminado sobre la imagen de fondo de la cabecera y se le colocó dinamismo a el tamaño de las celdas de manera que estas se ajustan automáticamente a la información que viene de la API.

<div align='center'> 
  <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/Detail.gif?" align="center" height="700" width="350"></a>
 
 <div align='center'>
  Vista del detalle
</div>
 
 
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/blanco.drawio.png" align="center" height="80"></a>

<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/DetailClassDiagram.drawio.png" align="rigth"></a>
<div align='center'>
  Diagrama de comunicaion entre clases
</div>
 
 <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/blanco.drawio.png" align="center" height="80"></a>

 <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/DetailFlowDiagram.drawio.png" align="rigth"></a>

<div align='center'>
 Diagrama de flujo
</div>
