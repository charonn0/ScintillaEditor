#tag Module
Protected Module Scintilla
	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function CallWindowProcA Lib "User32" (WindowProc As Integer, HWND As Integer, msg As Integer, wParam As Ptr, lParam As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function CreateWindowExA Lib "User32" (ExStyle As Integer, ClassName As CString, WindowName As CString, Style As Integer, X As Integer, Y As Integer, Width As Integer, Height As Integer, Parent As Integer, Menu As Integer, Instance As Integer, Param As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function EnableWindow Lib "User32" (HWND As Integer, Enable As Boolean) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h0
		Sub Foo()
		  Dim d As New Dictionary("SCN_STYLENEEDED":2000, "SCN_CHARADDED":2001, "SCN_SAVEPOINTREACHED":2002, "SCN_SAVEPOINTLEFT":2003, "SCN_MODIFYATTEMPTRO":2004, "SCN_KEY":2005, "SCN_DOUBLECLICK":2006, "SCN_UPDATEUI":2007, "SCN_MODIFIED":2008, "SCN_MACRORECORD":2009, "SCN_MARGINCLICK":2010, "SCN_NEEDSHOWN":2011, "SCN_PAINTED":2013, "SCN_USERLISTSELECTION":2014, "SCN_URIDROPPED":2015, "SCN_DWELLSTART":2016, "SCN_DWELLEND":2017, "SCN_ZOOM":2018, "SCN_HOTSPOTCLICK":2019, "SCN_HOTSPOTDOUBLECLICK":2020, "SCN_CALLTIPCLICK":2021, "SCN_AUTOCSELECTION":2022, "SCN_INDICATORCLICK":2023, "SCN_INDICATORRELEASE":2024, "SCN_AUTOCCANCELLED":2025, "SCN_AUTOCCHARDELETED":2026, "SCN_HOTSPOTRELEASECLICK":2027)
		  Dim f As FolderItem = SpecialFolder.Desktop.Child("foo.txt")
		  Dim bs As BinaryStream = BinaryStream.Create(f, True)
		  For Each s As String In d.Keys
		    bs.Write(Str(d.Value(s) + ":""" + s + """, "))
		  Next
		  bs.Close
		End Sub
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function FormatMessageA Lib "Kernel32" (dwFlags As Integer, lpSource As Integer, dwMessageId As Integer, dwLanguageId As Integer, lpBuffer As ptr, nSize As Integer, Arguments As Integer) As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h21
		Private Function GetClientRect(HWND As Integer) As REALbasic.Rect
		  Dim winrect As RECT
		  If GetClientRect_(HWND, winrect) Then
		    Return New REALbasic.Rect(winrect.left, winrect.top, winrect.right - winrect.left, winrect.bottom - winrect.top)
		  End If
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function GetClientRect_ Lib "User32" Alias "GetClientRect" (HWND As Integer, ByRef Rect As RECT) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function GetLastError Lib "Kernel32" () As Integer
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function IsAvailable() As Boolean
		  ' IMPORTANT: THIS METHOD MUST BE CALLED IN ORDER TO INITIALIZE SCINTILLA.
		  ' Calling System.IsFunctionAvailable is equivalent to calling LoadLibrary and GetProcAddress
		  ' which is how Scintilla initializes itself
		  #If TargetWin32 And TargetHasGUI Then
		    Static available As Boolean
		    If Not available Then available = _
		    System.IsFunctionAvailable("Scintilla_DirectFunction", "SciLexer") Or _
		    System.IsFunctionAvailable("_Scintilla_DirectFunction@16", "SciLexer")
		    Return available
		  #else
		    #pragma Error "This control is for Win32 GUI targets only"
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PackParam(Param As Variant) As Ptr
		  Dim p As Ptr
		  Select Case True
		  Case VarType(Param) = Variant.TypePtr, Param IsA MemoryBlock
		    p = Param
		  Case VarType(Param) = Variant.TypeBoolean
		    If Param.BooleanValue Then
		      Return PackParam(1)
		    Else
		      Return PackParam(0)
		    End If
		  Case VarType(Param) = Variant.TypeInteger
		    p = Ptr(Param.Int32Value)
		  Case VarType(Param) = Variant.TypeString
		    ' this sometimes doesn't work. Prefer MemoryBlocks
		    Dim mb As New MemoryBlock(Param.StringValue.LenB * 2 + 1)
		    mb.CString(0) = Param.StringValue
		    p = mb
		  Case VarType(Param) = Variant.TypeNil
		    p = Nil
		  Case VarType(Param) = Variant.TypeDouble
		    Dim mb As New MemoryBlock(8)
		    mb.DoubleValue(0) = Param.DoubleValue
		    p = mb
		  Case VarType(Param) = Variant.TypeSingle
		    Dim mb As New MemoryBlock(4)
		    mb.SingleValue(0) = Param.SingleValue
		    p = mb
		  Else
		    Dim t As Integer
		    t = VarType(Param)
		    Raise New UnsupportedFormatException
		  End Select
		  Return p
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function SendMessageA Lib "User32" (HWND As Integer, Message As Integer, WParam As Ptr, LParam As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function SetParent Lib "User32" (HWNDChild As Integer, HWNDNewParent As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function SetWindowLongA Lib "User32" (HWND As Integer, Index As Integer, NewLong As Ptr) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h21
		Private Soft Declare Function SetWindowPos Lib "User32" (HWND As Integer, HWNDInsertAfter As Integer, X As Integer, Y As Integer, cX As Integer, cY As Integer, Flags As Integer) As Boolean
	#tag EndExternalMethod


	#tag Property, Flags = &h21
		Private Subclasses() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WndProcs As Dictionary
	#tag EndProperty


	#tag Constant, Name = ERR_BAD_MACRO_ACTION, Type = Double, Dynamic = False, Default = \"-106", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERR_BAD_MACRO_DATA, Type = Double, Dynamic = False, Default = \"-105", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERR_BAD_MACRO_INDEX, Type = Double, Dynamic = False, Default = \"-104", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERR_BAD_MACRO_OBJECT, Type = Double, Dynamic = False, Default = \"-109", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERR_INVALID_MARGIN_NUMBER, Type = Double, Dynamic = False, Default = \"-101", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERR_INVALID_STYLE_NUMBER, Type = Double, Dynamic = False, Default = \"-100", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERR_INVALID_STYLE_OWNER, Type = Double, Dynamic = False, Default = \"-102", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ERR_MISSING_EDITOR, Type = Double, Dynamic = False, Default = \"-108", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = FORMAT_MESSAGE_FROM_SYSTEM, Type = Double, Dynamic = False, Default = \"&H1000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = WM_SIZE, Type = Double, Dynamic = False, Default = \"&h0005", Scope = Private
	#tag EndConstant


	#tag Structure, Name = CharacterRange, Flags = &h21
		cpMin As Integer
		cpMax As Integer
	#tag EndStructure

	#tag Structure, Name = RECT, Flags = &h21
		left As Integer
		  top As Integer
		  right As Integer
		bottom As Integer
	#tag EndStructure

	#tag Structure, Name = SCNotification, Flags = &h1
		HWND As Integer
		  ID As Integer
		  Code As Integer
		  Position As Integer
		  Ch As Integer
		  Modifiers As Integer
		  ModificationType As Integer
		  Text As Ptr
		  Length As Integer
		  LinesAdded As Integer
		  Message As Integer
		  WParam As Ptr
		  LParam As Ptr
		  Line As Integer
		  FoldLevelNow As Integer
		  FoldLevelPrev As Integer
		  Margin As Integer
		  ListType As Integer
		  X As Integer
		  Y As Integer
		  Token As Integer
		  AnnotatedLinesAdded As Integer
		Updated As Integer
	#tag EndStructure

	#tag Structure, Name = TextToFind, Flags = &h21
		Range As CharacterRange
		  SearchPattern As Ptr
		Result As CharacterRange
	#tag EndStructure


	#tag Enum, Name = LexerTypes, Flags = &h1
		CONTAINER=0
		  NULL
		  PYTHON
		  CPP
		  HTML
		  XML
		  PERL
		  SQL
		  VB
		  PROPERTIES
		  ERRORLIST
		  MAKEFILE
		  BATCH
		  XCODE
		  LATEX
		  LUA
		  DIFF
		  CONF
		  PASCAL
		  AVE
		  ADA
		  LISP
		  RUBY
		  EIFFEL
		  EIFFELKW
		  TCL
		  NNCRONTAB
		  BULLANT
		  VBSCRIPT
		  BAAN
		  MATLAB
		  SCRIPTOL
		  ASM
		  CPPNOCASE
		  FORTRAN
		  F77
		  CSS
		  POV
		  LOUT
		  ESCRIPT
		  PS
		  NSIS
		  MMIXAL
		  CLW
		  CLWNOCASE
		  LOT
		  YAML
		  TEX
		  METAPOST
		  POWERBASIC
		  FORTH
		  ERLANG
		  OCTAVE
		  MSSQL
		  VERILOG
		  KIX
		  GUI4CLI
		  SPECMAN
		  AU3
		  APDL
		  BASH
		  ASN1
		  VHDL
		  CAML
		  BLITZBASIC
		  PUREBASIC
		  HASKELL
		  PHPSCRIPT
		  TADS3
		  REBOL
		  SMALLTALK
		  FLAGSHIP
		  CSOUND
		  FREEBASIC
		  INNOSETUP
		  OPAL
		  SPICE
		  D
		  CMAKE
		  GAP
		  PLM
		  PROGRESS
		  ABAQUS
		  ASYMPTOTE
		  R
		  MAGIK
		  POWERSHELL
		  MYSQL
		  PO
		  TAL
		  COBOL
		  TACL
		  SORCUS
		  POWERPRO
		  NIMROD
		  SML
		  MARKDOWN
		  TXT2TAGS
		  A68K
		AUTOMATIC
	#tag EndEnum

	#tag Enum, Name = SC_MARGIN, Type = Integer, Flags = &h1
		SYMBOL=0
		  NUMBER
		  BACK
		  FORE
		  TEXT
		RTEXT
	#tag EndEnum

	#tag Enum, Name = SC_MARK, Type = Integer, Flags = &h1
		MARK_CIRCLE=0
		  MARK_ROUNDRECT=1
		  MARK_ARROW=2
		  MARK_SMALLRECT=3
		  MARK_SHORTARROW=4
		  MARK_EMPTY=5
		  MARK_ARROWDOWN=6
		  MARK_MINUS=7
		  MARK_PLUS=8
		  MARK_VLINE=9
		  MARK_LCORNER=10
		  MARK_TCORNER=11
		  MARK_BOXPLUS=12
		  MARK_BOXPLUSCONNECTED=13
		  MARK_BOXMINUS=14
		  MARK_BOXMINUSCONNECTED=15
		  MARK_LCORNERCURVE=16
		  MARK_TCORNERCURVE=17
		  MARK_CIRCLEPLUS=18
		  MARK_CIRCLEPLUSCONNECTED=19
		  MARK_CIRCLEMINUS=20
		  MARK_CIRCLEMINUSCONNECTED=21
		  MARK_BACKGROUND=22
		  MARK_DOTDOTDOT=23
		  MARK_ARROWS=24
		  MARK_PIXMAP=25
		  MARK_FULLRECT=26
		  MARK_LEFTRECT=27
		  MARK_AVAILABLE=28
		  MARK_UNDERLINE=29
		  MARK_RGBAIMAGE=30
		  MARK_CHARACTER=10000
		  MARKNUM_FOLDEREND=25
		  MARKNUM_FOLDEROPENMID=26
		  MARKNUM_FOLDERMIDTAIL=27
		  MARKNUM_FOLDERTAIL=28
		  MARKNUM_FOLDERSUB=29
		  MARKNUM_FOLDER=30
		MARKNUM_FOLDEROPEN=31
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
