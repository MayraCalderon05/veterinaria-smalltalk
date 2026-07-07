Class {
	#name : 'TurnoConsulta',
	#superclass : 'Turno',
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
TurnoConsulta class >> crearTurnoConsultaConFecha: unaFechaTurno hora: unaHoraTurno motivo: unMotivo cliente: unCliente mascota: unaMascota veterinario: unMedico [

	| tc |
	tc := self new.
	tc
		inicializarTurnoConFecha: unaFechaTurno
		hora: unaHoraTurno
		motivo: unMotivo
		cliente: unCliente
		mascota: unaMascota
		veterinario: unMedico.
	^ tc
]
