#tag Class
Protected Class Macro
	#tag Method, Flags = &h0
		Sub Constructor()
		  Me.Constructor(New JSONItem)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(Data As JSONItem)
		  Messages = Data
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count() As Integer
		  ' The last record index is Count-1
		  Return Messages.Count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Load(LoadFrom As FolderItem) As Scintilla.Macro
		  Dim bs As BinaryStream = BinaryStream.Open(LoadFrom)
		  Dim m As Scintilla.Macro = Scintilla.Macro.Load(bs)
		  bs.Close
		  Return m
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Load(LoadFrom As MemoryBlock) As Scintilla.Macro
		  Dim bs As New BinaryStream(LoadFrom)
		  Return Scintilla.Macro.Load(bs)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function Load(LoadFrom As Readable) As Scintilla.Macro
		  Dim data As MemoryBlock = ""
		  While Not LoadFrom.EOF
		    data = data + LoadFrom.Read(4096)
		  Wend
		  Dim js As JSONItem
		  Try
		    js = New JSONItem(Data)
		  Catch
		    Return Nil
		  End Try
		  Return New Scintilla.Macro(js)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Play(Receiver As Scintilla.Editor, MacroIndex As Integer) As Integer
		  ' Pass the index of the action to playback, the first action is at index 0.
		  ' Returns the index of the next action, or -1 if there are no more actions.
		  
		  Dim MacroRecord As JSONItem = Me.Value(MacroIndex)
		  Dim msg As Integer = MacroRecord.Value("M")
		  Dim WParam, LParam As Variant
		  WParam = MacroRecord.Value("W")
		  LParam = MacroRecord.Value("L")
		  If VarType(LParam) = Variant.TypeString Then
		    Dim mb As New MemoryBlock(LParam.StringValue.Len * 2 + 1)
		    mb.CString(0) = LParam.StringValue
		    LParam = mb
		  End If
		  Try
		    Call Receiver.SendMessage(msg, WParam, LParam)
		  Catch
		    Raise New RuntimeException 'ERR_MACRO_TARGET_ERRED)
		  End Try
		  If MacroIndex >= Messages.Count - 1 Then Return -1
		  Return MacroIndex + 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Record(Msg As Integer, WParam As Ptr, LParam As Ptr)
		  ' Appends an action to the macro. Not all Scintilla actions may be recorded; in particular, actions that
		  ' return a value. The WParam and LParam parameters must be serialized below, or in a subclass that implements
		  ' the Serialize event.
		  
		  Dim MacroRecord As New JSONItem
		  MacroRecord.Value("M") = Msg
		  Select Case Msg
		  Case Scintilla.SCI.CUT, Scintilla.SCI.COPY, Scintilla.SCI.PASTE, Scintilla.SCI.CLEAR, Scintilla.SCI.CLEARALL, _
		    Scintilla.SCI.SELECTALL, Scintilla.SCI.SEARCHANCHOR, Scintilla.SCI.LINEDOWN, Scintilla.SCI.LINEDOWNEXTEND, _
		    Scintilla.SCI.PARADOWN, Scintilla.SCI.PARADOWNEXTEND, Scintilla.SCI.LINEUP, Scintilla.SCI.LINEUPEXTEND, _
		    Scintilla.SCI.PARAUP, Scintilla.SCI.PARAUPEXTEND, Scintilla.SCI.CHARLEFT, Scintilla.SCI.CHARLEFTEXTEND, _
		    Scintilla.SCI.CHARRIGHT, Scintilla.SCI.CHARRIGHTEXTEND, Scintilla.SCI.WORDLEFT, Scintilla.SCI.WORDLEFTEXTEND, _
		    Scintilla.SCI.WORDRIGHT, Scintilla.SCI.WORDRIGHTEXTEND, Scintilla.SCI.WORDPARTLEFT, Scintilla.SCI.WORDPARTLEFTEXTEND, _
		    Scintilla.SCI.WORDPARTRIGHT, Scintilla.SCI.WORDPARTRIGHTEXTEND, Scintilla.SCI.WORDLEFTEND, Scintilla.SCI.WORDLEFTENDEXTEND, _
		    Scintilla.SCI.WORDRIGHTEND, Scintilla.SCI.WORDRIGHTENDEXTEND, Scintilla.SCI.HOME, Scintilla.SCI.HOMEEXTEND, Scintilla.SCI.LINEEND, _
		    Scintilla.SCI.LINEENDEXTEND, Scintilla.SCI.HOMEWRAP, Scintilla.SCI.HOMEWRAPEXTEND, Scintilla.SCI.LINEENDWRAP, _
		    Scintilla.SCI.LINEENDWRAPEXTEND, Scintilla.SCI.DOCUMENTSTART, Scintilla.SCI.DOCUMENTSTARTEXTEND, Scintilla.SCI.DOCUMENTEND, _
		    Scintilla.SCI.DOCUMENTENDEXTEND, Scintilla.SCI.STUTTEREDPAGEUP, Scintilla.SCI.STUTTEREDPAGEUPEXTEND, Scintilla.SCI.STUTTEREDPAGEDOWN, _
		    Scintilla.SCI.STUTTEREDPAGEDOWNEXTEND, Scintilla.SCI.PAGEUP, Scintilla.SCI.PAGEUPEXTEND, Scintilla.SCI.PAGEDOWN, _
		    Scintilla.SCI.PAGEDOWNEXTEND, Scintilla.SCI.EDITTOGGLEOVERTYPE, Scintilla.SCI.CANCEL, Scintilla.SCI.DELETEBACK, _
		    Scintilla.SCI.TAB, Scintilla.SCI.BACKTAB, Scintilla.SCI.FORMFEED, Scintilla.SCI.VCHOME, Scintilla.SCI.VCHOMEEXTEND, _
		    Scintilla.SCI.VCHOMEWRAP, Scintilla.SCI.VCHOMEWRAPEXTEND, Scintilla.SCI.DELWORDLEFT, Scintilla.SCI.DELWORDRIGHT, _
		    Scintilla.SCI.DELWORDRIGHTEND, Scintilla.SCI.DELLINELEFT, Scintilla.SCI.DELLINERIGHT, Scintilla.SCI.LINECOPY, _
		    Scintilla.SCI.LINECUT, Scintilla.SCI.LINEDELETE, Scintilla.SCI.LINETRANSPOSE, Scintilla.SCI.LINEDUPLICATE, _
		    Scintilla.SCI.LOWERCASE, Scintilla.SCI.LINESCROLLDOWN, Scintilla.SCI.LINESCROLLUP, Scintilla.SCI.DELETEBACKNOTLINE, _
		    Scintilla.SCI.HOMEDISPLAY, Scintilla.SCI.HOMEDISPLAYEXTEND, Scintilla.SCI.LINEENDDISPLAY, Scintilla.SCI.LINEENDDISPLAYEXTEND, _
		    Scintilla.SCI.SETSELECTIONMODE, Scintilla.SCI.LINEDOWNRECTEXTEND, Scintilla.SCI.LINEUPRECTEXTEND, Scintilla.SCI.CHARLEFTRECTEXTEND, _
		    Scintilla.SCI.CHARRIGHTRECTEXTEND, Scintilla.SCI.HOMERECTEXTEND, Scintilla.SCI.VCHOMERECTEXTEND, Scintilla.SCI.LINEENDRECTEXTEND, _
		    Scintilla.SCI.PAGEUPRECTEXTEND, Scintilla.SCI.PAGEDOWNRECTEXTEND, Scintilla.SCI.SELECTIONDUPLICATE, Scintilla.SCI.COPYALLOWLINE, _
		    Scintilla.SCI.VERTICALCENTRECARET, Scintilla.SCI.MOVESELECTEDLINESUP, Scintilla.SCI.MOVESELECTEDLINESDOWN, Scintilla.SCI.SCROLLTOSTART, _
		    Scintilla.SCI.SCROLLTOEND
		    MacroRecord.Value("W") = 0
		    MacroRecord.Value("L") = Nil
		  Case Scintilla.SCI.ADDTEXT, Scintilla.SCI.INSERTTEXT, Scintilla.SCI.APPENDTEXT, Scintilla.SCI.REPLACESEL, Scintilla.SCI.SEARCHNEXT, _
		    Scintilla.SCI.SEARCHPREV, Scintilla.SCI.SETTEXT, Scintilla.SCI.STYLESETFONT
		    MacroRecord.Value("W") = Integer(WParam)
		    Dim mb As MemoryBlock = LParam
		    MacroRecord.Value("L") = mb.CString(0)
		    
		  Case Scintilla.SCI.GOTOLINE, Scintilla.SCI.GOTOPOS, Scintilla.SCI.SETUNDOCOLLECTION, Scintilla.SCI.SETMOUSEDOWNCAPTURES, _
		    Scintilla.SCI.SETCARETPERIOD, Scintilla.SCI.SETCURRENTPOS, Scintilla.SCI.SETSAVEPOINT, Scintilla.SCI.SETBUFFEREDDRAW, _
		    Scintilla.SCI.SETFOCUS, Scintilla.SCI.SETSTATUS, Scintilla.SCI.SETMOUSEDWELLTIME, Scintilla.SCI.SETOVERTYPE, _
		    Scintilla.SCI.SETREADONLY, Scintilla.SCI.USEPOPUP, Scintilla.SCI.SETWRAPMODE, Scintilla.SCI.SETVIEWEOL, _
		    Scintilla.SCI.SETSELECTIONEND, Scintilla.SCI.SETSELECTIONSTART
		    MacroRecord.Value("W") = Integer(WParam)
		    MacroRecord.Value("L") = Nil
		    
		  Case Scintilla.SCI.SETMARGINWIDTHN, Scintilla.SCI.SETMARGINTYPEN, Scintilla.SCI.STYLESETSIZEFRACTIONAL, Scintilla.SCI.STYLESETFORE, _
		    Scintilla.SCI.STYLESETBACK
		    MacroRecord.Value("W") = Integer(WParam)
		    MacroRecord.Value("L") = Integer(LParam)
		    
		  Else
		    MacroRecord = RaiseEvent Serialize(Msg, WParam, LParam)
		    If MacroRecord = Nil Then Raise New RuntimeException 'ERR_BAD_MACRO_ACTION)
		  End Select
		  If IncludeMessageNames Then MacroRecord.Value("N") = Scintilla.SCI.GetMessageName(Msg)
		  Messages.Append(MacroRecord)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ToString(Compact As Boolean = True) As String
		  If Messages <> Nil Then
		    Messages.Compact = Compact
		    Return Messages.ToString
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Index As Integer) As JSONItem
		  ' Provides read/write access to the MacroRecord at Index; the Index must already exist.
		  ' A MacroRecord is a JSONItem with at least these three fields:
		  '-----
		  ' "M": An integer, the message ID (e.g. Scintilla.SCI.COPY)
		  ' "W": A Variant containing a serialized representation of the WParam parameter to the message
		  ' "L": A Variant containing a serialized representation of the LParam parameter to the message
		  '-----
		  ' "W" and/or "L" may be Nil
		  ' e.g.
		  ' Dim mac As Scintilla.Macro = Scintilla.Macro.Load(MyMacro)
		  ' If mac.Value(15).Value("M") = Scintilla.SCI.REPLACESEL // Reads message ID of record 15
		  '   mac.Value(15).Value("L") = "Z" // puts the string "Z" in LParam of record 15
		  ' End If
		  
		  If Index > -1 And Index <= Messages.Count - 1 Then Return Messages.Value(Index)
		  Raise New OutOfBoundsException
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Serialize(Msg As Integer, WParam As Ptr, LParam As Ptr) As JSONItem
	#tag EndHook


	#tag Property, Flags = &h0
		#tag Note
			To aid debugging, the names of MsgIDs can be included in the macro
		#tag EndNote
		IncludeMessageNames As Boolean = DebugBuild
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Messages As JSONItem
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="IncludeMessageNames"
			Group="Behavior"
			InitialValue="DebugBuild"
			Type="Boolean"
		#tag EndViewProperty
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
End Class
#tag EndClass
