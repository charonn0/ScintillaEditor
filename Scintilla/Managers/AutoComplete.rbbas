#tag Class
Protected Class AutoComplete
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Sub Dismiss(AcceptSelection As Boolean)
		  If AcceptSelection Then
		    Call Me.SendMessage(Scintilla.SCI.AUTOCCOMPLETE)
		  Else
		    Call Me.SendMessage(Scintilla.SCI.AUTOCCANCEL)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Popup(PartialWord As String, Matches() As String)
		  Call Me.SendMessage(Scintilla.SCI.AUTOCSHOW, PartialWord.Len, Join(Matches, ListSeparator))
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim sz As Integer = Me.SendMessage(Scintilla.SCI.AUTOCGETCURRENT)
			  Dim mb As New MemoryBlock(sz + 2)
			  Call Me.SendMessage(Scintilla.SCI.AUTOCGETCURRENT, Nil, mb)
			  Return mb.CString(0)
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.AUTOCSELECT, Nil, value)
			End Set
		#tag EndSetter
		CurrentSelection As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim c As Integer = Me.SendMessage(Scintilla.SCI.AUTOCGETSEPARATOR)
			  Dim s As String = Chr(c)
			  Return s
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value.Len > 1 Then value = Left(value, 1)
			  Call Me.SendMessage(Scintilla.SCI.AUTOCSETSEPARATOR, Asc(value))
			End Set
		#tag EndSetter
		ListSeparator As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="CurrentSelection"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="ListSeparator"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
