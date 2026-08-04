Class {
	#name : 'VeterinariaVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'mensaje',
		'listaClientes',
		'colClientes',
		'cantidadMascotas',
		'botonRegistrarCli',
		'botonRegistrarMascota',
		'botonRegistrarDiagnostico',
		'botonBuscarDiagnostico',
		'botonConsultaHistorialClinico',
		'botonConsultaTratamientosDeVet',
		'botonFacturasPendientesDeCliente',
		'botonConsultaTurnosDeFecha',
		'botonCerrar',
		'mascotaEncontrada'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'propios del tipo' }
VeterinariaVisual class >> ingresarVet: unaVet [
| ventana |
ventana := self new.
ventana veterinaria: unaVet .
unaVet addDependent: ventana .
ventana openInWorld .
^ventana 
]

{ #category : 'acciones' }
VeterinariaVisual >> actualizarListaClientes [

	| texto totalMascotas fuente|
	fuente := LogicalFont familyName: 'Source Code Pro' pointSize: 10.
	colClientes := veterinaria clientes.
	texto := WriteStream on: String new.
	texto
		nextPutAll: 'CLIENTES:';
		cr.

	colClientes do: [ :cadaCliente |
		texto
			nextPutAll: cadaCliente nombre;
			nextPutAll: ' dni: ';
			nextPutAll: cadaCliente dni;
			nextPutAll: ' - ';
			nextPutAll: cadaCliente mascotas size printString;
			nextPutAll: ' mascota(s)';
			cr ].
	listaClientes contents: (texto contents asText addAttribute: (TextFontReference toFont: fuente)).

	cantidadMascotas position:
		listaClientes position + (0 @ (listaClientes height + 10)).

	totalMascotas := veterinaria clientes
		                 inject: 0
		                 into: [ :acc :c | acc + c mascotas size ].
	cantidadMascotas contents:
		(('Mascotas atendidas: ' , totalMascotas printString) asText addAttribute: (TextFontReference toFont: fuente)).
]

{ #category : 'acciones' }
VeterinariaVisual >> ejecutarBuscarCliente [

	| buscador |
	buscador := BuscadorCliente new.
	buscador acceso: veterinaria .
	buscador openInWorld
]

{ #category : 'acciones' }
VeterinariaVisual >> ejecutarBuscarDiagnostico [

	| buscador |
	buscador := BuscadorDiagnostico new.
	buscador accionAceptar: [ :unDiagnostico |
		MenuAccionesDiagnostico new
			acceso: veterinaria
			paraDiagnostico: unDiagnostico ].
	buscador acceso: veterinaria
]

{ #category : 'acciones' }
VeterinariaVisual >> ejecutarConsultarFacturasPendientes [

	| buscador |
	buscador := BuscadorFactura new.
	buscador acceso: veterinaria.
]

{ #category : 'acciones' }
VeterinariaVisual >> ejecutarConsultarTratamientosVeterinario [
| buscador |
buscador := BuscadorTratPorVeterinario new.
buscador acceso: veterinaria .
buscador openInWorld
]

{ #category : 'acciones' }
VeterinariaVisual >> ejecutarConsultarTurnosDeFecha [

	| buscador |
	buscador := BuscadorTurnosPorFecha new.
	buscador acceso: veterinaria.
	buscador openInWorld.
]

{ #category : 'acciones' }
VeterinariaVisual >> ejecutarRegistrarCliente [

	| form registrado |
	form := FormRegistrarCliente new.
	form openInWorld.
	form accionAceptar: [ :unCliente |
		registrado := veterinaria agregarCliente: unCliente.
		registrado
			ifTrue: [
				unCliente addDependent: self.
				(CuadroConMensaje conMensaje: 'Cliente registrado correctamente')
					openInWorld.
					 ]
			ifFalse: [
				(CuadroConMensaje conMensaje:
					 'Ha ocurrido un error al registrar el cliente') openInWorld ] ].
			
]

{ #category : 'acciones' }
VeterinariaVisual >> ejecutarRegistrarDiagnostico [

	| form |
	"crea una instancia de FormRegistrarDiagnostico"
	form := FormRegistrarDiagnostico new.
	"cuando temga creado el diagnostico lo agrega a la coleccion de diagnosticos"
	form accionAceptar: [ :unDiagnostico |
		veterinaria agregarDiagnostico: unDiagnostico.
		(CuadroConMensaje conMensaje: 'Diagnóstico registrado correctamente')
			openInWorld ].
	"llama a ese metodo que abre el mundo y le manda veterinaria"
	form acceso: veterinaria.
]

{ #category : 'acciones' }
VeterinariaVisual >> ejecutarVerHistorialClinico [

	| buscadorMasc listaHistorial |
	buscadorMasc := BuscadorMascota new.
	buscadorMasc acceso: veterinaria.
	buscadorMasc accionAceptar: [ :unaMascota |
		listaHistorial := ListaHistorialDeMascota new.
		listaHistorial
			deMascota: unaMascota
			conHistorial: (veterinaria historialClinicoDe: unaMascota).
		listaHistorial openInWorld ].
	buscadorMasc openInWorld
]

{ #category : 'inicializadores' }
VeterinariaVisual >> initialize [
	"este método se ejecutará inmediatamente después del new"

	| origen fuente |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 800).
	origen := self innerBounds origin.

	"Se crea el elemento gráfico para mostrar mensajes de resultado"
	mensaje := TextMorph new.
	mensaje color: Color black.
	mensaje backgroundColor: (Color fromHexString: 'DCE8B4').
	mensaje margins: 5 @ 5.
	"Se posicionan, uno debajo del otro"


	listaClientes := TextMorph new.
	listaClientes contents: 'Clientes: (sistema no inicializado)'.
	listaClientes color: Color black.
	listaClientes backgroundColor: (Color fromHexString: 'DCE8B4').
	listaClientes margins: 5 @ 5.

	cantidadMascotas := TextMorph new.
	cantidadMascotas contents: 'Mascotas atendidas: 0'.
	cantidadMascotas color: Color black.
	cantidadMascotas backgroundColor: (Color fromHexString: 'DCE8B4').
	cantidadMascotas margins: 5 @ 5.

	self addMorph: listaClientes.
	self addMorph: cantidadMascotas.

	listaClientes position: origen + (300 @ 120).
	cantidadMascotas position:
		listaClientes position + (0 @ (listaClientes height + 10)).

	"Se crean los botones"

	botonRegistrarCli := BotonAccion new.
	botonRegistrarMascota := BotonAccion new.
	botonRegistrarDiagnostico := BotonAccion new.
	botonBuscarDiagnostico := BotonAccion new.
	botonConsultaHistorialClinico := BotonAccion new.
	botonConsultaTratamientosDeVet := BotonAccion new.
	botonFacturasPendientesDeCliente := BotonAccion new.
	botonConsultaTurnosDeFecha := BotonAccion new.
	botonCerrar := BotonAccion new.



	"Se agregan al contenedor"
	self addMorph: botonRegistrarCli.
	self addMorph: botonRegistrarMascota.
	self addMorph: botonRegistrarDiagnostico.
	self addMorph: botonBuscarDiagnostico.
	self addMorph: botonConsultaHistorialClinico.
	self addMorph: botonConsultaTratamientosDeVet.
	self addMorph: botonFacturasPendientesDeCliente.
	self addMorph: botonConsultaTurnosDeFecha.
	self addMorph: mensaje.
	self addMorph: botonCerrar.

	botonRegistrarCli position: origen + (50 @ 100).
	botonRegistrarMascota position: botonRegistrarCli position + (0 @ 60).
	botonRegistrarDiagnostico position:
		botonRegistrarMascota position + (0 @ 60).
	botonBuscarDiagnostico position:
		botonRegistrarDiagnostico position + (0 @ 60).
	botonConsultaHistorialClinico position:
		botonBuscarDiagnostico position + (0 @ 60).
	botonConsultaTratamientosDeVet position:
		botonConsultaHistorialClinico position + (0 @ 60).
	botonFacturasPendientesDeCliente position:
		botonConsultaTratamientosDeVet position + (0 @ 60).
	botonConsultaTurnosDeFecha position:
		botonFacturasPendientesDeCliente position + (0 @ 60).

	botonCerrar position: botonConsultaTurnosDeFecha position + (0 @ 60).


	"Etiquetas"
	botonRegistrarCli label: 'Registrar Cliente'.
	botonRegistrarCli extent: 200 @ 45.
	
	botonRegistrarMascota label: 'Buscar Cliente'.
	botonRegistrarMascota extent: 200 @ 45.
	
	botonRegistrarDiagnostico label: 'Registrar Diagnóstico'.
	botonRegistrarDiagnostico extent: 200 @ 45.
	
	botonBuscarDiagnostico label: 'Buscar Diagnostico'.
	botonBuscarDiagnostico extent: 200 @ 45.
	
	botonConsultaHistorialClinico label: 'Historial Clínico'.
	botonConsultaHistorialClinico extent: 200 @ 45.
	
	botonConsultaTratamientosDeVet label: 'Tratamientos por Veterinario'.
	botonConsultaTratamientosDeVet extent: 200 @ 45.
	
	botonFacturasPendientesDeCliente label: 'Facturas Pendientes'.
	botonFacturasPendientesDeCliente extent: 200 @ 45.
	
	botonConsultaTurnosDeFecha label: 'Consultar Turnos de Fecha'.
	botonConsultaTurnosDeFecha extent: 200 @ 45.
	
	botonCerrar label: 'Minimizar'.
	botonCerrar extent: 200 @ 45.

	"color distinto del boton cerrar"
	botonCerrar color: (Color fromHexString: 'B08968').
	
	
	"Acciones de cada botón"
	botonRegistrarCli mouseAction: [ self ejecutarRegistrarCliente ].

	botonRegistrarMascota mouseAction: [ self ejecutarBuscarCliente ].
	botonRegistrarDiagnostico mouseAction: [
		self ejecutarRegistrarDiagnostico ].
	botonBuscarDiagnostico mouseAction: [ self ejecutarBuscarDiagnostico ].
	botonConsultaHistorialClinico mouseAction: [
		self ejecutarVerHistorialClinico ].

	botonConsultaTratamientosDeVet mouseAction: [
		self ejecutarConsultarTratamientosVeterinario ].

	botonFacturasPendientesDeCliente mouseAction: [
		self ejecutarConsultarFacturasPendientes ].

	botonConsultaTurnosDeFecha mouseAction: [
		self ejecutarConsultarTurnosDeFecha ].


	botonCerrar mouseAction: [ self collapse ].

	veterinaria := Veterinaria crearVeterinariaConDatosDePrueba.
	veterinaria addDependent: self.
	veterinaria clientes do: [ :c | c addDependent: self ].
	fuente := LogicalFont familyName: 'Source Code Pro' pointSize: 20.
	mensaje contents: (veterinaria nombre asText addAttribute: (TextFontReference toFont: fuente)) .
	mensaje extent: 300 @ 60.
	mensaje position: 
    ((self innerBounds center x) - (mensaje width // 2)) 
    @ (origen y + 25).
	self actualizarListaClientes
]

{ #category : 'acciones' }
VeterinariaVisual >> update: unObjeto [

	unObjeto = #clientes
		ifTrue: [
			self actualizarListaClientes ]

]
