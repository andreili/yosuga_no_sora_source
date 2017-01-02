Include "cotopha.ch"

Constant		InitFields := true

DeclareType Flag
DeclareType	LogManager
DeclareType CgInfo
DeclareType ZoomParam
DeclareType ScenarioObject
DeclareType ConfigDataBase
DeclareType Bookmark
DeclareType SystemObject
DeclareType MessageFrame
DeclareType MessageInfo
DeclareType BustupManager
DeclareType MoveParam
DeclareType TransitionInfo
DeclareType AdvScreen
DeclareType LoadSaveWindow
DeclareType ConfigWindow
DeclareType AppreciationView
DeclareType HistoryWindow
DeclareType DrawTextParam

ExternDef  		nRandomSeed			; 0
ExternDef  		hitretResult		; 1
ExternDef     	ScreenSize			; 2
ExternDef  		BookmarkIndex		; 3
ExternDef   	scObj				; 4
ExternDef   	cnfObj				; 5
ExternDef   	sysObj				; 6
ExternDef  		inputFilterType		; 7
ExternDef  		flgRecollectMode	; 8
ExternDef   	BUSTUP_XPOS			; 9
ExternDef       adv					; 10
ExternDef   	kinsoku				; 11
ExternDef  		bgmIndex			; 12
ExternDef 		bgm					; 13
ExternDef 	    envSe				; 14	type!
ExternDef       se					; 15
ExternDef       sysSe				; 16
ExternDef       voice				; 17
ExternDef  		playVoiceTime		; 18
ExternDef   	sprLoadEffectBase	; 19
ExternDef   	sprLoadEffect		; 20
ExternDef       resLoadEffectAlpha	; 20
ExternDef  		fConfirm			; 21
ExternDef  		fEyeCatchEnter		; 22
ExternDef  		eyeCatchType		; 23
ExternDef  		sprEyeCatch			; 24	type!

ExternDef 		debugSkin			; 26
ExternDef   	debugFrame			; 27
ExternDef   	debugBase			; 28
ExternDef   	sprVoicePlayingBar	; 29
ExternDef   	sprVoicePlayingTrim	; 30
ExternDef   	debugMes			; 31
ExternDef       debugLog			; 32
ExternDef  		DEBUG_VOICECHECK_X	; 33
ExternDef  		DEBUG_VOICECHECK_Y	; 34
ExternDef 		isCreateDebugWindow	; 35
ExternDef 		DebugJumpScenario	; 36
ExternDef 		DebugJumpEnter		; 37
ExternDef 		fDebugSearch		; 38
ExternDef 		rDebugSearch		; 39

Constant		IsDebug := false
Constant		IsUNK1	:= false

DeclareDef  	input
DeclareDef  	inputE
DeclareDef  	screen
DeclareDef  	frameSkin
