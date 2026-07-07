Class {
	#name : 'StockMedicamento',
	#superclass : 'Object',
	#instVars : [
		'cantidad',
		'medicamento'
	],
	#category : 'tpo',
	#package : 'tpo'
}

{ #category : 'constructores' }
StockMedicamento class >> crearStockMedicamentoConCantidad: unaCantidad medicamento: unMedicamento [
|sm|
sm := self new.
sm 
inicializarStockMedicamentoConCantidad: unaCantidad 
medicamento: unMedicamento.
^sm
]

{ #category : 'visualizadores' }
StockMedicamento >> cantidad [
^cantidad 
]

{ #category : 'modificadores' }
StockMedicamento >> cantidad: unaCantidad [
cantidad := unaCantidad 
]

{ #category : 'inicializadores' }
StockMedicamento >> inicializarStockMedicamentoConCantidad: unaCantidad medicamento: unMedicamento [
cantidad := unaCantidad.
medicamento := unMedicamento.
]

{ #category : 'visualizadores' }
StockMedicamento >> medicamento [

	^ medicamento 
]
