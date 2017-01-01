
; ----------------------------------------------------------------------------
;	一般的な定数
; ----------------------------------------------------------------------------

;@IF	@IsDefined("__COTOPHA_CH__") == 0

;Constant	__COTOPHA_CH__ := -1

Constant	NULL := 0
Constant	true := -1, false := 0

Constant	eslErrSuccess		:= 0,
			eslErrNotSupported	:= -1,
			eslErrGeneral		:= 1,
			eslErrAbort			:= 2,
			eslErrInvalidParam	:= 3,
			eslErrTimeout		:= 4,
			eslErrPending		:= 5,
			eslErrContinue		:= 6


; ----------------------------------------------------------------------------
;	構造体
; ----------------------------------------------------------------------------

; 座標
DeclareType	Point
;	Integer	x
;	Integer	y

; サイズ
DeclareType	Size
;	Integer	w
;	Integer	h

; 矩形
DeclareType	Rect
;	Integer	left
;	Integer	top
;	Integer	right
;	Integer	bottom

; スプライト情報
DeclareType	SpriteParam
;	Integer		nFlags				; 描画フラグ
;	Point		ptDstPos			; 出力基準座標
;	Point		ptRevCenter			; 回転中心座標
;	Real		rHorzUnit			; ｘ軸拡大率
;	Real		rVertUnit			; ｙ軸拡大率
;	Real		rRevAngle			; 回転角度 [deg]
;	Real		rCrossingAngle		; ｘｙ軸交差角 [deg]
;	Integer		rgbDimColor			; α描画色
;	Integer		rgbLightColor		;
;	Integer		nTransparency		; 透明度
;	Real		rZOrder				; ｚ値
;	Integer		rgbColorParam1		; 色パラメータ

; 描画フラグ
Constant	EGL_DRAW_BLEND_ALPHA	:= 0001H
Constant	EGL_DRAW_GLOW_LIGHT		:= 0002H
Constant	EGL_WITH_Z_ORDER		:= 0004H
Constant	EGL_SMOOTH_STRETCH		:= 0010H
Constant	EGL_UNSMOOTH_STRETCH	:= 0020H
Constant	EGL_FIXED_POSITION		:= 0040H

Constant	EGL_APPLY_C_ADD			:= 00800000H
Constant	EGL_APPLY_C_MUL			:= 00820000H
Constant	EGL_APPLY_A_MUL			:= 00880000H
Constant	EGL_APPLY_C_MASK		:= 00890000H
Constant	EGL_DRAW_F_ADD			:= 80000000H
Constant	EGL_DRAW_F_SUB			:= 81000000H
Constant	EGL_DRAW_F_MUL			:= 82000000H
Constant	EGL_DRAW_F_DIV			:= 83000000H
Constant	EGL_DRAW_F_MAX			:= 84000000H
Constant	EGL_DRAW_F_MIN			:= 85000000H
Constant	EGL_DRAW_A_MOVE			:= 88000000H
Constant	EGL_DRAW_A_MUL			:= 89000000H


; 画像リソース情報
DeclareType	ImageInfo
;	Integer	nFormatType
;	Integer	nImageWidth
;	Integer	nImageHeight
;	Integer	nBitsPerPixel	; 通常 32 固定
;	Integer	nFrameCount		; 静止画の場合 1
;	Integer	xHotSpot
;	Integer	yHotSpot
;	Integer	nResourceBytes


; 音声リソース情報
DeclareType	SoundInfo
;	Integer	nSampleCount
;	Integer	nSamplesPerSec
;	Integer	nChannelCount
;	Integer	nBitsPerSample
;	Integer	nRewoundPosition
;	Integer	nResourceBytes


; 画像フォーマットフラグ
Constant	EIF_RGB_BITMAP		:= 00000001H
Constant	EIF_RGBA_BITMAP		:= 04000001H
Constant	EIF_GRAY_BITMAP		:= 00000002H
Constant	EIF_YUV_BITMAP		:= 00000004H
Constant	EIF_HSB_BITMAP		:= 00000006H
Constant	EIF_Z_BUFFER_R4		:= 00002005H
Constant	EIF_TYPE_MASK		:= 00FFFFFFH
Constant	EIF_WITH_PALETTE	:= 01000000H
Constant	EIF_WITH_CLIPPING	:= 02000000H
Constant	EIF_WITH_ALPHA		:= 04000000H

