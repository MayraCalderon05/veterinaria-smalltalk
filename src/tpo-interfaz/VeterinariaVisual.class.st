Class {
	#name : 'VeterinariaVisual',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'botonIniciarSistema',
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

{ #category : 'inicializadores' }
VeterinariaVisual >> initialize [
	"este método se ejecutará inmediatamente después del new"

	| origen |
	super initialize.
	self color: Color lightGreen.
	self position: 45 @ 45.
	self bounds: (self position extent: 600 @ 800).
	origen := self innerBounds origin.
	
	"Se crean los botones"
	botonIniciarSistema := BotonAccion new.
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
	
	"Se crea el elemento gráfico para mostrar mensajes de resultado
	mensaje := TextMorph new.
	mensaje contents: 'Sistema no inicializado'.
	mensaje color: Color black.
	mensaje backgroundColor: Color white.
	mensaje margins: 5@5."
	
	"Se agregan al contenedor"
	self addMorph: botonIniciarSistema.
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
	"self addMorph: mensaje."
	
	"Se posicionan, uno debajo del otro"
	botonIniciarSistema position: origen + (25@25).
	botonRegistrarCli position: botonIniciarSistema position + (0@30).
	botonRegistrarMascota position: botonRegistrarCli position + (0@30).
	botonRegistrarDiagnostico position: botonRegistrarMascota position + (0@30).
	botonAsignarTratamiento position: botonRegistrarDiagnostico position + (0@30).
	botonFacturarDiagnostico position: botonAsignarTratamiento position + (0@30).
	botonRegistrarPago position: botonFacturarDiagnostico position + (0@30).
	botonConsultaHistorialClinico position: botonRegistrarPago position + (0@30).
	botonConsultaTratamientosDeVet position: botonConsultaHistorialClinico position + (0@30).
	botonFacturasPendientesDeCliente position: botonConsultaTratamientosDeVet position + (0@30).
	botonAtenderSolicitudDeTurnoDeCliente position: botonFacturasPendientesDeCliente position + (0@30).
	botonCancelarTurnoPendiente position: botonAtenderSolicitudDeTurnoDeCliente position + (0@30).
	botonConsultaTurnosDeFecha position: botonCancelarTurnoPendiente position + (0@30).
	botonRegistrarAtencionCliente position: botonConsultaTurnosDeFecha position + (0@30).
	botonVerHistorialDeTurnosDeCliente position: botonRegistrarAtencionCliente position + (0@30).
	"mensaje position: botonVerHistorialDeTurnosDeCliente position + (0@35)."
	
	"Etiquetas"
	botonIniciarSistema label: 'Inicializar Sistema'.
	botonRegistrarCli label: 'Registrar Cliente'.
	botonRegistrarMascota label: 'Registrar Mascota'.
	botonRegistrarDiagnostico label: 'Registrar Diagnóstico'.
	botonAsignarTratamiento label: 'Asignar Tratamiento'.
	botonFacturarDiagnostico label: 'Facturar Diagnóstico'.
	botonRegistrarPago label: 'Registrar Pago'.
	botonConsultaHistorialClinico label: 'Historial Clínico'.
	botonConsultaTratamientosDeVet label: 'Tratamientos por Veterinario'.
	botonFacturasPendientesDeCliente label: 'Facturas Pendientes'.
	botonAtenderSolicitudDeTurnoDeCliente label: 'Atender Solicitud de Turno'.
	botonCancelarTurnoPendiente label: 'Cancelar Turno Pendiente'.
	botonConsultaTurnosDeFecha label: 'Consultar Turnos de Fecha'.
	botonRegistrarAtencionCliente label: 'Registrar Atención de Cliente'.
	botonVerHistorialDeTurnosDeCliente label: 'Historial de Turnos de Cliente'.
	
	"Acciones de cada botón
	botonIniciarSistema mouseAction: [self ejecutarInicializar].
	botonRegistrarCli mouseAction: [self ejecutarRegistrarCliente].
	botonRegistrarMascota mouseAction: [self ejecutarRegistrarMascota].
	botonRegistrarDiagnostico mouseAction: [self ejecutarRegistrarDiagnostico].
	botonAsignarTratamiento mouseAction: [self ejecutarAsignarTratamiento].
	botonFacturarDiagnostico mouseAction: [self ejecutarFacturarDiagnostico].
	botonRegistrarPago mouseAction: [self ejecutarRegistrarPago].
	botonConsultaHistorialClinico mouseAction: [self ejecutarConsultarHistorial].
	botonConsultaTratamientosDeVet mouseAction: [self ejecutarConsultarTratamientosVeterinario].
	botonFacturasPendientesDeCliente mouseAction: [self ejecutarConsultarFacturasPendientes].
	botonAtenderSolicitudDeTurnoDeCliente mouseAction: [self ejecutarAtenderSolicitudTurno].
	botonCancelarTurnoPendiente mouseAction: [self ejecutarCancelarTurnoPendiente].
	botonConsultaTurnosDeFecha mouseAction: [self ejecutarConsultarTurnosDeFecha].
	botonRegistrarAtencionCliente mouseAction: [self ejecutarRegistrarAtencionCliente].
	botonVerHistorialDeTurnosDeCliente mouseAction: [self ejecutarVerHistorialTurnosCliente] "
]
