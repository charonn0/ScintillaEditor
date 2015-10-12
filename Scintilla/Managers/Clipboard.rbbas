#tag Class
Protected Class Clipboard
Inherits Scintilla.Managers.BaseManager
	#tag Method, Flags = &h0
		Function CanCopy() As Boolean
		  Return Me.SendMessage(Scintilla.SCI.GETSELECTIONEMPTY) = 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanPaste() As Boolean
		  Return Me.SendMessage(Scintilla.SCI.CANPASTE) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Copy(AllowLine As Boolean = False, StartPosition As Integer = - 1, EndPosition As Integer = - 1)
		  If StartPosition = -1 And EndPosition = -1 Then ' copy from selection
		    If AllowLine Then
		      Call Me.SendMessage(Scintilla.SCI.COPYALLOWLINE)
		    Else
		      Call Me.SendMessage(Scintilla.SCI.COPY)
		    End If
		  Else ' copy range
		    If StartPosition = -1 Then StartPosition = 0
		    If EndPosition = -1 Then EndPosition = Me.Field.CurrentDocument.Text.Len
		    Call Me.SendMessage(Scintilla.SCI.COPYRANGE, StartPosition, EndPosition)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Cut()
		  If CanCopy Then Call Me.SendMessage(Scintilla.SCI.CUT)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paste()
		  If CanPaste Then Call Me.SendMessage(Scintilla.SCI.PASTE)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Me.SendMessage(Scintilla.SCI.GETPASTECONVERTENDINGS) <> 0
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  Call Me.SendMessage(Scintilla.SCI.SETPASTECONVERTENDINGS, value)
			End Set
		#tag EndSetter
		PasteConvertsEOL As Boolean
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
			Name="PasteConvertsEOL"
			Group="Behavior"
			Type="Boolean"
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
