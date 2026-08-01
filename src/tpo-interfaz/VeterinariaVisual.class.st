Class {
	#name : 'VeterinariaVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'mensaje',
		'listaClientes',
		'cantidadMascotas',
		'botonRegistrarCli',
		'botonRegistrarMascota',
		'botonRegistrarDiagnostico',
		'botonAsignarTratamiento',
		'botonFacturarDiagnostico',
		'botonRegistrarPago',
		'botonConsultaHistorialClinico',
		'botonConsultaTratamientosDeVet',
		'botonFacturasPendientesDeCliente',
		'botonAtenderSolicitudDeTurnoDeCliente',
		'botonCancelarTurnoPendiente',
		'botonConsultaTurnosDeFecha',
		'botonRegistrarAtencionCliente',
		'botonVerHistorialDeTurnosDeCliente'
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

	| texto totalMascotas |
	texto := WriteStream on: String new.
	texto
		nextPutAll: 'CLIENTES:';
		cr.

	veterinaria clientes do: [ :cadaCliente |
		texto
			nextPutAll: cadaCliente nombre;
			nextPutAll: ' ';
			nextPutAll: cadaCliente mascotas size printString;
			nextPutAll: ' mascota(s)';
			cr ].
	listaClientes contents: texto contents.
	
	cantidadMascotas position: listaClientes position + (0 @ (listaClientes height + 10)).

	totalMascotas := veterinaria clientes
		                 inject: 0
		                 into: [ :acc :c | acc + c mascotas size ].
	cantidadMascotas contents:
		'Mascotas atendidas: ' , totalMascotas printString
]

{ #category : 'acciones' }
VeterinariaVisual >> ejecutarBuscarCliente [

	| buscador |
	buscador := BuscadorCliente new.
	buscador acceso: veterinaria .
	buscador openInWorld
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
				(CuadroConMensaje conMensaje: 'Cliente registrado correctamente')
					openInWorld ]
			ifFalse: [
				(CuadroConMensaje conMensaje:
					 'Ha ocurrido un error al registrar el cliente') openInWorld ] ].
]