; エフェクトパラメータ
DeclareType	EffectParam
;	String	strType
;	Integer	nFlags
;	Integer	nInterval, nDegreeStep
;	Integer	nShakingWidth, nMeshSize, nMeshDivision, nFrequency
;	Size	sizeView
;	Point	ptSpeed
;	Integer	nAlphaRange, nMilliSecPerDegree
;	Point	ptSmashPoint
;	Real	rSmashDelay, rSmashPower, rRandomPower, rDeceleration
;	Vector	vVelocity, vGravity, vRevSpeed, vRevRandom

Constant	effTransition := 0001H


; パーティクルパラメータ
DeclareType	ParticleFlick
;	Real	rAmplitude			; 揺らぎ幅 [pixel]
;	Real	rAmplitudeRange		; 揺らぎ幅（乱数） [pixel]
;	Real	rFrequency			; 揺らぎ周期 [ms]
;	Real	rFrequencyRange		; 揺らぎ周期（乱数） [ms]

DeclareType	ParticleParam
;	Integer		nFlags				; フラグ
;	Integer		nDuration			; 寿命 [ms]
;	Integer		nAnimationSpeed		; アニメーション速度比 x100H
;									;（アニメ画像パーティクル用）
;	Integer		nFadein				; フェードイン時間 [ms]
;	Integer		nFadeout			; フェードアウト時間 [ms]
;	Integer		nFadeTransparency	; フェードアウト透明度
;	Real		rFadeZoom			; フェードアウト時の拡大比率
;	Real		rGenWidth			; 発生幅 [pixel]
;	Real		rGenHeigh
;	Real		rGenAngle			; 発生角 [deg]
;	Real		rGenAngleRange		; 発生角の幅（乱数） [deg]
;	Real		rGenVelocity		; （中心から遠ざかる）初速 [pixel/sec]
;	Real		rGenVelocityRange	; 初速の幅（乱数） [pixel/sec]
;	Real		rShrink				; 初速減速率 [/sec]
;	Real		rRevSpeed			; 回転速度 [deg/sec]
;	Real		rRevSpeedRange		; 回転速度の幅（乱数）[deg/sec]
;	Real		rZoom				; 拡大率
;	Real		rZoomRange			; 拡大率の幅（乱数）]
;	Array		pfFlickness			; 揺らぎ
;	Vector2D	vGenSpeed			; 初速ベクトル [pixel/sec]
;	Real		rGenSpeedRange		; 初速の幅（乱数）[pixel/sec]
;	Vector2D	vStream				; 流速 [pixel/sec]
;	Vector2D	vGravity			; 重力加速度 [pixel/sec/sec]

Constant	pfAnimationLoop := 01H


DeclareType	ParticleParam3D
;	Integer		nFlags				; フラグ
;	Integer		nDuration			; 寿命 [ms]
;	Integer		nAnimationSpeed		; アニメーション速度比 x100H
;									;（アニメ画像パーティクル用）
;	Integer		nFadein				; フェードイン時間 [ms]
;	Integer		nFadeout			; フェードアウト時間 [ms]
;	Integer		nFadeTransparency	; フェードアウト透明度
;	Real		rFadeZoom			; フェードアウト時の拡大比率
;	Vector		vGenWidth			; 発生幅
;	Vector		vGenAngle			; 発生角 [deg]
;	Real		rGenAngleRange		; 発生角の幅（乱数） [deg]
;	Real		rGenVelocity		; （中心から遠ざかる）初速 [pixel/sec]
;	Real		rGenVelocityRange	; 初速の幅（乱数） [pixel/sec]
;	Real		rShrink				; 初速減速率 [/sec]
;	Vector		vRevBaseAxis		; 回転軸
;	Real		rRevSpeed			; 回転速度 [deg/sec]
;	Real		rRevSpeedRange		; 回転速度の幅（乱数）[deg/sec]
;	Vector		vRevRevAxis			; 回転軸を回転させる基底（ランダム用）
;	Real		rRevRevRange		; 回転軸の回転幅（乱数）[deg]
;	Real		rZoom				; 拡大率
;	Real		rZoomRange			; 拡大率の幅（乱数）]
;	Array		pfFlickness			; 揺らぎ
;	Vector		vGenSpeed			; 初速ベクトル [pixel/sec]
;	Real		rGenSpeedRange		; 初速の幅（乱数）[pixel/sec]
;	Vector		vStream				; 流速 [pixel/sec]
;	Vector		vGravity			; 重力加速度 [pixel/sec/sec]


