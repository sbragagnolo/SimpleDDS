as yet unclassified
initialize
	super initialize.
	self when: DDSParameterHasBeenSetted send: #noteParameterSetted: to: self.
	self when: DDSParameterHasBeenDeleted send: #noteParameterDeleted: to: self.
	self when: DDSParameterHasChanged  send: #noteParameterChanged: to: self.