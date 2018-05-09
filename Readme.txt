Proyecto iOS compatible con iOS 10 y superior

Patron de diseno utilizado: Default Apple MVC (Apple MVC porque el modelo MVC de apple no cumple al 100% con la separacion de responsabilidades)

Projecto orientado a protocolos como lo impulsa apple con swift

Se aplica programacion funcional

Se usan librerias para Networking y mapeo de respuestas para agilizar el desarrollo y tener una estructura mas limpia y eficiente en menos tiempo. 

Se usa Cocoapods como manejador de dependencias (pods no incluidos en el repositorio)



El struc Updater se encarga de la capa de red, usa AlamoFire + ObjectMapperpara comunicarse con el API y deserializar y mappear la respuesta a objetos que el negocio entiende.
El struc ApiKeys contiene los keys de las respuestas del api
Los extensions en la carpeta Extensions extienden funcionalidades de los view controllers para mostrar mensajes al usaurio y del objeto Route para obtener una version que MapKit entiende
Los modelos estan en la carpeta Models, implementan el protocol Mappeable requerido por ObjectMapper
La carpeta VisualComponents contiene componentes visuales menores y reutilizables como lo es el SchoolBusTableViewCell
La carpeta ViewControllers contiene los View Controllers dle listado y el detalle de las rutas, en ellos reposa la capa de negocio y la de presentacion un poco mezcladas (por el uso de MVC impulsado por apple)

