#  Description 📝
<div align='left'>
 Esta en unas aplicación de prueba que busca hacer semejanza de lo una aplicación que conecta a los empleadores con los posibles aspirantes mediante vacantes de trabajo en distintas Areas laborales de distintas  empresas. Enfocándome en la parte de diseño mayormente y tratando de hacer una aplicación funcional y de fácil manejo para todos

Herramientas:
 
- Consumo de API REST
- Inicio de sesión con Google
- AutoLayout (UIKit)
- Animación de vistas
- Creación de ViewControllers mediante xibs, Sin usar Storyboars
- Customización de UINavigationBar y UINavigationBarButtom
- Uso de UICollectionView, UICollectionViewDelegate, UICollectionViewDatasource, UICollectionViewDelegateFlowLayout
- Creacion y configuracion de sombras
- Navegación ion entre ViewControllers usando UINavigationController
- Creacion de Vistas con gradientes

Dependencias: 
 
- ObjectMapper: Manejo y transformación de informacion de una Data JSON
- Alamofire: Consumo de servicio API REST (En este caso un mock con JSON)
- KingFisher: Descarga de imágenes
- GoogleSignIn: Inicio de sección con Google
- Firebase Authentication: Acceso Sencillo con Google (Próximamente Facebook, Github, Twitter y mas)

Arquitectura:
 
- MVC

 
</div>

# 📲 Login Module
<div align='center'>
  <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/login.gif" align="center" height="700" width="350"></a>


---
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/LoginClassdiagram.drawio.png" align="center" height="700" width="800"></a>  

---
<a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/loginFlowDiagram.drawio.png" align="center" height="700" width="800"></a>


</div>

##### Decripcion del modulo

En esta pantalla hice una customizacion del backgroundColor de la pantalla agregando un color grandiente con dos colores.
Mediante una verificacion de usuario de google en el SceneDelegate se asigna el rootController de la aplicacion, de esta forma si ya hay un usuario registado el rootController va a ser el Home, si no vaa abrir la pantalla de Sign In. En las imagenes esta adujnto el diagrama de comunicacion entre clases y/o estructuras y tambien esta el flujo de la vista 💁


 # 🏠 Home Module

<div align='center'>
  <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/Home.gif" align="center" height="700" width="350"></a>

 
---
   <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/HomeClassDiagram.drawio.png" align="center" height="900" width="800"></a>



---
   <a href="url"><img src="https://github.com/YormanColina/Jobly/blob/main/resources/HomeFlowDiagram.drawio.png" align="center" height="900" width="500"></a>


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

