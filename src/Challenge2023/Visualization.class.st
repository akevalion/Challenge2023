"
This class contains the code to generate the image based on random numbers
"
Class {
	#name : #Visualization,
	#superclass : #RSBuilder,
	#instVars : [
		'interferences',
		'particles',
		'random',
		'force',
		'interferencesRadius',
		'interferencesSize',
		'particlesRadius',
		'particlesSize'
	],
	#category : #Challenge2023
}

{ #category : #private }
Visualization >> createObjects: amt radius: radius class: cls [
	^ (1 to: amt) collect: [ :i | | r |
		r := random next * 360.
		r := r radiansToDegrees.
		cls new
			position: r cos @ r sin * radius;
			yourself ]
]

{ #category : #accessing }
Visualization >> force [
	^ force
]

{ #category : #accessing }
Visualization >> force: aNumber [
	force := aNumber
]

{ #category : #initialization }
Visualization >> initialize [
	super initialize.
	interferences := particles := #().
	random := Random new.
	self
		force: 10;
		particlesSize: 1000;
		particlesRadius: 100;
		interferencesSize: 100;
		interferencesRadius: 100
]

{ #category : #accessing }
Visualization >> interferences [
	^ interferences
]

{ #category : #accessing }
Visualization >> interferencesRadius [
	^ interferencesRadius
]

{ #category : #accessing }
Visualization >> interferencesRadius: anInteger [
	interferencesRadius := anInteger
]

{ #category : #accessing }
Visualization >> interferencesSize [
	^ interferencesSize
]

{ #category : #accessing }
Visualization >> interferencesSize: anInteger [
	interferencesSize := anInteger
]

{ #category : #accessing }
Visualization >> particles [
	^ particles
]

{ #category : #accessing }
Visualization >> particlesRadius [
	^ particlesRadius
]

{ #category : #accessing }
Visualization >> particlesRadius: anInteger [
	particlesRadius := anInteger
]

{ #category : #accessing }
Visualization >> particlesSize [
	^ particlesSize
]

{ #category : #accessing }
Visualization >> particlesSize: anInteger [
	particlesSize := anInteger
]

{ #category : #rendering }
Visualization >> renderIn: aCanvas [
	aCanvas color: Color white.
	self reset.
	aCanvas when: RSMouseClick send: #reset to: self.
	aCanvas newAnimation repeat; onStepDo: [ self update: self force ]
]

{ #category : #initialization }
Visualization >> reset [

	| c |
	c := self canvas.
	c clear.
	c shouldClearBackground: true.
	c newAnimation
		duration: 500 milliSeconds;
		when: RSAnimationEndEvent do: [
			self setParticles.
			self setInterferences.
			c shouldClearBackground: false ]
		for: self
]

{ #category : #running }
Visualization >> run [
	<script: 'self new run'>
	| form |
	self build.
	self canvas open
	"form := self drawOnForm.
	form saveAsPPMFile.
	"
]

{ #category : #hooks }
Visualization >> setInterferences [
	interferences := self
		createObjects: self interferencesSize
		radius: self interferencesRadius
		class: CInterference
]

{ #category : #hooks }
Visualization >> setParticles [
	particles := self
		createObjects: self particlesSize
		radius: self particlesRadius
		class: CParticle
]

{ #category : #updating }
Visualization >> update: aFloat [
	| c |
	c := self canvas.
	interferences do: [ :i |
		particles do: [ :p | p update: i with: aFloat ] ].
	particles do: [ :p | p renderIn: c ]
]
