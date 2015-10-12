#tag Class
Protected Class CallTip
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Sub Dismiss()
		  Call Me.SendMessage(Scintilla.SCI.CALLTIPCANCEL)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsActive() As Boolean
		  Return Me.SendMessage(Scintilla.SCI.CALLTIPACTIVE) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Popup(Position As Integer, TipText As String)
		  Dim mb As New MemoryBlock(TipText.LenB + 1)
		  mb.CString(0) = TipText
		  Call Me.SendMessage(Scintilla.SCI.CALLTIPSHOW, Position, mb)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Note
			The position of the caret when Popup was last/next called
		#tag EndNote
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.CALLTIPPOSSTART)
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.CALLTIPSETPOSSTART, value)
			End Set
		#tag EndSetter
		Position As Integer
	#tag EndComputedProperty


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
			Name="Position"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
