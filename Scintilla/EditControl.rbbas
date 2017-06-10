#tag Class
Protected Class EditControl
Inherits Canvas
	#tag Event
		Sub Close()
		  RaiseEvent Close()
		  mEditor = Nil
		End Sub
	#tag EndEvent

	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  ' This event is to be ignored
		  #pragma Unused X
		  #pragma Unused Y
		End Sub
	#tag EndEvent

	#tag Event
		Function DragEnter(obj As DragItem, action As Integer) As Boolean
		  ' This event is to be ignored
		  #pragma Unused obj
		  #pragma Unused action
		End Function
	#tag EndEvent

	#tag Event
		Sub DragExit(obj As DragItem, action As Integer)
		  ' This event is to be ignored
		  #pragma Unused obj
		  #pragma Unused action
		End Sub
	#tag EndEvent

	#tag Event
		Function DragOver(x As Integer, y As Integer, obj As DragItem, action As Integer) As Boolean
		  ' This event is to be ignored
		  #pragma Unused obj
		  #pragma Unused action
		  #pragma Unused x
		  #pragma Unused y
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  ' This event is to be ignored
		  #pragma Unused obj
		  #pragma Unused action
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  ' This event is to be ignored
		  #pragma Unused Key
		End Function
	#tag EndEvent

	#tag Event
		Sub KeyUp(Key As String)
		  ' This event is to be ignored
		  #pragma Unused Key
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  ' This event is to be ignored
		  #pragma Unused X
		  #pragma Unused Y
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  ' This event is to be ignored
		  #pragma Unused X
		  #pragma Unused Y
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  ' This event is to be ignored
		  #pragma Unused X
		  #pragma Unused Y
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  ' This event is to be ignored
		  #pragma Unused X
		  #pragma Unused Y
		  #pragma Unused deltaX
		  #pragma Unused deltaY
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  mEditor = New Editor(Me, 0, 0, Me.Width, Me.Height)
		  AddHandler mEditor.ScintillaEvent, WeakAddressOf ScintillaEventHandler
		  
		  ' If we recorded any macros, replay them
		  mInitMacroDelayTimer = New Timer
		  AddHandler mInitMacroDelayTimer.Action, WeakAddressOf mInitMacroDelayTimerActionHandler
		  mInitMacroDelayTimer.Period = 100
		  mInitMacroDelayTimer.Mode = Timer.ModeSingle
		  
		  Canvas(Me).EraseBackground = False
		  Canvas(Me).DoubleBuffer = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics)
		  ' This event is to be ignored
		  #pragma Unused g
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function Annotations() As Scintilla.Managers.Annotation
		  Return New Scintilla.Managers.Annotation(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AppendText(TextToAppend As String)
		  If TextToAppend = "" And mEditor.Handle = 0 Then Return
		  TextToAppend = ConvertEncoding(TextToAppend, Encodings.UTF8)
		  Dim mb As MemoryBlock = TextToAppend
		  Call Me.SendMessage(Scintilla.SCI.APPENDTEXT, TextToAppend.Len, mb)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoComplete() As Scintilla.Managers.AutoComplete
		  Return New Scintilla.Managers.AutoComplete(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CallTip() As Scintilla.Managers.CallTip
		  Return New Scintilla.Managers.CallTip(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clipboard() As Scintilla.Managers.Clipboard
		  Return New Scintilla.Managers.Clipboard(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateDocument() As Scintilla.Document
		  Return New Scintilla.Document(mEditor)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Enabled() As Boolean
		  Return mEditor.Enabled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Enabled(Assigns NewValue As Boolean)
		  mEditor.Enabled = NewValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EOL() As Scintilla.Managers.EOL
		  Return New Scintilla.Managers.EOL(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function History() As Scintilla.Managers.History
		  Return New Scintilla.Managers.History(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertText(InsertPos As Integer = -1, TextToInsert As String)
		  If TextToInsert = "" And mEditor.Handle = 0 Then Return
		  If InsertPos = -1 Then InsertPos = Me.CaretPosition
		  TextToInsert = ConvertEncoding(TextToInsert, Encodings.UTF8)
		  Dim mb As MemoryBlock = TextToInsert + Chr(0)
		  Call Me.SendMessage(Scintilla.SCI.INSERTTEXT, InsertPos, mb)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeyBindings() As Scintilla.Managers.KeyBindings
		  Return New Scintilla.Managers.KeyBindings(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Lines() As Scintilla.Managers.LineManager
		  Return New Scintilla.Managers.LineManager(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MacroStart()
		  Call Me.SendMessage(Scintilla.SCI.STARTRECORD)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MacroStop()
		  Call Me.SendMessage(Scintilla.SCI.STOPRECORD)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Margins() As Scintilla.Managers.Margins
		  Return New Scintilla.Managers.Margins(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub mInitMacroDelayTimerActionHandler(Sender As Timer)
		  #pragma Unused Sender
		  If mInitMacro <> Nil Then 
		    Me.PlayMacro(mInitMacro)
		    #If DUMP_INIT_MACRO Then
		      Dim s As String = mInitMacro.ToString
		      Dim bs As BinaryStream = BinaryStream.Create(SpecialFolder.Desktop.Child("init.json"), True)
		      bs.Write(s)
		      bs.Close
		    #EndIf
		  End If
		  mInitMacro = Nil
		  mInitMacroDelayTimer = Nil
		  RaiseEvent Open()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PlayMacro(Macro As Scintilla.Macro)
		  If Macro = Nil Then Return
		  Dim i As Integer
		  Do
		    i = Macro.Play(mEditor, i)
		  Loop Until i < 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Printer() As Scintilla.Managers.PrintingManager
		  Return New Scintilla.Managers.PrintingManager(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ScintillaEventHandler(Sender As Scintilla.Editor, EventCode As Integer, Notification As Scintilla.SCNotification)
		  #pragma Unused Sender
		  'System.DebugLog(CurrentMethodName + "(0x" + Hex(Sender.Handle) + "," + Scintilla.SCI.GetMessageName(EventCode) + "(" + Str(EventCode) + "))")
		  Select Case EventCode
		  Case WM_SIZE
		    Dim r As REALbasic.Rect = GetClientRect(Me.Handle)
		    Call SetWindowPos(mEditor.Handle, 0, r.Left, r.Top, r.Width, r.Height, SWP_NOZORDER Or SWP_NOOWNERZORDER)
		    
		  Case Scintilla.SCN.CHARADDED
		    RaiseEvent CharacterAdded(Chr(Notification.ch))
		    'Case Scintilla.SCN.UPDATEUI
		    'Super.Invalidate(False)
		    
		  Case Scintilla.SCN.SAVEPOINTREACHED
		    RaiseEvent SavePointReached()
		    
		  Case Scintilla.SCN.SAVEPOINTLEFT
		    RaiseEvent SavePointLeft()
		    
		  Case Scintilla.SCN.HOTSPOTCLICK
		    RaiseEvent HotspotMouseDown(notification.Position)
		    
		  Case Scintilla.SCN.HOTSPOTRELEASECLICK
		    RaiseEvent HotspotMouseUp(notification.Position)
		    
		  Case Scintilla.SCN.HOTSPOTDOUBLECLICK
		    RaiseEvent HotspotDoubleClicked(notification.Position)
		    
		  Case Scintilla.SCN.CALLTIPCLICK
		    RaiseEvent CallTipClicked(notification.Position) ' position is actually direction in this notification
		    
		  Case Scintilla.SCN.MARGINCLICK
		    RaiseEvent MarginClicked(notification.Margin, notification.Position)
		    
		  Case Scintilla.SCN.DWELLSTART
		    RaiseEvent DwellStart(Notification.Position, Notification.X, Notification.Y)
		    
		  Case Scintilla.SCN.DWELLEND
		    RaiseEvent DwellEnd(Notification.Position, Notification.X, Notification.Y)
		    
		  Case Scintilla.SCN.STYLENEEDED
		    'Break
		    
		  Case Scintilla.SCN.DOUBLECLICK
		    RaiseEvent DoubleClick(Notification.Position, Notification.line, Notification.Modifiers)
		    
		  Case Scintilla.SCN.MACRORECORD
		    RaiseEvent MacroRecord(Notification.Message, Notification.wParam, Notification.LParam)
		    
		  Case Scintilla.SCN.MODIFIED
		    Dim mt As Integer = notification.ModificationType
		    If BitAnd(mt, SC_MOD_CONTAINER) = SC_MOD_CONTAINER Then
		      If BitAnd(mt, SC_PERFORMED_UNDO) = SC_PERFORMED_UNDO Then RaiseEvent PerformUndo(Notification.Token)
		      If BitAnd(mt, SC_PERFORMED_REDO) = SC_PERFORMED_REDO Then RaiseEvent PerformRedo(Notification.Token)
		    End If
		    
		    If BitAnd(mt, SC_MOD_DELETETEXT) = SC_MOD_DELETETEXT Or _
		      BitAnd(mt, SCEN_CHANGE) = SCEN_CHANGE Or _
		      BitAnd(mt, SC_MOD_INSERTTEXT) = SC_MOD_INSERTTEXT Or _
		      BitAnd(mt, SC_PERFORMED_UNDO) = SC_PERFORMED_UNDO Or _
		      BitAnd(mt, SC_PERFORMED_REDO) = SC_PERFORMED_REDO Then
		      RaiseEvent TextChanged()
		    ElseIf BitAnd(mt, SC_MOD_CHANGELINESTATE) = SC_MOD_CHANGELINESTATE Then
		      RaiseEvent LineStateChanged(Notification.Line)
		    End If
		    
		  Case Scintilla.SCN.PAINTED
		    RaiseEvent Painted()
		    
		  Case Scintilla.SCN.UPDATEUI
		    
		  Else
		    #If DebugBuild Then
		      System.DebugLog("Unhandled Scintilla event: " + Scintilla.SCN.GetNotificationName(EventCode) + "(" + Str(EventCode) + ")")
		    #endif
		    
		  End Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScrollPosition() As Scintilla.Managers.ScrollManager
		  Return New Scintilla.Managers.ScrollManager(Me)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Searcher() As Scintilla.Managers.FindReplace
		  If mSearchEngine = Nil Then mSearchEngine = New Scintilla.Managers.FindReplace(Me)
		  Return mSearchEngine
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  Call Me.SendMessage(Scintilla.SCI.SETEMPTYSELECTION, 0)
		  Call Me.SendMessage(Scintilla.SCI.SELECTALL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SendMessage(Msg As Integer, WParam As Variant = Nil, LParam As Variant = Nil, DirectMessage As Boolean = False) As Integer
		  Dim W, L As Ptr
		  W = PackParam(WParam)
		  L = PackParam(LParam)
		  
		  If mEditor = Nil Then ' queue up commands that are sent before the Editor is constructed
		    If mInitMacro = Nil Then mInitMacro = New Scintilla.Macro
		    mInitMacro.Record(Msg, W, L)
		    Return 0
		  Else ' Normal messaging
		    Return mEditor.SendMessage(Msg, W, L, DirectMessage)
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRangeStyle(StartPosition As Integer, EndPosition As Integer, StyleNumber As Integer)
		  Dim oldcarat, oldanchor As Integer
		  oldcarat = Me.TextSelection.Caret
		  oldanchor = Me.TextSelection.Anchor
		  If StartPosition > -1 Then
		    Me.TextSelection.Caret = StartPosition
		  End If
		  If EndPosition > -1 Then
		    Me.TextSelection.Anchor = EndPosition
		  End If
		  Me.TextSelection.Style = Me.Style(StyleNumber)
		  Me.TextSelection.Caret = oldcarat
		  Me.TextSelection.Anchor = oldanchor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Style(StyleNumber As Integer) As Scintilla.Managers.Style
		  If mStyles = Nil Then mStyles = New Dictionary(0:New Scintilla.Managers.Style(Me, 0))
		  If Not mStyles.HasKey(StyleNumber) Then mStyles.Value(StyleNumber) = New Scintilla.Managers.Style(Me, StyleNumber)
		  Return mStyles.Value(StyleNumber)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TextSelection() As Scintilla.Managers.SelectionManager
		  Return New Scintilla.Managers.SelectionManager(Me)
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AutoCompleteCancel()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event AutoCompleteSelection(SelectedText As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CallTipClicked(Direction As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event CharacterAdded(Char As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Close()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DoubleClick(Position As Integer, LineNumber As Integer, Modifiers As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DwellEnd(Position As Integer, X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DwellStart(Position As Integer, X As Integer, Y As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HotspotDoubleClicked(Position As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HotspotMouseDown(Position As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event HotspotMouseUp(Position As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LineStateChanged(LineNumber As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MacroRecord(MessageID As Integer, WParam As Ptr, LParam As Ptr)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MarginClicked(MarginNumber As Integer, CharPos As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Painted()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PerformRedo(Tag As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event PerformUndo(Tag As Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SavePointLeft()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SavePointReached()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ScintillaEvent(EventCode As Integer, Notification As Scintilla.SCNotification)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TextChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.Style(0).Background
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Style(0).Background = value
			End Set
		#tag EndSetter
		BackColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETMOUSEDOWNCAPTURES) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETMOUSEDOWNCAPTURES, value, 0)
			End Set
		#tag EndSetter
		CaptureMouse As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETCURRENTPOS)
			  
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETCURRENTPOS, value)
			  
			  
			End Set
		#tag EndSetter
		CaretPosition As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  If mCurrentDocument = Nil Then
			    Dim doc As Integer = Me.SendMessage(Scintilla.SCI.GETDOCPOINTER)
			    If doc = 0 Then
			      mCurrentDocument = New Scintilla.Document(mEditor)
			    Else
			      mCurrentDocument = New Scintilla.Document(mEditor, Ptr(doc))
			    End If
			  End If
			  Return mCurrentDocument
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETDOCPOINTER, Nil, value.Handle)
			  mCurrentDocument = value
			  
			End Set
		#tag EndSetter
		CurrentDocument As Scintilla.Document
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETCURLINE)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.GOTOLINE, value, 0)
			End Set
		#tag EndSetter
		CurrentLine As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETMODIFY) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value And DebugBuild Then Raise New RuntimeException ' Can only be set to False
			  Call Me.SendMessage(Scintilla.SCI.SETSAVEPOINT)
			End Set
		#tag EndSetter
		Dirty As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETBUFFEREDDRAW) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETBUFFEREDDRAW, value)
			End Set
		#tag EndSetter
		DoubleBuffered As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETVIEWEOL) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETVIEWEOL, value)
			End Set
		#tag EndSetter
		EOLVisible As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  If value.Trim = "" Then Return
			  Dim err As New UnsupportedFormatException
			  If CountFields(value, ",") > 5 Then
			    err.Message = "MarginTypes contains too many fields"
			    Raise err
			  End If
			  Dim fields() As String = Split(value, ",")
			  For i As Integer = 0 To UBound(fields)
			    If Not IsNumeric(fields(i)) Then
			      err.Message = "MarginTypes contains an invalid field: '" + fields(i) + "'"
			      Raise err
			    End If
			    Dim w As Integer = Val(fields(i))
			    If w < 0 Or w > 5 Then
			      err.Message = "MarginTypes must be 0-4"
			      Raise err
			    End If
			    Call Me.SendMessage(Scintilla.SCI.SETMARGINTYPEN, i, w)
			  Next
			End Set
		#tag EndSetter
		MarginTypes As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Setter
			Set
			  If value.Trim = "" Then Return
			  Dim err As New UnsupportedFormatException
			  If CountFields(value, ",") > 5 Then
			    err.Message = "MarginWidths contains too many fields"
			    Raise err
			  End If
			  Dim fields() As String = Split(value, ",")
			  For i As Integer = 0 To UBound(fields)
			    If Not IsNumeric(fields(i)) Then
			      err.Message = "MarginWidths contains an invalid field: '" + fields(i) + "'"
			      Raise err
			    End If
			    Dim w As Integer = Val(fields(i))
			    Call Me.SendMessage(Scintilla.SCI.SETMARGINWIDTHN, i, w)
			  Next
			End Set
		#tag EndSetter
		MarginWidths As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCurrentDocument As Scintilla.Document
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEditor As Scintilla.Editor
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			If RB sets any computed properties before the ScintillaEditor is constructed, we need to queue up the corresponding commands until
			we can send them. Luckily, the Macro class is well suited for that.
		#tag EndNote
		Private mInitMacro As Scintilla.Macro
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitMacroDelayTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRecordMacro As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSearchEngine As Scintilla.Managers.FindReplace
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStyles As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUsePopup As Boolean = True
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETOVERTYPE) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETOVERTYPE, value, 0)
			End Set
		#tag EndSetter
		Overtype As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETREADONLY) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETREADONLY, value, 0)
			End Set
		#tag EndSetter
		ReadOnly As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mRecordMacro
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mRecordMacro = value Then Return
			  If value Then
			    Call Me.SendMessage(Scintilla.SCI.STOPRECORD)
			  Else
			    Call Me.SendMessage(Scintilla.SCI.STARTRECORD)
			  End If
			  mRecordMacro = value
			End Set
		#tag EndSetter
		RecordMacro As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETSELECTIONEND)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETSELECTIONEND, value)
			End Set
		#tag EndSetter
		SelEnd As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETSELECTIONSTART)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETSELECTIONSTART, value)
			End Set
		#tag EndSetter
		SelStart As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.CurrentDocument.Text
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  value = ConvertEncoding(value, Encodings.UTF8)
			  Dim mb As MemoryBlock = value + Chr(0)
			  Call Me.SendMessage(Scintilla.SCI.SETTEXT, Nil, mb, True) ' send a direct message since the value might be huge
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.Style(0).TextColor
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Style(0).TextColor = value
			End Set
		#tag EndSetter
		TextColor As Color
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.Style(0).TextFont
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value.Trim = "" Then Return
			  Me.Style(0).TextFont = value
			End Set
		#tag EndSetter
		TextFont As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.Style(0).TextSize
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Me.Style(0).TextSize = value
			End Set
		#tag EndSetter
		TextSize As Double
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			If True (the default), Scintilla handles WM_CONTEXTMENU and the ScintillaEditor.ConstructContextualMenu event is not raised.
			If False, then ConstructContextualMenu and ContextualMenuAction work like normal, and the Scintilla menu is supressed.
		#tag EndNote
		#tag Getter
			Get
			  Return mUsePopup ' No getter, so we cache the last set value
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.USEPOPUP, value)
			  mUsePopup = value
			End Set
		#tag EndSetter
		UsePopup As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETWRAPMODE) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value Then
			    Call Me.SendMessage(Scintilla.SCI.SETWRAPMODE, 1)
			  Else
			    Call Me.SendMessage(Scintilla.SCI.SETWRAPMODE, 0)
			  End If
			End Set
		#tag EndSetter
		WrapLines As Boolean
	#tag EndComputedProperty


	#tag Constant, Name = DUMP_INIT_MACRO, Type = Boolean, Dynamic = False, Default = \"True", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCEN_CHANGE, Type = Double, Dynamic = False, Default = \"768", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCEN_KILLFOCUS, Type = Double, Dynamic = False, Default = \"256", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SCEN_SETFOCUS, Type = Double, Dynamic = False, Default = \"512", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_LASTSTEPINUNDOREDO, Type = Double, Dynamic = False, Default = \"&h100", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MODEVENTMASKALL, Type = Double, Dynamic = False, Default = \"&h7FFFF", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_BEFOREDELETE, Type = Double, Dynamic = False, Default = \"&h800", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_BEFOREINSERT, Type = Double, Dynamic = False, Default = \"&h400", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGEANNOTATION, Type = Double, Dynamic = False, Default = \"&h20000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGEFOLD, Type = Double, Dynamic = False, Default = \"&h8", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGEINDICATOR, Type = Double, Dynamic = False, Default = \"&h4000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGELINESTATE, Type = Double, Dynamic = False, Default = \"&h8000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGEMARGIN, Type = Double, Dynamic = False, Default = \"&h10000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGEMARKER, Type = Double, Dynamic = False, Default = \"&h200", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CHANGESTYLE, Type = Double, Dynamic = False, Default = \"&h4", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_CONTAINER, Type = Double, Dynamic = False, Default = \"&h40000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_DELETETEXT, Type = Double, Dynamic = False, Default = \"&h2", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_INSERTTEXT, Type = Double, Dynamic = False, Default = \"&h1", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MOD_LEXERSTATE, Type = Double, Dynamic = False, Default = \"&h80000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_MULTILINEUNDOREDO, Type = Double, Dynamic = False, Default = \"&h1000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_PERFORMED_REDO, Type = Double, Dynamic = False, Default = \"&h40", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_PERFORMED_UNDO, Type = Double, Dynamic = False, Default = \"&h20", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_PERFORMED_USER, Type = Double, Dynamic = False, Default = \"&h10", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SC_STARTACTION, Type = Double, Dynamic = False, Default = \"&h2000", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SWP_NOMOVE, Type = Double, Dynamic = False, Default = \"&h0002", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SWP_NOOWNERZORDER, Type = Double, Dynamic = False, Default = \"&h0200", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SWP_NOREDRAW, Type = Double, Dynamic = False, Default = \"&h0008", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SWP_NOZORDER, Type = Double, Dynamic = False, Default = \"&h0004", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SWP_SHOWWINDOW, Type = Double, Dynamic = False, Default = \"&h0040", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaptureMouse"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CaretPosition"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CurrentLine"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Dirty"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffered"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EOLVisible"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Group="Initial State"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MarginTypes"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MarginWidths"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Overtype"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RecordMacro"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelEnd"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelStart"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Group="Position"
			InitialValue="0"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UsePopup"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			InheritedFrom="Canvas"
		#tag EndViewProperty
		#tag ViewProperty
			Name="WrapLines"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
