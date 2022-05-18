#  Description 
<div align='left'>
 Esta en una aplicación que busca hacer semejanza de una aplicación que conecta a los empleadores con los posibles aspirantes mediante vacantes de trabajo en distintas áreas laborales de distintas empresas. Enfocándome en la parte de diseño mayormente y tratando de hacer una aplicación funcional y de fácil manejo para todos

Herramientas:
 
- Consumo de API REST
- Inicio de sesión con Google
- AutoLayout (UIKit)
- Animación de vistas
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
- Firebase Authentication: Authenticacion de GoogleSession

Arquitectura:
 
- MVC (Modelo - Vista - Controllador) Use este modelo que me permite conectar el proyecto de manera sencilla donde el controlador es el intermediario entre el modelo y la vista d
 
   <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/MVC.drawio.png" align="center" height="200" width="500"></a>

 
</div>

# 📲 Login Module


En esta pantalla hice una customizacion del backgroundColor de la pantalla agregando un color grandiente con dos colores.
Mediante una verificacion de usuario de google en el SceneDelegate se asigna el rootController de la aplicacion, de esta forma si ya hay un usuario registado el rootController va a ser el Home, si no vaa abrir la pantalla de Sign In. En las imagenes esta adujnto el diagrama de comunicacion entre clases y/o estructuras y tambien esta el flujo de la vista 💁

<div align='center'>
  <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/login.gif" align="center" height="700" width="350"></a>


---
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/LoginClassdiagram.drawio.png" align="center" height="400" width="500"></a>  

---
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/loginFlowDiagram.drawio.png" align="center" height="500" width="400"></a>


</div>


 # 🏠 Home Module

<div align='center'>
  <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/Home.gif" align="center" height="700" width="350"></a>

 
---
   <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/HomeClassDiagram.drawio.png" align="center" height="400" width="500"></a>



---
   <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/HomeFlowDiagram.drawio.png" align="center" height="500" width="400"></a>


</div>

##### Decripcion del modulo

En este modulo la vista esta co


 # 🧐 Job Detail

<div align='center'> 
  <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/Detail.gif?" align="center" height="700" width="350" ></a>
</div>

---
   <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/DetailClassDiagram.drawio.png" align="center" height="900" width="800"></a>



---
   <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/DetailFlowDiagram.drawio.png" align="center" height="900" width="500"></a>

