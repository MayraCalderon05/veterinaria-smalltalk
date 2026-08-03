Class {
	#name : 'MenuAccionesDiagnostico',
	#superclass : 'BorderedMorph',
	#instVars : [
		'veterinaria',
		'diagnostico',
		'accionAceptar',
		'labelTitulo',
		'botonTratamientoQuirurgico',
		'botonTratamientoFarmacologico',
		'botonFacturar',
		'botonCancelar'
	],
	#category : 'tpo-interfaz',
	#package : 'tpo-interfaz'
}

{ #category : 'propios del tipo' }
MenuAccionesDiagnostico >> acceso: unaVeterinaria paraDiagnostico: unDiagnostico [
	veterinaria := unaVeterinaria.
	diagnostico := unDiagnostico.
	self openInWorld
]

{ #category : 'inicializadores' }
MenuAccionesDiagnostico >> initialize [

	| origen |
	super initialize.
	self color: (Color fromHexString: 'DCE8B4').
	self position: 45 @ 45.
	self bounds: (self position extent: 400 @ 300).
	origen := self innerBounds origin.

	labelTitulo := TextMorph new.
	labelTitulo contents: '¿Qué desea hacer con este diagnóstico?'.
	labelTitulo color: Color black.
	labelTitulo position: origen + (25 @ 25).

	botonTratamientoQuirurgico := BotonAccion new.
	botonTratamientoQuirurgico label: 'Registrar tratamiento quirúrgico'.
	botonTratamientoQuirurgico extent: self width - 50 @ 40.
	botonTratamientoQuirurgico position: labelTitulo position + (0 @ 40).

	botonTratamientoFarmacologico := BotonAccion new.
	botonTratamientoFarmacologico label:
		'Registrar tratamiento farmacológico'.
	botonTratamientoFarmacologico extent: self width - 50 @ 40.
	botonTratamientoFarmacologico position:
		botonTratamientoQuirurgico position + (0 @ 50).

	botonFacturar := BotonAccion new.
	botonFacturar label: 'Facturar'.
	botonFacturar extent: self width - 50 @ 40.
	botonFacturar position:
		botonTratamientoFarmacologico position + (0 @ 50).

	botonCancelar := BotonAccion new.
	botonCancelar label: 'Cancelar'.
	botonCancelar color: (Color fromHexString: 'B08968').
	botonCancelar extent: self width - 50 @ 40.
	botonCancelar position: botonFacturar position + (0 @ 50).

	botonTratamientoQuirurgico mouseAction: [
		| form |
		form := FormTratamientoQuirurgico new.
		form accionAceptar: [ :unTratamiento |
			| exito |
			exito := veterinaria
				         asignarTratamiento: unTratamiento
				         aDiagnostico: diagnostico.
			exito
				ifTrue: [
					(CuadroConMensaje conMensaje:
						 'Tratamiento quirúrgico asignado correctamente') openInWorld ]
				ifFalse: [
					(CuadroConMensaje conMensaje: 'No se pudo asignar el tratamiento')
						openInWorld ] ].
		form openInWorld.
		self delete ].

	botonTratamientoFarmacologico mouseAction: [
		| form |
		form := FormTratamientoFarmacologico new.
		form accionAceptar: [ :unTratamiento |
			| exito |
			exito := veterinaria
				         asignarTratamiento: unTratamiento
				         aDiagnostico: diagnostico.
			exito
				ifTrue: [
					(CuadroConMensaje conMensaje:
						 'Tratamiento farmacológico asignado correctamente') openInWorld ]
				ifFalse: [
					(CuadroConMensaje conMensaje:
						 'No se pudo asignar el tratamiento (revise el stock disponible)')
						openInWorld ] ].
		form acceso: veterinaria.
		self delete ].

	botonFacturar mouseAction: [
	| exito |
	exito := veterinaria realizarFacturacion: diagnostico.
	exito
		ifTrue: [ (CuadroConMensaje conMensaje: 'Diagnóstico facturado correctamente') openInWorld ]
		ifFalse: [ (CuadroConMensaje conMensaje: 'No se pudo facturar el diagnóstico') openInWorld ].
	self delete ].

	botonCancelar mouseAction: [ self delete ].

	self addMorph: labelTitulo.
	self addMorph: botonTratamientoQuirurgico.
	self addMorph: botonTratamientoFarmacologico.
	self addMorph: botonFacturar.
	self addMorph: botonCancelar
]