{ #category : 'inicializadores' }
VeterinariaVisual >> initialize [
	"este método se ejecutará inmediatamente después del new"

	| origen |
	super initialize.
	self color: Color lightGreen.
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 800).
	origen := self innerBounds origin.

	"Se crea el elemento gráfico para mostrar mensajes de resultado"
	mensaje := TextMorph new.
	mensaje color: Color black.
	mensaje backgroundColor: Color lightGreen.
	mensaje margins: 5 @ 5.
	"Se posicionan, uno debajo del otro"
	mensaje position: origen + (25 @ 25).


	listaClientes := TextMorph new.
	listaClientes contents: 'Clientes: (sistema no inicializado)'.
	listaClientes color: Color black.
	listaClientes backgroundColor: Color lightGreen.
	listaClientes margins: 5 @ 5.

	cantidadMascotas := TextMorph new.
	cantidadMascotas contents: 'Mascotas atendidas: 0'.
	cantidadMascotas color: Color black.
	cantidadMascotas backgroundColor: Color lightGreen.
	cantidadMascotas margins: 5 @ 5.

	self addMorph: listaClientes.
	self addMorph: cantidadMascotas.

	listaClientes position: mensaje position + (300 @ 0).
	cantidadMascotas position:
		listaClientes position + (0 @ (listaClientes height + 10)).

	"Se crean los botones"

	botonRegistrarCli := BotonAccion new.
	botonRegistrarMascota := BotonAccion new.
	botonRegistrarDiagnostico := BotonAccion new.
	botonAsignarTratamiento := BotonAccion new.
	botonFacturarDiagnostico := BotonAccion new.
	botonRegistrarPago := BotonAccion new.
	botonConsultaHistorialClinico := BotonAccion new.
	botonConsultaTratamientosDeVet := BotonAccion new.
	botonFacturasPendientesDeCliente := BotonAccion new.
	botonAtenderSolicitudDeTurnoDeCliente := BotonAccion new.
	botonCancelarTurnoPendiente := BotonAccion new.
	botonConsultaTurnosDeFecha := BotonAccion new.
	botonRegistrarAtencionCliente := BotonAccion new.
	botonVerHistorialDeTurnosDeCliente := BotonAccion new.



	"Se agregan al contenedor"
	self addMorph: botonRegistrarCli.
	self addMorph: botonRegistrarMascota.
	self addMorph: botonRegistrarDiagnostico.
	self addMorph: botonAsignarTratamiento.
	self addMorph: botonFacturarDiagnostico.
	self addMorph: botonRegistrarPago.
	self addMorph: botonConsultaHistorialClinico.
	self addMorph: botonConsultaTratamientosDeVet.
	self addMorph: botonFacturasPendientesDeCliente.
	self addMorph: botonAtenderSolicitudDeTurnoDeCliente.
	self addMorph: botonCancelarTurnoPendiente.
	self addMorph: botonConsultaTurnosDeFecha.
	self addMorph: botonRegistrarAtencionCliente.
	self addMorph: botonVerHistorialDeTurnosDeCliente.
	self addMorph: mensaje.

	botonRegistrarCli position: mensaje position + (0 @ 30).
	botonRegistrarMascota position: botonRegistrarCli position + (0 @ 30).
	botonRegistrarDiagnostico position:
		botonRegistrarMascota position + (0 @ 30).
	botonAsignarTratamiento position:
		botonRegistrarDiagnostico position + (0 @ 30).
	botonFacturarDiagnostico position:
		botonAsignarTratamiento position + (0 @ 30).
	botonRegistrarPago position:
		botonFacturarDiagnostico position + (0 @ 30).
	botonConsultaHistorialClinico position:
		botonRegistrarPago position + (0 @ 30).
	botonConsultaTratamientosDeVet position:
		botonConsultaHistorialClinico position + (0 @ 30).
	botonFacturasPendientesDeCliente position:
		botonConsultaTratamientosDeVet position + (0 @ 30).
	botonAtenderSolicitudDeTurnoDeCliente position:
		botonFacturasPendientesDeCliente position + (0 @ 30).
	botonCancelarTurnoPendiente position:
		botonAtenderSolicitudDeTurnoDeCliente position + (0 @ 30).
	botonConsultaTurnosDeFecha position:
		botonCancelarTurnoPendiente position + (0 @ 30).
	botonRegistrarAtencionCliente position:
		botonConsultaTurnosDeFecha position + (0 @ 30).
	botonVerHistorialDeTurnosDeCliente position:
		botonRegistrarAtencionCliente position + (0 @ 30).

	"Etiquetas"
	botonRegistrarCli label: 'Registrar Cliente'.
	botonRegistrarMascota label: 'Buscar Cliente'.
	botonRegistrarDiagnostico label: 'Registrar Diagnóstico'.
	botonAsignarTratamiento label: 'Asignar Tratamiento'.
	botonFacturarDiagnostico label: 'Facturar Diagnóstico'.
	botonRegistrarPago label: 'Registrar Pago'.
	botonConsultaHistorialClinico label: 'Historial Clínico'.
	botonConsultaTratamientosDeVet label: 'Tratamientos por Veterinario'.
	botonFacturasPendientesDeCliente label: 'Facturas Pendientes'.
	botonAtenderSolicitudDeTurnoDeCliente label:
		'Atender Solicitud de Turno'.
	botonCancelarTurnoPendiente label: 'Cancelar Turno Pendiente'.
	botonConsultaTurnosDeFecha label: 'Consultar Turnos de Fecha'.
	botonRegistrarAtencionCliente label: 'Registrar Atención de Cliente'.
	botonVerHistorialDeTurnosDeCliente label:
		'Historial de Turnos de Cliente'.

	"Acciones de cada botón"
	botonRegistrarCli mouseAction: [ self ejecutarRegistrarCliente ].
	
	botonRegistrarMascota mouseAction: [ self ejecutarBuscarCliente ].
	"
	botonRegistrarDiagnostico mouseAction: [
		self ejecutarRegistrarDiagnostico ].
	botonAsignarTratamiento mouseAction: [
		self ejecutarAsignarTratamiento ].
	botonFacturarDiagnostico mouseAction: [
		self ejecutarFacturarDiagnostico ].
	botonRegistrarPago mouseAction: [ self ejecutarRegistrarPago ].
	botonConsultaHistorialClinico mouseAction: [
		self ejecutarConsultarHistorial ].
	botonConsultaTratamientosDeVet mouseAction: [
		self ejecutarConsultarTratamientosVeterinario ].
	botonFacturasPendientesDeCliente mouseAction: [
		self ejecutarConsultarFacturasPendientes ].
	botonAtenderSolicitudDeTurnoDeCliente mouseAction: [
		self ejecutarAtenderSolicitudTurno ].
	botonCancelarTurnoPendiente mouseAction: [
		self ejecutarCancelarTurnoPendiente ].
	botonConsultaTurnosDeFecha mouseAction: [
		self ejecutarConsultarTurnosDeFecha ].
	botonRegistrarAtencionCliente mouseAction: [
		self ejecutarRegistrarAtencionCliente ].
	botonVerHistorialDeTurnosDeCliente mouseAction: [
		self ejecutarVerHistorialTurnosCliente ]"

	veterinaria := Veterinaria crearVeterinariaConDatosDePrueba.
	veterinaria addDependent: self.
	veterinaria clientes do: [ :c | c addDependent: self ].
	mensaje contents: veterinaria nombre.
	self actualizarListaClientes
]

{ #category : 'acciones' }
VeterinariaVisual >> update: unObjeto [
    unObjeto = #clientes
        ifTrue: [ self actualizarListaClientes ]
]
