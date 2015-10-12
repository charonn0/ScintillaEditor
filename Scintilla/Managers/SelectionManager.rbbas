#tag Class
Protected Class SelectionManager
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Function Append(Start As Integer, Stop As Integer) As Integer
		  Call Me.SendMessage(Scintilla.SCI.ADDSELECTION, Stop, Start)
		  Return SelCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearSelectedText()
		  Call Me.SendMessage(Scintilla.SCI.CLEAR)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EmptySelection(NewCaretPosition As Integer = - 1)
		  If NewCaretPosition <= -1 Then NewCaretPosition = 0
		  Call Me.SendMessage(Scintilla.SCI.SETEMPTYSELECTION, NewCaretPosition)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasSelection() As Boolean
		  Return Me.SendMessage(Scintilla.SCI.GETSELECTIONEMPTY) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove(Index As Integer)
		  Call Me.SendMessage(Scintilla.SCI.DROPSELECTION, Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelCount() As Integer
		  Return Me.SendMessage(Scintilla.SCI.GETSELECTIONS) - 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SelectAll()
		  Me.EmptySelection()
		  Call Me.SendMessage(Scintilla.SCI.SELECTALL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Style(Assigns NewStyle As Scintilla.Managers.Style)
		  If Not (NewStyle.Field Is Me.Field) Then Raise New RuntimeException
		  Dim s, e As Integer
		  s = Me.Caret
		  e = Me.Anchor
		  Call Me.SendMessage(Scintilla.SCI.STARTSTYLING, s, &h1F) ' start styling
		  Call Me.SendMessage(Scintilla.SCI.SETSTYLING, e - s, NewStyle.StyleNumber)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETMULTIPLESELECTION) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETMULTIPLESELECTION, value)
			End Set
		#tag EndSetter
		AllowMultiple As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETSELECTIONNANCHOR, MainSelection)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETSELECTIONNANCHOR, MainSelection, value)
			End Set
		#tag EndSetter
		Anchor As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETSELECTIONNCARET, MainSelection)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETSELECTIONNCARET, MainSelection, value)
			End Set
		#tag EndSetter
		Caret As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETMAINSELECTION)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETMAINSELECTION, value, 1)
			End Set
		#tag EndSetter
		MainSelection As Integer
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
			  Dim sz As Integer = Me.SendMessage(Scintilla.SCI.GETSELTEXT)
			  Dim mb As New MemoryBlock(sz)
			  Call Me.SendMessage(Scintilla.SCI.GETSELTEXT, Nil, mb)
			  Return mb
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Dim mb As New MemoryBlock(value.LenB + 2)
			  mb.CString(0) = value + Chr(0)
			  Call Me.SendMessage(Scintilla.SCI.TARGETFROMSELECTION)
			  Call Me.SendMessage(Scintilla.SCI.REPLACETARGET, -1, mb)
			  
			End Set
		#tag EndSetter
		Text As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowMultiple"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Anchor"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Caret"
			Group="Behavior"
			Type="Integer"
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
			Name="MainSelection"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
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
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Text"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