; スキンコマンド
DeclareType	WndSpriteCmd
;	String	strID ;			; アイテム識別子
;	Integer	nNotification	; 通知コード
;	Integer	nParameter		; パラメータ


;  2次元ベクトル
DeclareType	Vector2D
;	Real	x
;	Real	y


; 3 次元ベクトル
DeclareType	Vector
;	Real	x
;	Real	y
;	Real	z

; ベジェ曲線
DeclareType	BezierR64
;	Array	cp
;	this.cp[0] := Real
;	this.cp[1] := Real
;	this.cp[2] := Real
;	this.cp[3] := Real

Constant	E3DSAF_NO_SHADING		:= 00000000H,	; シェーディング無し
			E3DSAF_FLAT_SHADE		:= 00000001H,	; フラットシェーディング（未使用）
			E3DSAF_GOURAUD_SHADE	:= 00000002H,	; グーローシェーディング
			E3DSAF_PHONG_SHADE		:= 00000003H,	; フォンシェーディング（未使用）
			E3DSAF_SHADING_MASK		:= 000000FFH,
			E3DSAF_TEXTURE_TILING	:= 00000100H,	; テクスチャをタイリング
			E3DSAF_TEXTURE_TRIM		:= 00000200H,	; トリミングテクスチャ
			E3DSAF_TEXTURE_SMOOTH	:= 00000400H,	; テクスチャ補完拡大
			E3DSAF_TEXTURE_MAPPING	:= 00001000H,	; テクスチャマッピング
			E3DSAF_ENVIRONMENT_MAP	:= 00002000H,	; 環境マッピング
			E3DSAF_GENVIRONMENT_MAP	:= 00004000H,	; グローバル環境マッピング
			E3DSAF_SINGLE_SIDE_PLANE:= 00010000H,	; 片面ポリゴン
			E3DSAF_NO_ZBUFFER		:= 00020000H,	; ｚ比較を行わないで描画
			E3DSAF_ZBUF_ONLY_COMPARE:= 00040000H	; ｚ比較のみ（書き込まない）

Constant	E3D_FOG_LIGHT		:= 00000000H,		; 擬似フォッグ
			E3D_AMBIENT_LIGHT	:= 00000001H,		; 環境光
			E3D_VECTOR_LIGHT	:= 00000002H,		; 無限遠光源
			E3D_POINT_LIGHT		:= 00000004H		; 点光源

; レンダリング機能フラグ
Constant	E3D_FLAG_ANTIALIAS_SIDE_EDGE	:= 0001H,
			E3D_FLAG_TEXTURE_SMOOTHING		:= 0002H

; ソートフラグ
Constant	E3D_SORT_TRANSPARENT	:= 0001H,
			E3D_SORT_OPAQUE			:= 0002H

; 入力イベント
DeclareType	InputEvent
;	Integer	idType		; デバイスタイプ
;	Integer	iDevNum		; デバイス番号（ジョイスティックのみ）
;	Integer	iKeyNum		; 仮想キーコード／仮想ジョイスティックボタン
;	String	strCommand	; コマンドID

; デバイスタイプ
Constant	idKeyboard	:= 0,
			idMouse		:= 1,
			idJoyStick	:= 2,
			idCommand	:= 3

