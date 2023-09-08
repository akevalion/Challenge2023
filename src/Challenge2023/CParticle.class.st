Class {
	#name : #CParticle,
	#superclass : #Object,
	#instVars : [
		'position',
		'shape'
	],
	#category : #Challenge2023
}

{ #category : #accessing }
CParticle >> position [
	^ position
]

{ #category : #accessing }
CParticle >> position: aPoint [
	position := aPoint
]

{ #category : #accessing }
CParticle >> renderIn: aCanvas [
	shape ifNil: [
		shape := RSEllipse new size: 1.
		aCanvas addShape: shape.
	].
	shape color: ((Color h: position angle radiansToDegrees s: 0.7 v: 0.8) alpha: 0.2).
	shape position: position
]

{ #category : #updating }
CParticle >> update: itf with: force [
	| dist p1 p2 dir |
	p1 := position.
	p2 := itf position.
	dist := p1 distanceTo: p2.
	dir := itf mode = #attract
		ifTrue: [ p1 - p2 ]
		ifFalse: [ p2 - p1 ].
	dir := dir normalized * force / dist.
	position := position + dir
]
