connection
connect: anUrl to: aSubscriber for: aParticipantMirror in: aDomain
	| proxy |
	proxy := DDSParticipantProxy on: anUrl.
	[ | protocol petition connection |
	petition := proxy possibleConnectionsFor: aSubscriber for: aParticipantMirror in: aDomain.
	protocol := aDomain protocols
		detect: [ :prtcl | petition itIsSupportedBy: prtcl ]
		ifNone: [ DDSError
				signal:
					(''
						join:
							{'There is no support for '.
							petition protocolName}) ].
	connection := protocol connect: petition.
	connection urlrpc: anUrl.
	connection marshaller: aSubscriber topic type marshaller.
	(aSubscriber subscriptionFor: aParticipantMirror participant) registerConnection: connection ]
		on: ConnectionTimedOut
		do: [ :e | self logCr: e messageText.
			self increaseBlacklistCounterFor: anUrl ]