; 仮想キーコード
; '0'～'9'、'A'～'Z' は ASCII コードと同じ
Constant	VK_LBUTTON        := 01H
Constant	VK_RBUTTON        := 02H
Constant	VK_CANCEL         := 03H
Constant	VK_MBUTTON        := 04H
Constant	VK_BACK           := 08H
Constant	VK_TAB            := 09H
Constant	VK_CLEAR          := 0CH
Constant	VK_RETURN         := 0DH
Constant	VK_SHIFT          := 10H
Constant	VK_CONTROL        := 11H
Constant	VK_MENU           := 12H
Constant	VK_PAUSE          := 13H
Constant	VK_CAPITAL        := 14H
Constant	VK_KANA           := 15H
Constant	VK_HANGEUL        := 15H
Constant	VK_HANGUL         := 15H
Constant	VK_JUNJA          := 17H
Constant	VK_FINAL          := 18H
Constant	VK_HANJA          := 19H
Constant	VK_KANJI          := 19H
Constant	VK_ESCAPE         := 1BH
Constant	VK_CONVERT        := 1CH
Constant	VK_NONCONVERT     := 1DH
Constant	VK_ACCEPT         := 1EH
Constant	VK_MODECHANGE     := 1FH
Constant	VK_SPACE          := 20H
Constant	VK_PRIOR          := 21H
Constant	VK_NEXT           := 22H
Constant	VK_END            := 23H
Constant	VK_HOME           := 24H
Constant	VK_LEFT           := 25H
Constant	VK_UP             := 26H
Constant	VK_RIGHT          := 27H
Constant	VK_DOWN           := 28H
Constant	VK_SELECT         := 29H
Constant	VK_PRINT          := 2AH
Constant	VK_EXECUTE        := 2BH
Constant	VK_SNAPSHOT       := 2CH
Constant	VK_INSERT         := 2DH
Constant	VK_DELETE         := 2EH
Constant	VK_HELP           := 2FH
Constant	VK_LWIN           := 5BH
Constant	VK_RWIN           := 5CH
Constant	VK_APPS           := 5DH
Constant	VK_SLEEP          := 5FH
Constant	VK_NUMPAD0        := 60H
Constant	VK_NUMPAD1        := 61H
Constant	VK_NUMPAD2        := 62H
Constant	VK_NUMPAD3        := 63H
Constant	VK_NUMPAD4        := 64H
Constant	VK_NUMPAD5        := 65H
Constant	VK_NUMPAD6        := 66H
Constant	VK_NUMPAD7        := 67H
Constant	VK_NUMPAD8        := 68H
Constant	VK_NUMPAD9        := 69H
Constant	VK_MULTIPLY       := 6AH
Constant	VK_ADD            := 6BH
Constant	VK_SEPARATOR      := 6CH
Constant	VK_SUBTRACT       := 6DH
Constant	VK_DECIMAL        := 6EH
Constant	VK_DIVIDE         := 6FH
Constant	VK_F1             := 70H
Constant	VK_F2             := 71H
Constant	VK_F3             := 72H
Constant	VK_F4             := 73H
Constant	VK_F5             := 74H
Constant	VK_F6             := 75H
Constant	VK_F7             := 76H
Constant	VK_F8             := 77H
Constant	VK_F9             := 78H
Constant	VK_F10            := 79H
Constant	VK_F11            := 7AH
Constant	VK_F12            := 7BH
Constant	VK_F13            := 7CH
Constant	VK_F14            := 7DH
Constant	VK_F15            := 7EH
Constant	VK_F16            := 7FH
Constant	VK_F17            := 80H
Constant	VK_F18            := 81H
Constant	VK_F19            := 82H
Constant	VK_F20            := 83H
Constant	VK_F21            := 84H
Constant	VK_F22            := 85H
Constant	VK_F23            := 86H
Constant	VK_F24            := 87H

; コンテキストキーマスク
Constant	ckmShift		:= 1000H,
			ckmControl		:= 2000H,
			ckmMenu			:= 4000H,
			ckmCaptal		:= 8000H,
			ckmKeyCodeMask	:= 00FFH

; 仮想ジョイスティックボタン
Constant	jbUp		:= 0,
			jbDown		:= 1,
			jbLeft		:= 2,
			jbRight		:= 3,
			jbButton1	:= 4,
			jbButton2	:= 5,
			jbButton3	:= 6,
			jbButton4	:= 7,
			jbButtonMax	:= jbButton1 + 32

; トーンフィルターフラグ
Constant	EGL_TONE_BRIGHTNESS	:= 0000H,
			EGL_TONE_INVERSION	:= 0001H,
			EGL_TONE_LIGHT		:= 0002H
Constant	tffFixZero			:= 0001H,
			tffMaskWithAlpha	:= 0002H,
			tffYUVFilter		:= 0004H

; タイムアウト（永遠に）
Constant	INFINITE := -1


; ベジェ曲線
DeclareType	Bezier1D

DeclareType	Bezier2D
;	Array	cp
;	this.cp[0] := Vector2D
;	this.cp[1] := Vector2D
;	this.cp[2] := Vector2D
;	this.cp[3] := Vector2D

DeclareType	Bezier3D

; 表面属性
DeclareType	SurfaceAttribute
;	Integer		nShadingFlags
;	Integer		rgbColorMul := 0FFFFFFH
;	Integer		rgbColorAdd
;	Integer		nAmbient
;	Integer		nDiffusion
;	Integer		nSpecular
;	Integer		nTransparency
;	Integer		nDeepness

; 色情報
DeclareType	E3DColor
;	Integer	rgbMul := 0FFFFFFH
;	Integer	rgbAdd

; 光源
DeclareType	LightEntry
;	Integer		nLightType
;	Integer		rgbColor
;	Real		rBrightness
;	Vector		vecLight


; 時刻
DeclareType	Time
;	Integer	nYear
;	Integer	nMonth
;	Integer	nDay
;	Integer	nWeek
;	Integer	nHour
;	Integer	nMinute
;	Integer	nSecond


; メモリステータス
DeclareType	MemoryStatus
;	Integer	nTotalPhys
;	Integer	nAvailPhys
;	Integer	nTotalVirtual
;	Integer	nAvailVirtual


; ----------------------------------------------------------------------------
;	型宣言
; ----------------------------------------------------------------------------

DeclareType	File
DeclareType	Resource
	DeclareType	Sprite
		DeclareType	SuperSprite
		DeclareType	MovieSprite
		DeclareType	Window
		DeclareType	MessageSprite
		DeclareType	ParticleSprite
DeclareType	ResourceManager
DeclareType	ToneFilter
DeclareType	InputFilter
DeclareType	PolygonModel
DeclareType	ModelJoint
	DeclareType	ParticleModel
DeclareType	RenderSprite

; 演算子オーバーロード用
Constant	csotAdd := 0,
			csotSub := 1,
			csotMul := 2,
			csotDiv := 3,
			csotMod := 4,
			csotAnd := 5,
			csotOr := 6,
			csotXor := 7,
			csotLogicalAnd := 8,
			csoutLogicalOr := 9

Constant	csuotPlus := 0,
			csuotNegate := 1,
			csuotBitNot := 2,
			csuotLogicalNot := 3

Constant	csctNotEqual := 0,
			csctEqual := 1,
			csctLessThan := 2,
			csctLessEqual := 3,
			csctGreaterThan := 4,
			csctGreaterEqual := 5

; File シークフラグ
Constant	FromBegin := 0, FromCurrent := 1, FromEnd := 2

; File オープンフラグ
Constant	modeCreateFlag	:= 0001H,
			modeCreate		:= 0005H,
			modeRead		:= 0002H,
			modeWrite		:= 0004H,
			modeReadWrite	:= 0006H,
			shareRead		:= 0010H,
			shareWrite		:= 0020H

; Resource（音声再生モードフラグ）
Constant	ptfMusic :=0, ptfSE :=1, ptfVoice :=2, ptfSystem := 3
Constant	ptfDevice := 80000000H

; Sprite（アニメーションフラグ）
Constant	animeNormal	:= 1,
			animeAction	:= 2,
			animeEffect	:= 4

; MovieSprite（動画再生モードフラグ）
Constant	mpfDirectDraw		:= 01H,
			mpfLoopPlay			:= 02H,
			mpfNoLoopFilter		:= 0400H,
			mpfUseLoopFilter	:= 0800H

; ParticleSprite（生成フラグ）
Constant	gfNegativeMask		:= 01H,
			gfGenerationPoints	:= 02H,
			gfRaySide			:= 04H

; RenderSprite（カメラアニメーションフラグ）
Constant	ctOnlyAngle	:= 01H

; Sprite（アイテム通知コード）
Constant	bsNormal := 0,
			bsFocus := 1,
			bsPushed := 2,
			bsPushedFocus := 3,
			bsDisabled := 4,
			bsPushDisabled := 5,
			bsActivePushed := 6
Constant	ncGeneric := 0,
			ncLineUp := 1,
			ncLineDown := 2,
			ncClickColumn := 3,
			ncTracking := 4,
			ncEndTracking := 5
Constant	ncChange := 0,
			ncKillFocus := 1

; ウィンドウ協調レベル
Constant	levelWindow		:= 0000H,
			levelNormal		:= 0001H,
			levelFullScreen	:= 0003H,
			levelExclusive	:= 0007H

; ウィンドウ機能フラグ
Constant	optfUseDblClick			:= 00000001H,
			optfAllowClose			:= 00000002H,
			optfBlackBack			:= 00000004H,
			optfEnableIME			:= 00000008H,
			optfAllowMinimize		:= 00000010H,
			optfGrantScreenSave		:= 00000020H,
			optfGrantMonitorSave	:= 00000040H,
			optfGrantPowerSuspend	:= 00000080H,
			optfOpenIME				:= 00010000H

; GetSystemPerformance タイプ
Constant	sysProcessorType	:= 00H,
			sysFontSmoothing	:= 01H

; CPU タイプ
Constant	GLS_USE_MMX_PENTIUM	:= 0002H,
			GLS_USE_XMM_SSE		:= 0008H,
			GLS_USE_XMM_SSE2	:= 0010H


;@ENDIF

